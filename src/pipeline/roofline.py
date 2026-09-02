# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Compute-roofline analysis for the pre-decoder on the Alveo U55C.

Why this matters more than an implementation speedup
----------------------------------------------------
The predecessor project built a real, timing-closed bitstream for this
architecture and measured 13.0-15.3 ms per shot, roughly four orders of
magnitude above the microsecond-scale target that motivates FPGA decoding at
all. The obvious reading is "the HLS implementation was bad, optimise it".
That reading is only half right, and the more useful question is the one this
module answers: what is the *best possible* latency for this architecture on
this device, independent of how well anyone writes the kernel?

The answer bounds the whole design space. If the roofline itself sits above
the QEC round period, no amount of pipelining, unrolling or HBM parallelism
can reach real time, and the correct response is to change the architecture
rather than the implementation. Reporting a measured speedup without this
bound would leave a reader unable to tell which situation they are in.

Assumptions, all explicit and all conservative in the stated direction:

* DSP count and clock come from results/device.json, which is queried from
  the Vivado part database and XRT, not remembered.
* One DSP48E2 slice performs one multiply-accumulate per cycle at 16-bit or
  wider operands. For INT8, AMD documents packing two MACs into one DSP via
  the 27-bit pre-adder, so INT8 is credited 2 MAC/DSP/cycle. Ternary and
  INT4 are credited the same 2x rather than a larger factor: below INT8 the
  multiplications are cheap enough that LUT fabric, not DSPs, usually
  dominates, and modelling that properly needs a synthesis run rather than an
  analytical factor. This *understates* low-precision performance, so a
  conclusion of "still too slow" drawn from it is safe.
* The bound counts multiply-accumulates only. Data movement, activation
  functions, control and the matching decoder are all free. Real designs are
  strictly slower, never faster.
"""
from __future__ import annotations

import json
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Dict, Optional

REPO_ROOT = Path(__file__).resolve().parent.parent.parent

# MACs per DSP per cycle, by weight precision. See module docstring.
MAC_PER_DSP: Dict[str, float] = {
    "fp32": 0.5,   # a float multiply-add consumes multiple DSP slices
    "int16": 1.0,
    "int8": 2.0,
    "int4": 2.0,
    "ternary": 2.0,
}


@dataclass
class RooflineResult:
    precision: str
    macs_per_shot: int
    rounds_per_shot: int
    macs_per_round: float
    dsp_total: int
    dsp_used: int
    dsp_utilisation: float
    clock_mhz: float
    peak_mac_per_s: float
    min_shot_latency_us: float
    max_throughput_shots_per_s: float
    round_period_us: float
    logical_qubits_per_card: float
    meets_round_budget: bool
    note: str

    def to_dict(self) -> dict:
        return asdict(self)


def load_device(path: Optional[Path] = None) -> dict:
    path = path or (REPO_ROOT / "results" / "device.json")
    return json.loads(path.read_text())


def roofline(
    macs_per_shot: int,
    rounds_per_shot: int,
    precision: str = "int8",
    clock_mhz: float = 300.0,
    dsp_utilisation: float = 1.0,
    round_period_us: float = 1.0,
    device: Optional[dict] = None,
) -> RooflineResult:
    """Best-case latency and throughput for one decoder pipeline.

    `dsp_utilisation` is the fraction of the device's DSPs the design manages
    to keep busy every cycle. 1.0 is the physical bound and is not reachable:
    the platform shell reserves resources, routing limits placement, and no
    real kernel keeps every DSP fed. Numbers at 1.0 are stated as bounds, and
    a realistic figure is obtained by passing a measured utilisation.
    """
    if precision not in MAC_PER_DSP:
        raise ValueError(f"unknown precision {precision!r}; known: {sorted(MAC_PER_DSP)}")
    if not 0 < dsp_utilisation <= 1.0:
        raise ValueError("dsp_utilisation must be in (0, 1]")

    device = device or load_device()
    dsp_total = int(device["resources"]["dsp"])
    dsp_used = int(dsp_total * dsp_utilisation)

    peak = dsp_used * MAC_PER_DSP[precision] * clock_mhz * 1e6
    min_latency_s = macs_per_shot / peak
    throughput = peak / macs_per_shot

    # A logical qubit emits one syndrome round every round_period_us. The
    # network consumes a whole detection volume of rounds_per_shot rounds, so
    # sustaining one qubit costs macs_per_round MACs every round period.
    macs_per_round = macs_per_shot / rounds_per_shot
    required_mac_per_s_per_qubit = macs_per_round / (round_period_us * 1e-6)
    qubits = peak / required_mac_per_s_per_qubit

    return RooflineResult(
        precision=precision,
        macs_per_shot=int(macs_per_shot),
        rounds_per_shot=int(rounds_per_shot),
        macs_per_round=macs_per_round,
        dsp_total=dsp_total,
        dsp_used=dsp_used,
        dsp_utilisation=dsp_utilisation,
        clock_mhz=clock_mhz,
        peak_mac_per_s=peak,
        min_shot_latency_us=min_latency_s * 1e6,
        max_throughput_shots_per_s=throughput,
        round_period_us=round_period_us,
        logical_qubits_per_card=qubits,
        meets_round_budget=(min_latency_s * 1e6) <= round_period_us,
        note=(
            "Compute-only bound: multiply-accumulates at the stated precision, "
            "ignoring data movement, activations, control and matching. A real "
            "implementation is strictly slower."
        ),
    )


def architecture_macs(
    depth: int, width: int, out_channels: int, volume: int, in_channels: int = 1, kernel: int = 27
) -> int:
    """MACs for the PreDecoder3D topology: `depth` k=3 conv layers then a 1x1x1 head."""
    macs = in_channels * width * kernel * volume          # first hidden layer
    macs += (depth - 1) * width * width * kernel * volume  # remaining hidden layers
    macs += width * out_channels * 1 * volume              # 1x1x1 output head
    return int(macs)


def required_width_for_budget(
    depth: int,
    out_channels: int,
    volume: int,
    rounds_per_shot: int,
    target_qubits: float,
    precision: str = "int8",
    clock_mhz: float = 300.0,
    dsp_utilisation: float = 0.5,
    round_period_us: float = 1.0,
    device: Optional[dict] = None,
) -> dict:
    """Largest channel width whose roofline still serves `target_qubits`.

    This is the actionable inverse of `roofline`: if the current architecture
    is too heavy, it says how much narrower it would have to be, which is a
    concrete design target rather than an exhortation to optimise.
    """
    device = device or load_device()
    best = None
    for width in range(1, 257):
        macs = architecture_macs(depth, width, out_channels, volume)
        r = roofline(macs, rounds_per_shot, precision, clock_mhz,
                     dsp_utilisation, round_period_us, device)
        if r.logical_qubits_per_card >= target_qubits:
            best = {"width": width, "macs_per_shot": macs,
                    "logical_qubits_per_card": r.logical_qubits_per_card,
                    "min_shot_latency_us": r.min_shot_latency_us}
        else:
            break
    return {
        "target_qubits": target_qubits,
        "precision": precision,
        "clock_mhz": clock_mhz,
        "dsp_utilisation": dsp_utilisation,
        "feasible": best is not None,
        "max_feasible": best,
        "note": (
            "Widths are searched upward and the search stops at the first width "
            "that misses the target, since MACs increase monotonically in width."
        ),
    }
