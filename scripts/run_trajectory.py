#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Test the objective-misalignment claim by tracking both metrics together.

The paper argues that the per-mechanism training loss is misaligned with what
the decoder is actually for: driving the loss down makes the network apply
more confident corrections, and each wrong correction corrupts a syndrome the
matcher would have decoded correctly.

That is a claim about a *relationship between two curves*, so a single
end-of-training number cannot support it. This evaluates every training
snapshot at a fixed operating point and records (training loss, logical error
rate) pairs. If the loss falls while the logical error rate rises, the two
objectives demonstrably disagree and the claim is measured rather than
asserted. If they fall together, the claim is wrong and the paper must say so.

The same held-out shots are used for every snapshot, so differences between
snapshots are differences in the model and not in the evaluation sample.
"""
from __future__ import annotations

import argparse
import datetime
import json
import re
import subprocess
import sys
from pathlib import Path
from typing import List

import numpy as np
import torch

REPO_ROOT = Path(__file__).resolve().parent.parent
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from scripts.run_hierarchical import load_checkpoint, run_predecoder
from src.pipeline.hierarchical import oracle_bounds
from src.qec import metrics as qec_metrics
from src.qec.circuits import NoiseModel, build_rotated_surface_code_circuit
from src.qec.dem import build_detector_error_model, build_matching_graph
from src.qec.sampling import sample_detection_volume


def git_commit() -> str:
    try:
        return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--pattern", default="models/predecoder_R5_traj_at*.pt")
    ap.add_argument("--metrics", type=Path,
                    default=REPO_ROOT / "results" / "training" / "train_R5_traj.json")
    ap.add_argument("--distance", type=int, default=5)
    ap.add_argument("--p", type=float, default=0.003)
    ap.add_argument("--shots", type=int, default=150_000)
    ap.add_argument("--seed", type=int, default=999)
    ap.add_argument("--device", default="cuda" if torch.cuda.is_available() else "cpu")
    ap.add_argument("--tag", default="traj")
    args = ap.parse_args()

    paths = sorted(
        REPO_ROOT.glob(args.pattern),
        key=lambda q: int(re.search(r"_at(\d+)\.pt$", q.name).group(1)),
    )
    if not paths:
        raise SystemExit(f"no snapshots matched {args.pattern}")

    # One circuit, one shot set, reused for every snapshot.
    d, p = args.distance, args.p
    circuit = build_rotated_surface_code_circuit(
        d, d, "z", NoiseModel.uniform_depolarizing(p)
    )
    matcher = build_matching_graph(build_detector_error_model(circuit))
    sampled = sample_detection_volume(circuit, d, d, args.shots, args.seed)
    baseline_pred = matcher.decode_batch(sampled.flat_detectors.astype(bool)).astype(bool)
    ler_base, _, _ = qec_metrics.logical_error_rate(
        baseline_pred, sampled.observables, method="clopper-pearson"
    )
    print(f"baseline LER = {ler_base:.6f} over {args.shots:,} shots at d={d}, p={p}\n")

    loss_by_shots = {}
    if args.metrics.exists():
        for h in json.load(open(args.metrics)).get("history", []):
            loss_by_shots[int(h["shots"])] = float(h["loss"])

    rows: List[dict] = []
    print(f"{'shots':>13} {'loss':>10} {'LER':>10} {'ratio':>7} {'oracle':>8} {'saves':>6} {'breaks':>7}")
    for path in paths:
        shots_trained = int(re.search(r"_at(\d+)\.pt$", path.name).group(1))
        model, ckpt = load_checkpoint(path)
        out = run_predecoder(model, ckpt, circuit, sampled, d, 0.5, args.device)

        pre = matcher.decode_batch(out.residual_flat).astype(bool)
        pre = pre ^ out.local_obs_parity.reshape(-1, 1)
        ler_pre, lo, hi = qec_metrics.logical_error_rate(
            pre, sampled.observables, method="clopper-pearson"
        )
        orc = oracle_bounds(pre, baseline_pred, sampled.observables)

        # Nearest recorded loss: the trainer logs at the same cadence it
        # snapshots, but the shot counts are batch-rounded.
        loss = None
        if loss_by_shots:
            nearest = min(loss_by_shots, key=lambda s: abs(s - shots_trained))
            if abs(nearest - shots_trained) <= 5_000_000:
                loss = loss_by_shots[nearest]

        row = {
            "shots_trained": shots_trained,
            "train_loss": loss,
            "ler_predecoder": ler_pre,
            "ci_low": lo,
            "ci_high": hi,
            "ler_baseline": ler_base,
            "ler_ratio": ler_pre / ler_base if ler_base else float("nan"),
            "ler_oracle": orc["ler_oracle"],
            "oracle_ratio": orc["ler_oracle"] / ler_base if ler_base else float("nan"),
            "saves": orc["n_predecoder_saves"],
            "breaks": orc["n_predecoder_breaks"],
        }
        rows.append(row)
        print(f"{shots_trained:>13,} {loss if loss is not None else float('nan'):>10.6f} "
              f"{ler_pre:>10.6f} {row['ler_ratio']:>7.2f} {row['oracle_ratio']:>8.3f} "
              f"{row['saves']:>6} {row['breaks']:>7}", flush=True)

    # Does the loss disagree with the logical error rate?
    pairs = [(r["train_loss"], r["ler_ratio"]) for r in rows if r["train_loss"] is not None]
    correlation = None
    if len(pairs) >= 3:
        a = np.array([q[0] for q in pairs])
        b = np.array([q[1] for q in pairs])
        if a.std() > 0 and b.std() > 0:
            correlation = float(np.corrcoef(a, b)[0, 1])

    record = {
        "experiment_id": f"trajectory_{args.tag}_d{d}_p{p:.6g}",
        "timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "git_commit": git_commit(),
        "tier": "T4",
        "config": {
            "distance": d, "p": p, "shots": args.shots, "seed": args.seed,
            "snapshots": len(rows), "pattern": args.pattern,
        },
        "ler_baseline": ler_base,
        "trajectory": rows,
        "loss_vs_ler_correlation": correlation,
        "interpretation": (
            "Correlation between training loss and the pre-decoder's logical error "
            "rate ratio across training. A NEGATIVE value means the loss and the "
            "logical error rate move in opposite directions -- loss improving while "
            "decoding degrades -- which is direct evidence that the per-mechanism "
            "objective is misaligned with the decoding goal. A positive value would "
            "refute that claim."
        ),
        "env_ref": "results/env.json",
    }
    out_path = REPO_ROOT / "results" / f"trajectory_{args.tag}.json"
    out_path.write_text(json.dumps(record, indent=2) + "\n")
    if correlation is not None:
        verdict = ("loss and LER move in OPPOSITE directions (misalignment supported)"
                   if correlation < 0 else
                   "loss and LER move TOGETHER (misalignment NOT supported)")
        print(f"\ncorr(train_loss, LER ratio) = {correlation:+.3f} -> {verdict}")
    print(f"wrote {out_path}")


if __name__ == "__main__":
    main()
