#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Fit a threshold from already-collected result JSONs (no Monte Carlo re-run).

Kept separate from scripts/run_baselines.py so the fit can be re-done, and its
sensitivity re-examined, without paying for the sampling again.

Reports the fitted p_th at a nominal window plus the spread across a range of
windows. That spread is a real systematic: the collapse ansatz is only valid
near the threshold, so how much data you admit to the fit moves the answer,
and quoting a bootstrap CI alone would understate the true uncertainty.
"""
from __future__ import annotations

import argparse
import datetime
import glob
import json
import subprocess
from pathlib import Path
from typing import List

from src.qec.stats import ThresholdPoint, estimate_crossing, fit_threshold

REPO_ROOT = Path(__file__).resolve().parent.parent


def git_commit() -> str:
    try:
        return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown"


def load_points(pattern: str) -> List[ThresholdPoint]:
    points = []
    for path in sorted(glob.glob(pattern)):
        d = json.load(open(path))
        cfg, met = d["config"], d["metrics"]
        points.append(
            ThresholdPoint(
                distance=cfg["distance"], p=cfg["p"], shots=met["shots"], errors=met["errors"]
            )
        )
    return points


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--glob", default=str(REPO_ROOT / "results" / "baselines" / "*.json"))
    ap.add_argument("--label", default="pymatching_baseline")
    ap.add_argument("--window", type=float, default=0.4)
    ap.add_argument("--n-bootstrap", type=int, default=500)
    args = ap.parse_args()

    points = load_points(args.glob)
    if not points:
        raise SystemExit(f"no result files matched {args.glob}")

    crossing = estimate_crossing(points)
    nominal = fit_threshold(points, n_bootstrap=args.n_bootstrap, seed=0, window=args.window)

    sensitivity = {}
    for w in (0.25, 0.3, 0.35, 0.4, 0.45, 0.5):
        f = fit_threshold(points, n_bootstrap=0, seed=0, window=w)
        sensitivity[f"{w:.2f}"] = {"p_th": f.p_th, "nu": f.nu, "n_points": f.n_points}
    spread = [v["p_th"] for v in sensitivity.values()]

    record = {
        "experiment_id": f"threshold_fit_{args.label}",
        "timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "git_commit": git_commit(),
        "tier": "T4",
        "config": {
            "source_glob": args.glob,
            "nominal_window": args.window,
            "ansatz": "p_L = A + B*x + C*x^2, x = (p - p_th) * d^(1/nu)",
            "n_input_points": len(points),
        },
        "crossing_estimate": crossing,
        "fit": nominal.to_dict(),
        "window_sensitivity": sensitivity,
        "p_th_window_spread": {
            "min": min(spread),
            "max": max(spread),
            "note": (
                "Spread of the fitted p_th across fitting windows from 0.25 to 0.50. "
                "This is a systematic uncertainty from the choice of how much data the "
                "local collapse ansatz is fitted over, and is wider than the bootstrap "
                "statistical CI; both are reported and the paper quotes both."
            ),
        },
        "env_ref": "results/env.json",
    }

    out = REPO_ROOT / "results" / f"threshold_fit_{args.label}.json"
    out.write_text(json.dumps(record, indent=2) + "\n")
    print(f"crossing estimate      : {crossing:.5f}")
    print(f"p_th (window={args.window})   : {nominal.p_th:.5f} "
          f"[{nominal.p_th_ci_low:.5f}, {nominal.p_th_ci_high:.5f}] (bootstrap 95%)")
    print(f"p_th window sensitivity: {min(spread):.5f} .. {max(spread):.5f}")
    print(f"nu                     : {nominal.nu:.3f}")
    print(f"wrote {out}")


if __name__ == "__main__":
    main()
