#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Train and evaluate the pre-decoder across channel widths.

Motivated directly by the roofline (src/pipeline/roofline.py): at 50% DSP
utilisation and INT8 on the U55C, width 64 serves well under one logical
qubit, while width 52 / 25 / 12 serve roughly 1 / 4 / 16. Width is therefore
the axis that decides deployability, and the question this sweep answers is
what accuracy it costs.

Each width is trained from scratch on a fresh shot stream and then evaluated
through the full gated hierarchical decoder, so the resulting table is
directly comparable across widths.
"""
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from src.nn.train_gpu import TrainConfig, train
from src.pipeline.roofline import architecture_macs, load_device, roofline


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--widths", type=int, nargs="+", default=[12, 25, 52, 64])
    ap.add_argument("--R", type=int, default=5)
    ap.add_argument("--total-shots", type=int, default=100_000_000)
    ap.add_argument("--num-workers", type=int, default=12)
    ap.add_argument("--batch-size", type=int, default=4096)
    ap.add_argument("--train-p", type=float, default=0.006)
    ap.add_argument("--seed", type=int, default=0)
    args = ap.parse_args()

    device = load_device()
    depth = (args.R - 1) // 2
    volume = (args.R + 1) ** 3
    rounds_per_shot = args.R + 1

    summary = []
    for width in args.widths:
        tag = f"w{width}"
        macs = architecture_macs(depth, width, 14, volume)
        r = roofline(macs, rounds_per_shot, "int8", 300.0, 0.5, 1.0, device)
        print(f"\n===== width={width} MACs/shot={macs:,} "
              f"roofline@int8,50%: {r.min_shot_latency_us:.2f} us/shot, "
              f"{r.logical_qubits_per_card:.2f} qubits/card =====", flush=True)

        cfg = TrainConfig(
            R=args.R, width=width, train_p=args.train_p,
            total_shots=args.total_shots, batch_size=args.batch_size,
            num_workers=args.num_workers, seed=args.seed, tag=tag,
            log_every_shots=max(args.total_shots // 4, 1),
        )
        out = train(
            cfg,
            out_dir=REPO_ROOT / "models",
            metrics_path=REPO_ROOT / "results" / "training" / f"train_R{args.R}_{tag}.json",
        )
        summary.append({
            "width": width,
            "macs_per_shot": macs,
            "checkpoint": out["checkpoint_path"],
            "shots_trained": out["shots"],
            "train_seconds": out["seconds"],
            "final_loss": out["history"][-1]["loss"] if out["history"] else None,
            "roofline_int8_50pct": r.to_dict(),
        })
        (REPO_ROOT / "results" / "width_sweep_training.json").write_text(
            json.dumps(summary, indent=2) + "\n"
        )

    print("\n=== width sweep training complete ===")
    for s in summary:
        print(f"  width={s['width']:>3d} loss={s['final_loss']:.6f} "
              f"{s['train_seconds']/60:.1f} min -> {s['checkpoint']}")


if __name__ == "__main__":
    main()
