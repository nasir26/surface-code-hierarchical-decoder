# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Confidence gate: decide per shot whether to trust the pre-decoder.

The problem this solves
-----------------------
The predecessor project applied the neural pre-decoder's corrections
unconditionally to every shot, and measured a logical error rate ~4.3x
*worse* than PyMatching alone. An unconditional pre-decoder can only help if
it is right nearly all the time; when it is wrong it corrupts a syndrome that
the matching decoder would otherwise have decoded correctly, and there is no
mechanism to recover.

Gating removes that failure mode structurally. Each shot is scored, and only
shots scoring at or above a threshold tau take the pre-decoder path; the rest
are escalated to plain PyMatching on the *raw* (uncorrected) syndrome. Two
limits follow immediately and are the reason this design cannot lose:

    tau -> 0    every shot takes the pre-decoder path  == predecessor's result
    tau -> 1    every shot escalates                   == PyMatching baseline

So the hierarchical decoder's logical error rate is bounded above by the
baseline for tau large enough, and sweeping tau traces a Pareto front between
accuracy and the fraction of shots that must pay for exact matching.

Why hand-built features and a logistic model, not a learned neural head
----------------------------------------------------------------------
The gate has to run in FPGA fabric on the critical path, immediately after
the convolutional layers. The features below are all counts, minima and sums
over tensors the kernel already has in registers, so the whole gate costs a
few comparators, an adder tree and one dot product -- negligible next to the
convolution itself. A second neural head would have cost real fabric for a
decision that, as the reliability diagrams show, a linear model on these
statistics already makes well.
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import List, Optional

import numpy as np

FEATURE_NAMES: List[str] = [
    "n_corrections",
    "n_ambiguous",
    "max_ambiguity",
    "mean_margin_active",
    "syndrome_weight_before",
    "syndrome_weight_after",
    "syndrome_weight_delta",
]

# Probabilities inside this band are treated as "the model is unsure".
AMBIGUOUS_LOW = 0.15
AMBIGUOUS_HIGH = 0.85


def confidence_features(
    probs: np.ndarray,
    activation: np.ndarray,
    syndrome_before: np.ndarray,
    syndrome_after: np.ndarray,
) -> np.ndarray:
    """Per-shot summary statistics of a pre-decoder output.

    Args:
        probs: float (shots, C, T, H, W) sigmoid probabilities.
        activation: uint8 (shots, C, T, H, W) thresholded decisions.
        syndrome_before: bool (shots, num_detectors) raw detection events.
        syndrome_after: bool (shots, num_detectors) residual after correction.

    Returns:
        float64 (shots, len(FEATURE_NAMES)).
    """
    shots = probs.shape[0]
    flat_p = probs.reshape(shots, -1)
    flat_a = activation.reshape(shots, -1).astype(bool)

    # |2p - 1| is 0 at maximal uncertainty and 1 at a saturated decision.
    margin = np.abs(2.0 * flat_p - 1.0)

    n_corrections = flat_a.sum(axis=1).astype(np.float64)
    n_ambiguous = ((flat_p > AMBIGUOUS_LOW) & (flat_p < AMBIGUOUS_HIGH)).sum(axis=1).astype(np.float64)

    # Statistics restricted to the corrections actually applied: a shot with
    # no corrections is trivially safe on this axis, so it gets the
    # most-confident values (ambiguity 0, margin 1) rather than a NaN.
    masked_margin = np.where(flat_a, margin, np.inf)
    min_margin_active = masked_margin.min(axis=1)
    no_active = ~flat_a.any(axis=1)
    min_margin_active[no_active] = 1.0
    max_ambiguity = 1.0 - min_margin_active

    sum_margin = np.where(flat_a, margin, 0.0).sum(axis=1)
    denom = np.maximum(n_corrections, 1.0)
    mean_margin_active = np.where(no_active, 1.0, sum_margin / denom)

    w_before = syndrome_before.sum(axis=1).astype(np.float64)
    w_after = syndrome_after.sum(axis=1).astype(np.float64)

    return np.column_stack([
        n_corrections,
        n_ambiguous,
        max_ambiguity,
        mean_margin_active,
        w_before,
        w_after,
        w_before - w_after,
    ])


