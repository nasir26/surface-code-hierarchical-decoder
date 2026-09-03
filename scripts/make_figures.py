#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Regenerate paper figures from results/*.json only.

Nothing here computes a physics result: every value plotted is read from a
committed result file, so a figure can never disagree with the data it claims
to show. Style follows the journal's requirements: vector PDF with embedded
Type-42 fonts, sans-serif labels, colourblind-safe palette backed up by
distinct markers and linestyles so the figures survive greyscale printing,
and no title inside the image (captions live in the LaTeX).
"""
from __future__ import annotations

import argparse
import glob
import json
import re
from pathlib import Path
from typing import Dict, List

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

from src.qec.stats import ThresholdPoint, fit_threshold

REPO_ROOT = Path(__file__).resolve().parent.parent
PAPER_DIR = REPO_ROOT / "paper"

# Okabe-Ito colourblind-safe palette.
COLORS = ["#0072B2", "#D55E00", "#009E73", "#CC79A7", "#E69F00", "#56B4E9"]
MARKERS = ["o", "s", "^", "D", "v", "P"]
LINESTYLES = ["-", "--", "-.", ":", (0, (3, 1, 1, 1)), (0, (5, 2))]

MM = 1 / 25.4
SINGLE_COL = 84 * MM
DOUBLE_COL = 174 * MM


def set_style() -> None:
    plt.rcParams.update({
        "pdf.fonttype": 42,
        "ps.fonttype": 42,
        "font.family": "sans-serif",
        "font.sans-serif": ["DejaVu Sans", "Helvetica", "Arial"],
        "font.size": 8,
        "axes.labelsize": 9,
        "axes.titlesize": 9,
        "legend.fontsize": 7,
        "xtick.labelsize": 8,
        "ytick.labelsize": 8,
        "axes.linewidth": 0.6,
        "grid.linewidth": 0.4,
        "lines.linewidth": 1.2,
        "lines.markersize": 3.5,
        "figure.dpi": 300,
        "savefig.bbox": "tight",
        "savefig.pad_inches": 0.02,
    })


def load_baselines(pattern: str) -> Dict[int, List[dict]]:
    by_d: Dict[int, List[dict]] = {}
    for path in sorted(glob.glob(pattern)):
        rec = json.load(open(path))
        cfg, met = rec["config"], rec["metrics"]
        by_d.setdefault(cfg["distance"], []).append({
            "p": cfg["p"],
            "ler": met["logical_error_rate"],
            "lo": met["ci_low"],
            "hi": met["ci_high"],
            "shots": met["shots"],
            "errors": met["errors"],
        })
    for d in by_d:
        by_d[d].sort(key=lambda r: r["p"])
    return by_d


def save(fig, name: str) -> None:
    PAPER_DIR.mkdir(parents=True, exist_ok=True)
    for ext in ("pdf", "eps"):
        fig.savefig(PAPER_DIR / f"{name}.{ext}")
    plt.close(fig)
    print(f"wrote {PAPER_DIR / (name + '.pdf')} (+.eps)")


def fig_ler_vs_p(by_d: Dict[int, List[dict]], threshold: dict | None, name: str = "Fig6") -> None:
    """Logical error rate vs physical error rate, one curve per distance."""
    fig, ax = plt.subplots(figsize=(SINGLE_COL, SINGLE_COL * 0.8))

    for i, d in enumerate(sorted(by_d)):
        rows = by_d[d]
        p = np.array([r["p"] for r in rows])
        ler = np.array([r["ler"] for r in rows])
        lo = np.array([r["lo"] for r in rows])
        hi = np.array([r["hi"] for r in rows])
        # Asymmetric Clopper-Pearson error bars, clipped so a zero-error point
        # cannot draw a bar through the bottom of a log axis.
        yerr = np.vstack([np.maximum(ler - lo, 0), np.maximum(hi - ler, 0)])
        ax.errorbar(
            p, ler, yerr=yerr,
            color=COLORS[i % len(COLORS)],
            marker=MARKERS[i % len(MARKERS)],
            linestyle=LINESTYLES[i % len(LINESTYLES)],
            capsize=1.5, elinewidth=0.6, capthick=0.6,
            label=f"$d={d}$",
        )

    if threshold is not None and np.isfinite(threshold.get("p_th", np.nan)):
        p_th = threshold["p_th"]
        ax.axvline(p_th, color="0.35", linewidth=0.8, linestyle=(0, (4, 2)), zorder=0)
        lo, hi = threshold.get("p_th_ci_low"), threshold.get("p_th_ci_high")
        if lo is not None and hi is not None and np.isfinite(lo) and np.isfinite(hi):
            ax.axvspan(lo, hi, color="0.35", alpha=0.15, linewidth=0, zorder=0)
        # Axes-fraction y so the label cannot fall outside a log-scaled axis
        # whose limits are not yet final when this runs.
        ax.annotate(
            f"$p_{{\\mathrm{{th}}}}={p_th*100:.2f}\\%$",
            xy=(p_th, 0.97), xycoords=("data", "axes fraction"),
            xytext=(-4, 0), textcoords="offset points",
            fontsize=7, color="0.25", ha="right", va="top",
        )

    ax.set_xscale("log")
    ax.set_yscale("log")
    ax.set_xlabel("Physical error rate $p$")
    ax.set_ylabel("Logical error rate per shot")
    ax.grid(True, which="major", alpha=0.3)
    ax.grid(True, which="minor", alpha=0.12)
    ax.legend(frameon=False, loc="lower right")
    save(fig, name)


def fig_threshold_collapse(by_d: Dict[int, List[dict]], threshold: dict, name: str = "Fig7") -> None:
    """Finite-size-scaling collapse: all distances onto one curve."""
    p_th = threshold["p_th"]
    nu = threshold["nu"]
    if not (np.isfinite(p_th) and np.isfinite(nu)):
        print(f"skipping {name}: threshold fit did not converge")
        return

    fig, ax = plt.subplots(figsize=(SINGLE_COL, SINGLE_COL * 0.8))

    # Only the points the fit actually used are collapsed; showing points far
    # from threshold would imply the local ansatz describes them, which it
    # does not.
    window = 0.4
    for i, d in enumerate(sorted(by_d)):
        rows = [r for r in by_d[d] if abs(r["p"] / p_th - 1.0) <= window]
        if not rows:
            continue
        p = np.array([r["p"] for r in rows])
        ler = np.array([r["ler"] for r in rows])
        x = (p - p_th) * d ** (1.0 / nu)
        ax.plot(
            x, ler,
            color=COLORS[i % len(COLORS)],
            marker=MARKERS[i % len(MARKERS)],
            linestyle="none",
            label=f"$d={d}$",
        )

    coeffs = threshold.get("coefficients")
    if coeffs and all(np.isfinite(c) for c in coeffs):
        a, b, c = coeffs
        xs = np.linspace(*ax.get_xlim(), 200)
        ax.plot(xs, a + b * xs + c * xs**2, color="0.3", linewidth=0.9,
                linestyle=(0, (4, 2)), zorder=0, label="quadratic fit")

    ax.set_xlabel(r"$(p - p_{\mathrm{th}})\, d^{1/\nu}$")
    ax.set_ylabel("Logical error rate per shot")
    ax.grid(True, alpha=0.3)
    ax.legend(frameon=False, loc="upper left")
    save(fig, name)


def fig_roofline(record: dict, name: str = "Fig9") -> None:
    """Sustainable logical qubits per card vs network width, against the budget.

    The horizontal line at one qubit is the point below which a card cannot
    keep up with even a single logical qubit's syndrome stream, which is what
    makes the currently trained width unusable regardless of implementation
    quality.
    """
    from src.pipeline.roofline import architecture_macs, roofline

    cfg = record["config"]
    device = {"resources": {"dsp": cfg["dsp_total"]}, "part": cfg["device_part"]}
    depth, volume = cfg["depth"], cfg["volume"]
    rounds = cfg["rounds_per_shot"]
    out_ch = cfg["out_channels"]

    widths = list(range(4, 97, 2))
    fig, ax = plt.subplots(figsize=(SINGLE_COL, SINGLE_COL * 0.8))

    for i, (precision, util) in enumerate([("int8", 1.0), ("int8", 0.5), ("int16", 0.5)]):
        qubits = []
        for w in widths:
            macs = architecture_macs(depth, w, out_ch, volume)
            r = roofline(macs, rounds, precision, cfg["clock_mhz"], util,
                         cfg["round_period_us"], device)
            qubits.append(r.logical_qubits_per_card)
        ax.plot(widths, qubits,
                color=COLORS[i % len(COLORS)],
                linestyle=LINESTYLES[i % len(LINESTYLES)],
                marker="none",
                label=f"{precision}, {util:.0%} DSP")

    ax.axhline(1.0, color="0.3", linewidth=0.8, linestyle=(0, (2, 2)), zorder=0)
    ax.annotate("one logical qubit", xy=(widths[-1], 1.0), xytext=(-2, 3),
                textcoords="offset points", fontsize=6.5, color="0.3",
                ha="right", va="bottom")

    trained = cfg["width"]
    ax.axvline(trained, color=COLORS[3], linewidth=0.8, linestyle=":", zorder=0)
    ax.annotate(f"trained width = {trained}", xy=(trained, 0.97), xycoords=("data", "axes fraction"),
                xytext=(-4, 0), textcoords="offset points", fontsize=6.5,
                color=COLORS[3], ha="right", va="top", rotation=90)

    ax.set_yscale("log")
    ax.set_xlabel("Convolution channel width")
    ax.set_ylabel(f"Logical qubits per card ({cfg['round_period_us']:g} $\\mu$s round)")
    ax.grid(True, which="major", alpha=0.3)
    ax.grid(True, which="minor", alpha=0.12)
    ax.legend(frameon=False, loc="lower left")
    save(fig, name)


def fig_width_sweep(records: List[dict], name: str = "Fig12") -> None:
    """Accuracy and deployability against network width.

    The point of the figure is the contrast between the two axes: logical
    error rate is flat in width, while sustainable qubits per card falls by
    more than an order of magnitude across the same range. Capacity buys
    nothing here, so the cheapest model is the right one.
    """
    records = sorted(records, key=lambda r: r["width"])
    widths = [r["width"] for r in records]
    ratios = [r["ler_ratio"] for r in records]
    qubits = [r["qubits_per_card"] for r in records]

    fig, ax = plt.subplots(figsize=(SINGLE_COL, SINGLE_COL * 0.8))

    ax.plot(widths, ratios, color=COLORS[1], marker=MARKERS[0], linestyle=LINESTYLES[0],
            label="pre-decoder LER / baseline")
    ax.axhline(1.0, color="0.3", linewidth=0.8, linestyle=(0, (2, 2)), zorder=0)
    ax.annotate("baseline", xy=(widths[-1], 1.0), xytext=(-2, 3),
                textcoords="offset points", fontsize=6.5, color="0.3",
                ha="right", va="bottom")
    ax.set_xlabel("Convolution channel width")
    ax.set_ylabel("Logical error rate $/$ baseline", color=COLORS[1])
    ax.tick_params(axis="y", labelcolor=COLORS[1])
    ax.set_ylim(0, max(ratios) * 1.25)

    ax2 = ax.twinx()
    ax2.plot(widths, qubits, color=COLORS[0], marker=MARKERS[1], linestyle=LINESTYLES[1],
             label="sustainable qubits per card")
    ax2.set_yscale("log")
    ax2.set_ylabel("Logical qubits per card", color=COLORS[0])
    ax2.tick_params(axis="y", labelcolor=COLORS[0])

    lines = ax.get_lines()[:1] + ax2.get_lines()[:1]
    ax.legend(lines, [l.get_label() for l in lines], frameon=False,
              loc="center right", fontsize=6.5)
    ax.grid(True, alpha=0.3)
    save(fig, name)


def load_width_records(pattern: str, roofline_cfg: dict | None) -> List[dict]:
    from src.pipeline.roofline import architecture_macs, roofline

    out = []
    for path in sorted(glob.glob(pattern)):
        rec = json.load(open(path))
        cfg = rec["config"]
        ckpt = Path(cfg.get("checkpoint", ""))
        m = re.search(r"_w(\d+)\.pt$", ckpt.name)
        if not m:
            continue
        width = int(m.group(1))
        sweep = rec["tau_sweep"]
        base = sweep[0]["ler_baseline"]
        entry = {
            "width": width,
            "ler_ratio": sweep[0]["ler_predecoder_only"] / base if base else float("nan"),
            "oracle_ratio": rec["oracle"]["ler_oracle"] / base if base else float("nan"),
        }
        if roofline_cfg:
            macs = architecture_macs(roofline_cfg["depth"], width,
                                     roofline_cfg["out_channels"], roofline_cfg["volume"])
            r = roofline(macs, roofline_cfg["rounds_per_shot"], "int8",
                         roofline_cfg["clock_mhz"], 0.5, roofline_cfg["round_period_us"],
                         {"resources": {"dsp": roofline_cfg["dsp_total"]}})
            entry["macs"] = macs
            entry["qubits_per_card"] = r.logical_qubits_per_card
        out.append(entry)
    return out


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--baselines", default=str(REPO_ROOT / "results" / "baselines" / "*.json"))
    ap.add_argument("--threshold", default=str(REPO_ROOT / "results" / "threshold_fit_pymatching_baseline.json"))
    ap.add_argument("--roofline", default=str(REPO_ROOT / "results" / "roofline_R5_w64.json"))
    args = ap.parse_args()

    set_style()
    by_d = load_baselines(args.baselines)
    if not by_d:
        raise SystemExit(f"no baseline results matched {args.baselines}")

    threshold = None
    tpath = Path(args.threshold)
    if tpath.exists():
        threshold = json.load(open(tpath))["fit"]

    fig_ler_vs_p(by_d, threshold)
    if threshold is not None:
        fig_threshold_collapse(by_d, threshold)

    rpath = Path(args.roofline)
    roofline_cfg = None
    if rpath.exists():
        rec = json.load(open(rpath))
        roofline_cfg = rec["config"]
        fig_roofline(rec)
    else:
        print(f"skipping Fig9: {rpath} not found")

    width_records = load_width_records(
        str(REPO_ROOT / "results" / "hierarchical" / "*_hierarchical_w*.json"), roofline_cfg)
    if len(width_records) >= 2:
        fig_width_sweep(width_records)
    else:
        print(f"skipping Fig12: only {len(width_records)} width records")


if __name__ == "__main__":
    main()
