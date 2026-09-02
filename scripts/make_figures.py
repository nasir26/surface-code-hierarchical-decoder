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


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--baselines", default=str(REPO_ROOT / "results" / "baselines" / "*.json"))
    ap.add_argument("--threshold", default=str(REPO_ROOT / "results" / "threshold_fit_pymatching_baseline.json"))
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


if __name__ == "__main__":
    main()
