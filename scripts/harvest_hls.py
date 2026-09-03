#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Parse a Vitis HLS csynth report into a schema-conforming result JSON.

Reads the numbers out of the report rather than having anyone transcribe them,
so an HLS figure in the paper traces to a file the tool wrote.

Every record this produces carries `functionally_verified`. At the time of
writing that is false: the kernel's csim disagrees with the golden model at
width 12 (NOTES/blockers.md, B5). Resource and latency estimates from an
unverified datapath are still meaningful -- they describe the shape of the
computation, which is settled by the loop structure and the operator counts --
but they must never be presented as though the design is known to compute the
right answer, so the flag travels with the data.
"""
from __future__ import annotations

import argparse
import datetime
import json
import re
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from src.pipeline.roofline import architecture_macs, load_device, roofline


def git_commit() -> str:
    try:
        return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown"


def parse_report(text: str) -> dict:
    out: dict = {}

    m = re.search(r"\|ap_clk\s*\|\s*([\d.]+) ns\|\s*([\d.]+) ns\|\s*([\d.]+) ns\|", text)
    if m:
        out["clock_target_ns"] = float(m.group(1))
        out["clock_estimated_ns"] = float(m.group(2))
        out["clock_uncertainty_ns"] = float(m.group(3))

    # Top-level latency row: min/max cycles then min/max absolute.
    m = re.search(r"\|\s*(\d+)\|\s*(\d+)\|\s*([\d.]+ [munp]?s)\|\s*([\d.]+ [munp]?s)\|\s*(\d+)\|\s*(\d+)\|\s*(\w+)\|", text)
    if m:
        out["latency_cycles_min"] = int(m.group(1))
        out["latency_cycles_max"] = int(m.group(2))
        out["interval_min"] = int(m.group(5))
        out["interval_max"] = int(m.group(6))
        out["pipeline_type"] = m.group(7)

    # Utilisation: the "Total" row followed by the device "Available" row.
    tot = re.search(r"\|Total\s*\|\s*(\d+)\|\s*(\d+)\|\s*(\d+)\|\s*(\d+)\|\s*(\d+)\|", text)
    avail = re.search(r"\|Available\s*\|\s*(\d+)\|\s*(\d+)\|\s*(\d+)\|\s*(\d+)\|\s*(\d+)\|", text)
    if tot and avail:
        keys = ["bram_18k", "dsp", "ff", "lut", "uram"]
        out["resources"] = {k: int(tot.group(i + 1)) for i, k in enumerate(keys)}
        out["device_available"] = {k: int(avail.group(i + 1)) for i, k in enumerate(keys)}
        out["utilisation_pct"] = {
            k: 100.0 * out["resources"][k] / out["device_available"][k]
            if out["device_available"][k] else None
            for k in keys
        }
    return out


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--report", type=Path, required=True)
    ap.add_argument("--width", type=int, required=True)
    ap.add_argument("--R", type=int, default=5)
    ap.add_argument("--out-channels", type=int, default=14)
    ap.add_argument("--functionally-verified", action="store_true",
                    help="set ONLY when csim/cosim have passed against the golden model")
    ap.add_argument("--tag", default=None)
    args = ap.parse_args()

    parsed = parse_report(args.report.read_text())
    tag = args.tag or f"w{args.width}"

    depth = (args.R - 1) // 2
    volume = (args.R + 1) ** 3
    rounds = args.R + 1
    macs = architecture_macs(depth, args.width, args.out_channels, volume)
    device = load_device()

    clock_ns = parsed.get("clock_target_ns", 3.33)
    clock_mhz = 1000.0 / clock_ns
    bound = roofline(macs, rounds, "int8", clock_mhz, 0.5, 1.0, device)

    cycles_max = parsed.get("latency_cycles_max")
    measured_us = cycles_max * clock_ns / 1000.0 if cycles_max else None
    gap = measured_us / bound.min_shot_latency_us if measured_us else None

    dsp_used = parsed.get("resources", {}).get("dsp")
    dsp_budget = int(device["resources"]["dsp"] * 0.5)

    record = {
        "experiment_id": f"csynth_{tag}",
        "timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "git_commit": git_commit(),
        "tier": "T3",
        "functionally_verified": bool(args.functionally_verified),
        "verification_note": (
            "csim currently disagrees with the golden model for this configuration; "
            "see NOTES/blockers.md B5. These are resource and latency estimates for a "
            "datapath of the right shape, not evidence that it computes correct values."
        ) if not args.functionally_verified else "csim/cosim passed against the golden model.",
        "config": {
            "width": args.width, "R": args.R, "depth": depth, "volume": volume,
            "out_channels": args.out_channels, "macs_per_shot": macs,
            "part": device["part"], "clock_target_ns": clock_ns,
            "clock_mhz": clock_mhz, "flow": "vitis_hls csynth_design",
        },
        "csynth": parsed,
        "roofline_comparison": {
            "roofline_min_latency_us_int8_50pct_dsp": bound.min_shot_latency_us,
            "csynth_latency_us_worst_case": measured_us,
            "implementation_gap_x": gap,
            "dsp_used": dsp_used,
            "dsp_budget_at_50pct": dsp_budget,
            "dsp_provisioning_shortfall_x": (dsp_budget / dsp_used) if dsp_used else None,
            "note": (
                "The gap between the synthesised latency and the roofline decomposes "
                "into how few DSPs the design instantiates against the budget the bound "
                "assumes, and the residual inefficiency per DSP. The kernel deliberately "
                "serialises its input-channel reduction to avoid a BRAM blow-up (see the "
                "comment in hw/hls/predecoder_kernel.cpp), so a large shortfall here is "
                "an expected consequence of that choice rather than a surprise."
            ),
        },
        "env_ref": "results/env.json",
    }

    out_dir = REPO_ROOT / "results" / "hw"
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path = out_dir / f"csynth_{tag}.json"
    out_path.write_text(json.dumps(record, indent=2) + "\n")

    print(f"width={args.width}  MACs/shot={macs:,}")
    print(f"  clock target {clock_ns} ns, estimated {parsed.get('clock_estimated_ns')} ns")
    print(f"  latency {parsed.get('latency_cycles_min'):,}-{parsed.get('latency_cycles_max'):,} cycles "
          f"= {measured_us:.1f} us worst case" if cycles_max else "  latency: not parsed")
    if "resources" in parsed:
        r, u = parsed["resources"], parsed["utilisation_pct"]
        print(f"  LUT {r['lut']:,} ({u['lut']:.1f}%)  FF {r['ff']:,} ({u['ff']:.1f}%)  "
              f"DSP {r['dsp']:,} ({u['dsp']:.1f}%)  BRAM {r['bram_18k']:,}  URAM {r['uram']:,}")
    print(f"  roofline bound {bound.min_shot_latency_us:.2f} us -> implementation gap {gap:.0f}x"
          if gap else "")
    print(f"  functionally_verified = {record['functionally_verified']}")
    print(f"wrote {out_path}")


if __name__ == "__main__":
    main()
