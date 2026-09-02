# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Clopper-Pearson intervals, per-round conversion, and threshold recovery."""
import numpy as np
import pytest

from src.qec.metrics import (
    clopper_pearson_interval,
    per_round_error_rate,
    wilson_confidence_interval,
)
from src.qec.stats import ThresholdPoint, fit_threshold


def test_clopper_pearson_brackets_estimate():
    low, high = clopper_pearson_interval(50, 1000)
    assert low < 0.05 < high


def test_clopper_pearson_degenerate_ends():
    low, high = clopper_pearson_interval(0, 100)
    assert low == 0.0
    assert 0.0 < high < 1.0

    low, high = clopper_pearson_interval(100, 100)
    assert high == 1.0
    assert 0.0 < low < 1.0


def test_clopper_pearson_is_conservative_relative_to_wilson():
    # The exact interval is never narrower than the normal-approximation one;
    # this is the whole reason it is preferred for low error counts here.
    for k, n in [(1, 1000), (5, 1000), (50, 1000), (3, 200)]:
        cp_low, cp_high = clopper_pearson_interval(k, n)
        w_low, w_high = wilson_confidence_interval(k, n)
        assert cp_high - cp_low >= w_high - w_low - 1e-12


def test_clopper_pearson_rejects_bad_input():
    with pytest.raises(ValueError):
        clopper_pearson_interval(5, 0)
    with pytest.raises(ValueError):
        clopper_pearson_interval(11, 10)


def test_per_round_rate_inverts_composition():
    # Composing the per-round rate back over `rounds` rounds must return the
    # original whole-experiment rate.
    for ler, rounds in [(0.01, 5), (0.2, 7), (1e-4, 9)]:
        eps = per_round_error_rate(ler, rounds)
        recomposed = (1.0 - (1.0 - 2.0 * eps) ** rounds) / 2.0
        assert recomposed == pytest.approx(ler, rel=1e-9)


def test_per_round_rate_is_below_whole_experiment_rate():
    assert per_round_error_rate(0.01, 5) < 0.01


def test_threshold_fit_recovers_planted_threshold():
    """Generate synthetic data from the ansatz itself and check the fit finds it."""
    rng = np.random.default_rng(0)
    true_p_th, true_nu = 0.006, 1.5
    a, b, c = 0.15, 4.0, 30.0
    shots = 400_000

    points = []
    for d in (3, 5, 7, 9):
        for p in np.linspace(0.004, 0.008, 9):
            x = (p - true_p_th) * d ** (1.0 / true_nu)
            ler = np.clip(a + b * x + c * x * x, 1e-6, 0.5)
            errors = int(rng.binomial(shots, ler))
            points.append(ThresholdPoint(distance=d, p=float(p), shots=shots, errors=errors))

    fit = fit_threshold(points, n_bootstrap=100, seed=0)
    assert fit.converged
    assert fit.p_th == pytest.approx(true_p_th, abs=3e-4)
    assert fit.p_th_ci_low < true_p_th < fit.p_th_ci_high


def _toy_ler(p: float, d: int, p_th: float) -> float:
    """Toy LER curve with a genuine threshold crossing at p = p_th.

        ler = 0.5 * r^k / (1 + r^k),   r = p/p_th,  k = (d+1)/2

    At r = 1 every distance passes through 0.25, so the curves cross exactly
    at p_th. Below threshold larger d gives lower LER, above it larger d
    gives higher LER, and the function saturates smoothly toward 0.5 rather
    than being hard-clipped -- clipping flattens every curve near threshold
    and erases the very crossing a threshold fit exists to find.
    """
    r = p / p_th
    k = (d + 1) / 2
    rk = r ** k
    return float(0.5 * rk / (1.0 + rk))


def test_windowing_rescues_a_fit_that_rails_over_a_wide_range():
    """Regression test for the Phase 1 bug.

    The collapse ansatz is a local expansion about p_th. Fitting it across a
    full decade of p -- where LER spans orders of magnitude -- drove the
    optimiser onto its parameter bound and produced a meaningless p_th equal
    to the edge of the sampled range, with a zero-width bootstrap CI. The
    windowed fit must recover an interior threshold from the same data.
    """
    rng = np.random.default_rng(1)
    true_p_th = 0.0070
    shots = 2_000_000

    points = []
    for d in (3, 5, 7, 9):
        for p in np.geomspace(1e-3, 1e-2, 11):
            errors = int(rng.binomial(shots, _toy_ler(p, d, true_p_th)))
            points.append(ThresholdPoint(distance=d, p=float(p), shots=shots, errors=errors))

    wide = fit_threshold(points, n_bootstrap=0, seed=0, window=None)
    windowed = fit_threshold(points, n_bootstrap=200, seed=0, window=0.4)

    # The wide fit is expected to be bad; the point of the test is that the
    # windowed one is good and that a railed fit is flagged rather than
    # reported as a clean number.
    assert windowed.converged
    assert windowed.p_th == pytest.approx(true_p_th, rel=0.15)
    if "WARNING" in wide.message:
        assert "must not be reported as a threshold" in wide.message


def test_estimate_crossing_brackets_the_true_threshold():
    from src.qec.stats import estimate_crossing

    true_p_th = 0.007
    points = []
    for d in (3, 5, 7):
        for p in np.geomspace(2e-3, 2e-2, 13):
            ler = _toy_ler(float(p), d, true_p_th)
            points.append(ThresholdPoint(d, float(p), 1_000_000, int(ler * 1_000_000)))
    assert estimate_crossing(points) == pytest.approx(true_p_th, rel=0.3)


def test_threshold_fit_requires_multiple_distances():
    points = [ThresholdPoint(3, 0.004 + 0.0005 * i, 10_000, 100) for i in range(9)]
    with pytest.raises(ValueError, match="two distinct code distances"):
        fit_threshold(points)
