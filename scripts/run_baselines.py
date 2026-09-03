#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Phase 1: PyMatching (Sparse Blossom) baselines across the (d, p) grid.

Runs the Monte Carlo with sinter, which handles multiprocess shot batching
and the "keep sampling until enough logical errors" stopping rule correctly.
Every collected point is written as one schema-conforming JSON under
results/, and the whole grid is then fit for a threshold.

Per R5 of the build spec, these are *our* measurements on *our* machine, not
numbers quoted from the PyMatching or Sparse Blossom papers. The decoder
version and host are recorded in results/env.json and referenced from each
result file.

Usage:
    python scripts/run_baselines.py --quick     # small smoke grid
    python scripts/run_baselines.py             # full grid
"""
from __future__ import annotations

import argparse
import datetime
import json
import subprocess
from pathlib import Path
from typing import List

import numpy as np
import sinter
import stim

from src.qec.circuits import NoiseModel, build_rotated_surface_code_circuit
from src.qec.metrics import clopper_pearson_interval, per_round_error_rate
from src.qec.stats import ThresholdPoint, fit_threshold

REPO_ROOT = Path(__file__).resolve().parent.parent
RESULTS_DIR = REPO_ROOT / "results" / "baselines"


def git_commit() -> str:
    try:
        return subprocess.check_output(
            ["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True
        ).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown"


def build_tasks(distances: List[int], probabilities: List[float], basis: str) -> List[sinter.Task]:
    tasks = []
    for d in distances:
        rounds = d
        for p in probabilities:
            circuit = build_rotated_surface_code_circuit(
                distance=d, rounds=rounds, basis=basis, noise=NoiseModel.uniform_depolarizing(p)
            )
            tasks.append(
                sinter.Task(
                    circuit=circuit,
                    json_metadata={"d": d, "r": rounds, "p": p, "basis": basis},
                )
            )
    return tasks


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--quick", action="store_true", help="small grid for smoke testing")
    parser.add_argument("--basis", default="z", choices=["x", "z"])
    parser.add_argument("--max-shots", type=int, default=20_000_000)
    parser.add_argument("--max-errors", type=int, default=1_000)
    parser.add_argument("--workers", type=int, default=60)
    parser.add_argument("--decoder", default="pymatching")
    parser.add_argument(
        "--out-dir", type=Path, default=None,
        help="where to write result JSONs; defaults to results/baselines for a "
             "full run and results/smoke for --quick, so a smoke run can never "
             "overwrite real data with a few-thousand-shot stand-in",
    )
    args = parser.parse_args()

    # A quick run is a pipeline check, not a measurement. Writing it into the
    # canonical results directory would silently replace 20M-shot cells with
    # 20k-shot ones and shift every aggregate derived from them -- which is
    # exactly what it did to the threshold fit (0.695% -> 0.542%) the first
    # time CI ran it.
    results_dir = args.out_dir or (
        REPO_ROOT / "results" / ("smoke" if args.quick else "baselines")
    )

    if args.quick:
        distances = [3, 5]
        probabilities = [0.001, 0.003, 0.005, 0.008, 0.01]
        max_shots, max_errors = 200_000, 300
    else:
        distances = [3, 5, 7, 9]
        # 11 log-spaced points spanning the spec's [1e-3, 1e-2] range. The
        # circuit-level threshold for this noise model sits near the upper
        # half of that range, so the grid brackets it on both sides.
        probabilities = [float(v) for v in np.geomspace(1e-3, 1e-2, 11)]
        max_shots, max_errors = args.max_shots, args.max_errors

    tasks = build_tasks(distances, probabilities, args.basis)
    print(f"collecting {len(tasks)} tasks with {args.workers} workers "
          f"(max_shots={max_shots:,}, max_errors={max_errors:,}, decoder={args.decoder})")

    samples = sinter.collect(
        num_workers=args.workers,
        tasks=tasks,
        decoders=[args.decoder],
        max_shots=max_shots,
        max_errors=max_errors,
        print_progress=True,
    )

    results_dir.mkdir(parents=True, exist_ok=True)
    commit = git_commit()
    timestamp = datetime.datetime.now(datetime.timezone.utc).isoformat()

    points: List[ThresholdPoint] = []
    written = 0
    for s in samples:
        meta = s.json_metadata
        d, r, p = meta["d"], meta["r"], meta["p"]
        shots, errors = s.shots, s.errors
        ler = errors / shots if shots else float("nan")
        ci_low, ci_high = clopper_pearson_interval(errors, shots)

        experiment_id = f"d{d}_r{r}_p{p:.6g}_{args.decoder}_baseline"
        record = {
            "experiment_id": experiment_id,
            "timestamp": timestamp,
            "git_commit": commit,
            "tier": "T4",
            "config": {
                "distance": d,
                "rounds": r,
                "p": p,
                "basis": args.basis,
                "decoder": args.decoder,
                "noise_model": "uniform_depolarizing",
                "circuit": f"surface_code:rotated_memory_{args.basis}",
            },
            "metrics": {
                "logical_error_rate": ler,
                "ci_low": ci_low,
                "ci_high": ci_high,
                "ci_method": "clopper-pearson-95",
                "logical_error_rate_per_round": per_round_error_rate(ler, r),
                "shots": shots,
                "errors": errors,
                "discards": s.discards,
                "seconds": s.seconds,
                "throughput_shots_per_s": shots / s.seconds if s.seconds else None,
            },
            "env_ref": "results/env.json",
            "provenance_note": (
                "Logical error rates are Monte Carlo estimates from Stim-simulated "
                "circuits (T4 by definition -- a simulated quantum device). The decoder "
                "wall-clock time is a real measurement on the host in results/env.json, "
                "but is an aggregate over sinter's multiprocess batch decoding and is "
                "NOT a per-shot latency figure; see results/latency/ for that."
            ),
        }
        (results_dir / f"{experiment_id}.json").write_text(json.dumps(record, indent=2) + "\n")
        written += 1
        points.append(ThresholdPoint(distance=d, p=p, shots=shots, errors=errors))

    print(f"wrote {written} result files to {results_dir}")

    fit = fit_threshold(points, n_bootstrap=500, seed=0)
    fit_record = {
        "experiment_id": f"threshold_fit_{args.decoder}_baseline",
        "timestamp": timestamp,
        "git_commit": commit,
        "tier": "T4",
        "config": {
            "decoder": args.decoder,
            "basis": args.basis,
            "distances": distances,
            "probabilities": probabilities,
            "ansatz": "p_L = A + B*x + C*x^2, x = (p - p_th) * d^(1/nu)",
        },
        "fit": fit.to_dict(),
        "env_ref": "results/env.json",
    }
    out = results_dir.parent / f"threshold_fit_{args.decoder}_baseline.json" \
        if not args.quick else results_dir / f"threshold_fit_{args.decoder}_smoke.json"
    out.write_text(json.dumps(fit_record, indent=2) + "\n")
    print(f"threshold fit: p_th = {fit.p_th:.5f} "
          f"[{fit.p_th_ci_low:.5f}, {fit.p_th_ci_high:.5f}], nu = {fit.nu:.3f} ({fit.message})")
    print(f"wrote {out}")


if __name__ == "__main__":
    main()
