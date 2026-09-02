# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Threshold estimation by finite-size-scaling collapse, with bootstrap CIs.

Fits the standard quadratic ansatz used for surface-code threshold estimates:

    p_L = A + B*x + C*x^2,    x = (p - p_th) * d^(1/nu)

Near the threshold, curves for different code distances cross at p = p_th,
and rescaling the horizontal axis by d^(1/nu) collapses them onto a single
parabola. Fitting all distances jointly for (p_th, nu, A, B, C) is more
robust than reading off pairwise crossing points, which are noisy when the
curves are nearly parallel.

Uncertainty on p_th comes from a nonparametric bootstrap over the observed
binomial counts: each (d, p) point is resampled as Binomial(shots, errors/shots)
and the whole fit is redone. This propagates the Monte Carlo error of every
point into the threshold estimate, which a single least-squares covariance
entry does not do faithfully when the residuals are not homoscedastic (and
here they are not -- low-p points have far fewer errors).
"""
from __future__ import annotations

from dataclasses import asdict, dataclass
from typing import List, Optional, Sequence

import numpy as np
from scipy.optimize import curve_fit


@dataclass(frozen=True)
class ThresholdPoint:
    """One (distance, physical error rate) Monte Carlo observation."""

    distance: int
    p: float
    shots: int
    errors: int

    @property
    def ler(self) -> float:
        return self.errors / self.shots


@dataclass
class ThresholdFit:
    p_th: float
    p_th_ci_low: float
    p_th_ci_high: float
    nu: float
    coefficients: List[float]  # [A, B, C]
    n_bootstrap: int
    n_bootstrap_converged: int
    distances: List[int]
    n_points: int
    converged: bool
    message: str

    def to_dict(self) -> dict:
        return asdict(self)


def _collapse_model(xy: np.ndarray, p_th: float, nu: float, a: float, b: float, c: float) -> np.ndarray:
    p = xy[0]
    d = xy[1]
    x = (p - p_th) * np.power(d, 1.0 / nu)
    return a + b * x + c * x * x


def _fit_once(
    p: np.ndarray,
    d: np.ndarray,
    ler: np.ndarray,
    sigma: Optional[np.ndarray],
    p0: Sequence[float],
) -> Optional[np.ndarray]:
    try:
        popt, _ = curve_fit(
            _collapse_model,
            np.vstack([p, d]),
            ler,
            p0=list(p0),
            sigma=sigma,
            absolute_sigma=sigma is not None,
            maxfev=20000,
            # nu is bounded away from 0 to keep d**(1/nu) finite; p_th is
            # bounded to the sampled range so a runaway fit cannot report a
            # "threshold" outside the data that produced it.
            bounds=(
                [p.min(), 0.3, -np.inf, -np.inf, -np.inf],
                [p.max(), 10.0, np.inf, np.inf, np.inf],
            ),
        )
        return popt
    except (RuntimeError, ValueError):
        return None


def estimate_crossing(points: Sequence[ThresholdPoint]) -> float:
    """First-pass estimate of p_th from where the LER-vs-p curves cross.

    For each pair of adjacent distances, walk up p until the sign of
    (LER_small_d - LER_large_d) flips: below threshold the larger code wins
    (difference positive), above it the larger code loses. The crossing is
    linearly interpolated in log(p) between the bracketing points, and the
    median over all adjacent pairs is returned. This needs no model and is
    only used to centre the fitting window.
    """
    by_d: dict = {}
    for pt in points:
        by_d.setdefault(pt.distance, {})[pt.p] = pt.ler
    distances = sorted(by_d)
    if len(distances) < 2:
        raise ValueError("crossing estimate needs at least two distinct distances")

    crossings: List[float] = []
    for d_small, d_large in zip(distances, distances[1:]):
        shared = sorted(set(by_d[d_small]) & set(by_d[d_large]))
        prev_p = None
        prev_diff = None
        for p in shared:
            diff = by_d[d_small][p] - by_d[d_large][p]
            if prev_diff is not None and prev_diff > 0 >= diff:
                # Interpolate in log p where diff hits zero.
                w = prev_diff / (prev_diff - diff) if prev_diff != diff else 0.5
                crossings.append(float(np.exp(np.log(prev_p) + w * (np.log(p) - np.log(prev_p)))))
                break
            prev_p, prev_diff = p, diff
    if not crossings:
        # No crossing bracketed by the data: fall back to the geometric
        # centre of the sampled range so the caller still gets a window.
        all_p = [pt.p for pt in points]
        return float(np.exp(np.mean(np.log(all_p))))
    return float(np.median(crossings))


def fit_threshold(
    points: Sequence[ThresholdPoint],
    n_bootstrap: int = 500,
    seed: int = 0,
    nu_guess: float = 1.5,
    window: Optional[float] = 0.4,
) -> ThresholdFit:
    """Fit p_th over the (d, p) points, with a bootstrap CI on p_th.

    The collapse ansatz p_L = A + Bx + Cx^2 is a *local* expansion about the
    threshold, not a global description of the LER curve. Fitting it across a
    wide range of p -- where LER varies by orders of magnitude and is bounded
    below by 0 -- is invalid and in practice drives the optimiser onto its
    bounds. `window` therefore restricts the fit to physical error rates
    within a relative fraction of a first-pass crossing estimate: points with
    |p/p_cross - 1| <= window are kept. Pass window=None to fit everything
    (only sensible if the caller has already narrowed the grid).

    Requires at least two distinct distances (a threshold is defined by
    curves crossing; one distance has nothing to cross with) and at least
    as many points as free parameters.
    """
    distances_all = sorted({pt.distance for pt in points})
    if len(distances_all) < 2:
        raise ValueError("threshold fit needs at least two distinct code distances")

    if window is not None:
        p_cross = estimate_crossing(points)
        selected = [pt for pt in points if abs(pt.p / p_cross - 1.0) <= window]
        # Keep the window only if it retains enough points and distances to
        # constrain the five parameters; otherwise fall back to everything
        # and let the caller see the wider fit rather than a failed one.
        if len(selected) >= 8 and len({pt.distance for pt in selected}) >= 2:
            points = selected

    distances = sorted({pt.distance for pt in points})
    if len(points) < 5:
        raise ValueError("threshold fit needs at least 5 points for 5 free parameters")

    p = np.array([pt.p for pt in points], dtype=float)
    d = np.array([pt.distance for pt in points], dtype=float)
    shots = np.array([pt.shots for pt in points], dtype=float)
    errors = np.array([pt.errors for pt in points], dtype=float)
    ler = errors / shots

    # Binomial standard error, floored so that a zero-error point does not
    # get zero uncertainty and dominate the weighted fit.
    sigma = np.sqrt(np.maximum(ler * (1.0 - ler), 1.0 / shots) / shots)

    p0 = (float(np.median(p)), nu_guess, float(np.mean(ler)), 0.0, 0.0)
    popt = _fit_once(p, d, ler, sigma, p0)
    if popt is None:
        return ThresholdFit(
            p_th=float("nan"),
            p_th_ci_low=float("nan"),
            p_th_ci_high=float("nan"),
            nu=float("nan"),
            coefficients=[float("nan")] * 3,
            n_bootstrap=n_bootstrap,
            n_bootstrap_converged=0,
            distances=distances,
            n_points=len(points),
            converged=False,
            message="primary least-squares fit did not converge",
        )

    rng = np.random.default_rng(seed)
    boot: List[float] = []
    for _ in range(n_bootstrap):
        resampled_errors = rng.binomial(shots.astype(int), np.clip(ler, 0.0, 1.0))
        boot_ler = resampled_errors / shots
        boot_sigma = np.sqrt(np.maximum(boot_ler * (1.0 - boot_ler), 1.0 / shots) / shots)
        boot_popt = _fit_once(p, d, boot_ler, boot_sigma, popt)
        if boot_popt is not None:
            boot.append(float(boot_popt[0]))

    if len(boot) >= 20:
        ci_low, ci_high = (float(v) for v in np.percentile(boot, [2.5, 97.5]))
        message = "ok"
    else:
        ci_low = ci_high = float("nan")
        message = f"bootstrap produced only {len(boot)} converged fits; CI not reported"

    # A fit that lands on its own parameter bound is not a measurement of a
    # threshold, it is the optimiser running out of room. Say so loudly
    # rather than reporting the bound as if it were an estimate.
    span = p.max() - p.min()
    if span > 0 and min(abs(popt[0] - p.min()), abs(popt[0] - p.max())) < 0.01 * span:
        message = (
            f"WARNING: p_th={popt[0]:.5g} is at the edge of the fitted range "
            f"[{p.min():.5g}, {p.max():.5g}]; the collapse did not find an interior "
            f"crossing and this value must not be reported as a threshold. " + message
        )

    return ThresholdFit(
        p_th=float(popt[0]),
        p_th_ci_low=ci_low,
        p_th_ci_high=ci_high,
        nu=float(popt[1]),
        coefficients=[float(popt[2]), float(popt[3]), float(popt[4])],
        n_bootstrap=n_bootstrap,
        n_bootstrap_converged=len(boot),
        distances=distances,
        n_points=len(points),
        converged=True,
        message=message,
    )
