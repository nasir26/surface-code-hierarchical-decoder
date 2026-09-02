# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Confidence gate and hierarchical decoder.

The load-bearing property under test is the bracketing claim the whole paper
rests on: tau -> 1 must reduce *exactly* to the PyMatching baseline, and
tau -> 0 must reduce *exactly* to the unconditional pre-decoder. If either
limit drifts, the hierarchical decoder is no longer bounded by the baseline
and the central argument fails.
"""
import numpy as np
import pytest

from src.pipeline.gate import (
    FEATURE_NAMES,
    ConfidenceGate,
    confidence_features,
    fit_gate,
    reliability_curve,
)
from src.pipeline.hierarchical import PreDecoderOutput, decode_hierarchical, sweep_tau
from src.qec.circuits import NoiseModel, build_rotated_surface_code_circuit
from src.qec.dem import build_detector_error_model, build_matching_graph
from src.qec.sampling import sample_detection_volume


def _synthetic_output(shots=800, n_det=24, n_chan=3, seed=0):
    rng = np.random.default_rng(seed)
    probs = rng.random((shots, n_chan, 2, 3, 4))
    activation = (probs > 0.5).astype(np.uint8)
    raw = rng.random((shots, n_det)) < 0.1
    residual = raw ^ (rng.random((shots, n_det)) < 0.02)
    parity = rng.random(shots) < 0.1
    return PreDecoderOutput(
        probs=probs, activation=activation,
        residual_flat=residual, raw_flat=raw,
        local_obs_parity=parity,
    )


def test_features_have_expected_shape_and_are_finite():
    out = _synthetic_output()
    f = confidence_features(out.probs, out.activation, out.raw_flat, out.residual_flat)
    assert f.shape == (out.probs.shape[0], len(FEATURE_NAMES))
    assert np.isfinite(f).all()


def test_shot_with_no_corrections_is_scored_as_maximally_confident():
    """A shot the pre-decoder left alone cannot be harmed by it, so the
    margin features must report certainty rather than NaN from an empty
    reduction."""
    shots, n_chan = 4, 2
    probs = np.full((shots, n_chan, 1, 2, 2), 0.1)   # all below 0.5
    activation = np.zeros_like(probs, dtype=np.uint8)
    raw = np.zeros((shots, 6), dtype=bool)
    f = confidence_features(probs, activation, raw, raw)
    idx_max_amb = FEATURE_NAMES.index("max_ambiguity")
    idx_mean_margin = FEATURE_NAMES.index("mean_margin_active")
    assert np.allclose(f[:, idx_max_amb], 0.0)
    assert np.allclose(f[:, idx_mean_margin], 1.0)
    assert np.isfinite(f).all()


def test_gate_handles_degenerate_all_correct_labels():
    out = _synthetic_output(shots=200)
    f = confidence_features(out.probs, out.activation, out.raw_flat, out.residual_flat)
    gate = fit_gate(f, np.ones(200, dtype=bool))
    assert gate.base_rate == 1.0
    s = gate.score(f)
    assert np.isfinite(s).all() and ((s >= 0) & (s <= 1)).all()


def test_reliability_curve_is_perfect_for_a_perfect_predictor():
    scores = np.linspace(0.01, 0.99, 500)
    rng = np.random.default_rng(0)
    correct = rng.random(500) < scores          # correct with probability = score
    rel = reliability_curve(scores, correct, n_bins=10)
    # A genuinely calibrated predictor should have small ECE; allow slack for
    # binomial noise at 500 samples.
    assert rel["expected_calibration_error"] < 0.12


def _real_case(distance=3, p=0.005, shots=4000, seed=7):
    circuit = build_rotated_surface_code_circuit(
        distance, distance, "z", NoiseModel.uniform_depolarizing(p)
    )
    matcher = build_matching_graph(build_detector_error_model(circuit))
    sampled = sample_detection_volume(circuit, distance, distance, shots, seed)
    raw = sampled.flat_detectors.astype(bool)

    rng = np.random.default_rng(seed)
    n_det = raw.shape[1]
    # A deliberately mediocre "pre-decoder": it corrupts the syndrome, which
    # is the regime the gate exists to protect against.
    residual = raw ^ (rng.random((shots, n_det)) < 0.05)
    probs = rng.random((shots, 2, 2, 2, 2))
    out = PreDecoderOutput(
        probs=probs,
        activation=(probs > 0.5).astype(np.uint8),
        residual_flat=residual,
        raw_flat=raw,
        local_obs_parity=np.zeros(shots, dtype=bool),
    )
    return out, matcher, sampled.observables


def test_tau_limits_bracket_the_two_pure_decoders():
    out, matcher, obs = _real_case()
    f = confidence_features(out.probs, out.activation, out.raw_flat, out.residual_flat)
    pre = matcher.decode_batch(out.residual_flat).astype(bool)
    correct = ~np.any(pre != obs, axis=1)
    gate = fit_gate(f, correct)

    # tau above any achievable score escalates everything; tau below any
    # achievable score accepts everything.
    hi = decode_hierarchical(out, matcher, obs, gate, tau=1.01)
    lo = decode_hierarchical(out, matcher, obs, gate, tau=-0.01)

    assert hi.escalation_rate == 1.0
    assert hi.ler == pytest.approx(hi.ler_baseline)

    assert lo.escalation_rate == 0.0
    assert lo.ler == pytest.approx(lo.ler_predecoder_only)


def test_escalation_rate_is_monotone_in_tau():
    out, matcher, obs = _real_case()
    f = confidence_features(out.probs, out.activation, out.raw_flat, out.residual_flat)
    pre = matcher.decode_batch(out.residual_flat).astype(bool)
    gate = fit_gate(f, ~np.any(pre != obs, axis=1))

    taus = [0.0, 0.25, 0.5, 0.75, 0.9, 1.01]
    rates = [r.escalation_rate for r in sweep_tau(out, matcher, obs, gate, taus)]
    assert all(a <= b + 1e-12 for a, b in zip(rates, rates[1:])), rates


def test_sweep_matches_individual_decodes():
    """The sweep's reuse of pre-decoded pure paths must not change answers."""
    out, matcher, obs = _real_case(shots=2000)
    f = confidence_features(out.probs, out.activation, out.raw_flat, out.residual_flat)
    pre = matcher.decode_batch(out.residual_flat).astype(bool)
    gate = fit_gate(f, ~np.any(pre != obs, axis=1))

    taus = [0.2, 0.6, 0.95]
    swept = sweep_tau(out, matcher, obs, gate, taus)
    for tau, s in zip(taus, swept):
        one = decode_hierarchical(out, matcher, obs, gate, tau=tau)
        assert s.ler == pytest.approx(one.ler)
        assert s.escalation_rate == pytest.approx(one.escalation_rate)


def test_gate_roundtrips_through_dict():
    out = _synthetic_output(shots=300)
    f = confidence_features(out.probs, out.activation, out.raw_flat, out.residual_flat)
    rng = np.random.default_rng(3)
    gate = fit_gate(f, rng.random(300) < 0.7)
    restored = ConfidenceGate.from_dict(gate.to_dict())
    assert np.allclose(gate.score(f), restored.score(f))
