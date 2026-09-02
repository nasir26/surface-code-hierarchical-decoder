# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""LER with confidence intervals, syndrome density reduction, speedup.

Two interval methods are provided. Wilson is retained because the ported
tests and the earlier project's committed results were computed with it.
Clopper-Pearson is the default for anything this project reports, because it
is the exact (conservative) binomial interval and does not undercover in the
low-count regime that matters here: at small p and large d a run can observe
only tens of logical errors, exactly where Wilson's normal approximation is
least trustworthy.
"""
from __future__ import annotations

from typing import Tuple

import numpy as np
from scipy.stats import beta, norm


def clopper_pearson_interval(successes: int, n: int, confidence: float = 0.95) -> Tuple[float, float]:
    """Exact binomial (Clopper-Pearson) interval via the Beta quantile form.

    Degenerate ends are handled explicitly: 0 successes has a lower bound of
    exactly 0, and n successes an upper bound of exactly 1, rather than the
    NaN scipy's beta.ppf returns for a zero-shape parameter.
    """
    if n <= 0:
        raise ValueError("n must be positive")
    if not 0 <= successes <= n:
        raise ValueError("successes must be in [0, n]")

    alpha = 1.0 - confidence
    low = 0.0 if successes == 0 else float(beta.ppf(alpha / 2, successes, n - successes + 1))
    high = 1.0 if successes == n else float(beta.ppf(1 - alpha / 2, successes + 1, n - successes))
    return low, high


def per_round_error_rate(ler: float, rounds: int) -> float:
    """Convert a whole-experiment logical error rate to a per-round rate.

    Uses the standard QEC convention that per-round failures compose as a
    biased coin flipped `rounds` times:
        1 - 2*ler = (1 - 2*eps)**rounds
    which inverts to eps = (1 - (1 - 2*ler)**(1/rounds)) / 2. This is the
    form that stays correct as ler approaches 0.5 (where a naive ler/rounds
    diverges from reality), and it is what makes LER comparable across the
    different round counts used at different distances (r = d).
    """
    if rounds <= 0:
        raise ValueError("rounds must be positive")
    if not 0.0 <= ler <= 1.0:
        raise ValueError("ler must be in [0, 1]")
    if ler >= 0.5:
        return 0.5
    return float((1.0 - (1.0 - 2.0 * ler) ** (1.0 / rounds)) / 2.0)


def wilson_confidence_interval(successes: int, n: int, confidence: float = 0.95) -> Tuple[float, float]:
    if n <= 0:
        raise ValueError("n must be positive")
    if not 0 <= successes <= n:
        raise ValueError("successes must be in [0, n]")

    z = norm.ppf(0.5 + confidence / 2)
    phat = successes / n
    denom = 1.0 + z * z / n
    center = phat + z * z / (2 * n)
    adj = z * np.sqrt(phat * (1 - phat) / n + z * z / (4 * n * n))
    low = (center - adj) / denom
    high = (center + adj) / denom
    return float(max(0.0, low)), float(min(1.0, high))


def logical_error_rate(
    predicted_observables: np.ndarray,
    true_observables: np.ndarray,
    confidence: float = 0.95,
    method: str = "wilson",
) -> Tuple[float, float, float]:
    """A shot is a logical error if any observable bit mismatches.

    Returns (ler, ci_low, ci_high). `method` selects "wilson" (the default,
    kept so the ported tests and the earlier project's numbers reproduce
    exactly) or "clopper-pearson" (what this project reports; see module
    docstring).
    """
    if predicted_observables.shape != true_observables.shape:
        raise ValueError("shape mismatch between predicted and true observables")
    n = predicted_observables.shape[0]
    errors = np.any(predicted_observables != true_observables, axis=1)
    k = int(np.sum(errors))
    ler = k / n
    if method == "wilson":
        low, high = wilson_confidence_interval(k, n, confidence=confidence)
    elif method == "clopper-pearson":
        low, high = clopper_pearson_interval(k, n, confidence=confidence)
    else:
        raise ValueError(f"unknown interval method: {method!r}")
    return ler, low, high


def syndrome_density_reduction(density_before: float, density_after: float) -> float:
    """Fraction of detection events removed: 1 - density_after / density_before."""
    if density_before <= 0:
        raise ValueError("density_before must be positive")
    return 1.0 - density_after / density_before


def speedup(baseline_us: float, treatment_us: float) -> float:
    if treatment_us <= 0:
        raise ValueError("treatment_us must be positive")
    return baseline_us / treatment_us
