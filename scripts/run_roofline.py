#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Emit the roofline analysis for the pre-decoder architecture on the U55C."""
from __future__ import annotations

import argparse
import datetime
import json
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from src.pipeline.roofline import (
    architecture_macs,
    load_device,
    required_width_for_budget,
    roofline,
)


def git_commit() -> str:
    try:
        return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--R", type=int, default=5)
    ap.add_argument("--width", type=int, default=64)
    ap.add_argument("--out-channels", type=int, default=14)
    ap.add_argument("--clock-mhz", type=float, default=300.0)
    ap.add_argument("--round-period-us", type=float, default=1.0)
    args = ap.parse_args()

    device = load_device()
    depth = (args.R - 1) // 2
    volume = (args.R + 1) ** 3
    rounds_per_shot = args.R + 1
    macs = architecture_macs(depth, args.width, args.out_channels, volume)

    print(f"architecture: R={args.R} depth={depth} width={args.width} "
          f"volume={volume} MACs/shot={macs:,}")
    print(f"device: {device['part']}  DSP={device['resources']['dsp']:,}  "
          f"clock={args.clock_mhz} MHz  round budget={args.round_period_us} us\n")

    rows = []
    print(f"{'precision':>9} {'util':>6} {'min latency':>13} {'throughput':>15} "
          f"{'qubits/card':>12} {'meets 1us?':>11}")
    for precision in ("fp32", "int16", "int8"):
        for util in (1.0, 0.5):
            r = roofline(macs, rounds_per_shot, precision, args.clock_mhz,
                         util, args.round_period_us, device)
            rows.append(r.to_dict())
            print(f"{precision:>9} {util:>6.0%} {r.min_shot_latency_us:>10.2f} us "
                  f"{r.max_throughput_shots_per_s:>12,.0f}/s "
                  f"{r.logical_qubits_per_card:>12.2f} {str(r.meets_round_budget):>11}")

    print("\nInverse question: how narrow must the network be to serve N logical qubits?")
    inverse = []
    for target in (1.0, 4.0, 16.0):
        inv = required_width_for_budget(
            depth, args.out_channels, volume, rounds_per_shot, target,
            precision="int8", clock_mhz=args.clock_mhz,
            dsp_utilisation=0.5, round_period_us=args.round_period_us, device=device,
        )
        inverse.append(inv)
        mf = inv["max_feasible"]
        if mf:
            print(f"  {target:>5.0f} qubits: width <= {mf['width']:>3d} "
                  f"({mf['macs_per_shot']:>12,} MACs/shot, "
                  f"{mf['min_shot_latency_us']:.2f} us/shot)")
        else:
            print(f"  {target:>5.0f} qubits: infeasible at any width >= 1")

    record = {
        "experiment_id": f"roofline_R{args.R}_w{args.width}",
        "timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "git_commit": git_commit(),
        "tier": "T4",
        "config": {
            "R": args.R, "depth": depth, "width": args.width,
            "out_channels": args.out_channels, "volume": volume,
            "rounds_per_shot": rounds_per_shot, "macs_per_shot": macs,
            "clock_mhz": args.clock_mhz, "round_period_us": args.round_period_us,
            "device_part": device["part"], "dsp_total": device["resources"]["dsp"],
        },
        "roofline": rows,
        "required_width": inverse,
        "measured_comparison": {
            "predecessor_measured_latency_ms": [13.0, 15.3],
            "predecessor_kernel_clock_mhz": 100,
            "predecessor_dsp_used": 331,
            "source": "fpga-neural-predecoder results/metrics/hw_build_int8.json",
            "note": (
                "The predecessor's measured 13-15 ms used 331 of 9024 DSPs (3.7%) at "
                "100 MHz. The gap to the roofline is therefore partly implementation "
                "(a tiny fraction of the device was doing work) and partly "
                "architectural (even the whole device cannot reach the round budget)."
            ),
        },
        "env_ref": "results/env.json",
    }
    out = REPO_ROOT / "results" / f"roofline_R{args.R}_w{args.width}.json"
    out.write_text(json.dumps(record, indent=2) + "\n")
    print(f"\nwrote {out}")


if __name__ == "__main__":
    main()