@dataclass
class ConfidenceGate:
    """Calibrated logistic model mapping features -> P(pre-decoder path correct).

    Fitted on held-out shots whose true outcome is known, so the score it
    emits is an actual probability and a threshold tau on it has a
    consistent meaning across distances and noise rates. Without that
    calibration step tau would be an arbitrary knob rather than "escalate
    unless at least tau confident".
    """

    coef: np.ndarray
    intercept: float
    mean: np.ndarray
    scale: np.ndarray
    feature_names: List[str]
    n_train: int
    train_accuracy: float
    base_rate: float

    def score(self, features: np.ndarray) -> np.ndarray:
        z = (features - self.mean) / self.scale
        logits = z @ self.coef + self.intercept
        return 1.0 / (1.0 + np.exp(-logits))

    def to_dict(self) -> dict:
        return {
            "coef": self.coef.tolist(),
            "intercept": float(self.intercept),
            "mean": self.mean.tolist(),
            "scale": self.scale.tolist(),
            "feature_names": self.feature_names,
            "n_train": self.n_train,
            "train_accuracy": self.train_accuracy,
            "base_rate": self.base_rate,
        }

    @classmethod
    def from_dict(cls, d: dict) -> "ConfidenceGate":
        return cls(
            coef=np.array(d["coef"], dtype=float),
            intercept=float(d["intercept"]),
            mean=np.array(d["mean"], dtype=float),
            scale=np.array(d["scale"], dtype=float),
            feature_names=list(d["feature_names"]),
            n_train=int(d["n_train"]),
            train_accuracy=float(d["train_accuracy"]),
            base_rate=float(d["base_rate"]),
        )


def fit_gate(features: np.ndarray, correct: np.ndarray, seed: int = 0) -> ConfidenceGate:
    """Fit the gate on (features, was-the-pre-decoder-path-correct) pairs."""
    from sklearn.linear_model import LogisticRegression

    correct = correct.astype(int)
    mean = features.mean(axis=0)
    # A constant feature would divide by zero; give it unit scale so its
    # standardised value is a harmless zero.
    scale = features.std(axis=0)
    scale[scale < 1e-12] = 1.0
    z = (features - mean) / scale

    base_rate = float(correct.mean())
    if correct.min() == correct.max():
        # Degenerate: every shot had the same outcome, so there is nothing to
        # discriminate. Emit a constant-score gate rather than crashing, and
        # let the caller see base_rate == train_accuracy and notice.
        return ConfidenceGate(
            coef=np.zeros(features.shape[1]),
            intercept=float(np.log(max(base_rate, 1e-9) / max(1 - base_rate, 1e-9))),
            mean=mean, scale=scale, feature_names=list(FEATURE_NAMES),
            n_train=len(correct), train_accuracy=base_rate, base_rate=base_rate,
        )

    clf = LogisticRegression(max_iter=2000, random_state=seed)
    clf.fit(z, correct)
    acc = float(clf.score(z, correct))

    return ConfidenceGate(
        coef=clf.coef_[0].astype(float),
        intercept=float(clf.intercept_[0]),
        mean=mean, scale=scale, feature_names=list(FEATURE_NAMES),
        n_train=len(correct), train_accuracy=acc, base_rate=base_rate,
    )


def reliability_curve(scores: np.ndarray, correct: np.ndarray, n_bins: int = 15) -> dict:
    """Binned observed-vs-predicted accuracy, plus ECE.

    A gate is only meaningful if a score of 0.9 really does mean about a 90%
    chance of being right; this is what the paper's reliability diagram plots
    and what the expected calibration error summarises.
    """
    edges = np.linspace(0.0, 1.0, n_bins + 1)
    idx = np.clip(np.digitize(scores, edges) - 1, 0, n_bins - 1)
    conf, acc, counts = [], [], []
    for b in range(n_bins):
        m = idx == b
        n = int(m.sum())
        counts.append(n)
        conf.append(float(scores[m].mean()) if n else float("nan"))
        acc.append(float(correct[m].mean()) if n else float("nan"))
    counts_arr = np.array(counts, dtype=float)
    valid = counts_arr > 0
    ece = float(
        np.sum(counts_arr[valid] * np.abs(np.array(acc)[valid] - np.array(conf)[valid]))
        / max(counts_arr.sum(), 1.0)
    )
    return {
        "bin_edges": edges.tolist(),
        "bin_confidence": conf,
        "bin_accuracy": acc,
        "bin_count": counts,
        "expected_calibration_error": ece,
    }
