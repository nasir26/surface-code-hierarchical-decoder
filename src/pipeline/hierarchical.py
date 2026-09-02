# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Two-tier decoder: gated neural pre-decoder, with exact matching as fallback.

Per shot:

    syndrome -> pre-decoder -> confidence gate -+-- accept: decode residual
                                                |
                                                +-- escalate: decode the RAW
                                                    syndrome with PyMatching

The escalation path deliberately decodes the *raw* syndrome, not the
pre-decoder-corrected one. Escalating means "I do not trust this correction",
so carrying the correction through would keep exactly the corruption the gate
just decided to reject. This is what makes tau -> 1 reduce to the unmodified
PyMatching baseline, which in turn is what bounds the hierarchical decoder's
error rate from above.
"""
from __future__ import annotations

from dataclasses import asdict, dataclass
from typing import Optional

import numpy as np
import pymatching

from src.pipeline.gate import ConfidenceGate, confidence_features
from src.qec import metrics as qec_metrics


@dataclass
class PreDecoderOutput:
    """Everything the gate and the decoders need, computed once per shot set."""

    probs: np.ndarray            # (shots, C, T, H, W) float
    activation: np.ndarray       # (shots, C, T, H, W) uint8
    residual_flat: np.ndarray    # (shots, num_detectors) bool
    raw_flat: np.ndarray         # (shots, num_detectors) bool
    local_obs_parity: np.ndarray  # (shots,) bool


@dataclass
class HierarchicalResult:
    tau: float
    shots: int
    escalated: int
    escalation_rate: float
    ler: float
    ci_low: float
    ci_high: float
    errors: int
    ler_predecoder_only: float
    ler_baseline: float

    def to_dict(self) -> dict:
        return asdict(self)


def decode_hierarchical(
    out: PreDecoderOutput,
    matcher: pymatching.Matching,
    observables: np.ndarray,
    gate: ConfidenceGate,
    tau: float,
    baseline_predicted: Optional[np.ndarray] = None,
    predecoder_predicted: Optional[np.ndarray] = None,
) -> HierarchicalResult:
    """Combine the two paths under threshold tau and score the result.

    `baseline_predicted` and `predecoder_predicted` are the two pure-path
    predictions. They are accepted as arguments because a tau sweep reuses
    them across every tau -- decoding them once instead of per tau turns an
    O(n_tau) matching cost into O(1), which matters because matching, not the
    network, dominates evaluation time.
    """
    shots = out.raw_flat.shape[0]

    if baseline_predicted is None:
        baseline_predicted = matcher.decode_batch(out.raw_flat).astype(bool)
    if predecoder_predicted is None:
        residual = matcher.decode_batch(out.residual_flat).astype(bool)
        predecoder_predicted = residual ^ out.local_obs_parity.reshape(-1, 1)

    features = confidence_features(
        out.probs, out.activation, out.raw_flat, out.residual_flat
    )
    scores = gate.score(features)
    accept = scores >= tau

    predicted = np.where(accept.reshape(-1, 1), predecoder_predicted, baseline_predicted)

    ler, lo, hi = qec_metrics.logical_error_rate(
        predicted, observables, method="clopper-pearson"
    )
    errors = int(np.any(predicted != observables, axis=1).sum())

    ler_pre, _, _ = qec_metrics.logical_error_rate(
        predecoder_predicted, observables, method="clopper-pearson"
    )
    ler_base, _, _ = qec_metrics.logical_error_rate(
        baseline_predicted, observables, method="clopper-pearson"
    )

    escalated = int((~accept).sum())
    return HierarchicalResult(
        tau=float(tau),
        shots=shots,
        escalated=escalated,
        escalation_rate=escalated / shots if shots else float("nan"),
        ler=ler,
        ci_low=lo,
        ci_high=hi,
        errors=errors,
        ler_predecoder_only=ler_pre,
        ler_baseline=ler_base,
    )


def oracle_bounds(
    predecoder_predicted: np.ndarray,
    baseline_predicted: np.ndarray,
    observables: np.ndarray,
) -> dict:
    """Best and worst logical error rates any gate could reach on these shots.

    A gate only ever chooses, per shot, between two already-determined
    predictions. So a perfect gate fails only on shots where *both* paths are
    wrong, and the worst gate fails whenever *either* is wrong. These bracket
    every achievable tau and answer the question the tau sweep alone cannot:
    is a disappointing hierarchical result the gate's fault, or does the
    pre-decoder simply carry no information the baseline lacks?

    The interesting quantity is `ler_oracle` against `ler_baseline`. If they
    are equal, the pre-decoder is right only on shots the baseline already
    gets right, and no gate -- however good -- can beat the baseline. If
    `ler_oracle` is well below, the two decoders fail on different shots and
    the headroom is real, so the gate's feature set is what limits us.
    """
    pre_wrong = np.any(predecoder_predicted != observables, axis=1)
    base_wrong = np.any(baseline_predicted != observables, axis=1)
    shots = observables.shape[0]

    both_wrong = int(np.sum(pre_wrong & base_wrong))
    either_wrong = int(np.sum(pre_wrong | base_wrong))
    return {
        "shots": shots,
        "ler_oracle": both_wrong / shots,
        "ler_antioracle": either_wrong / shots,
        "ler_baseline": int(base_wrong.sum()) / shots,
        "ler_predecoder_only": int(pre_wrong.sum()) / shots,
        "n_predecoder_saves": int(np.sum(base_wrong & ~pre_wrong)),
        "n_predecoder_breaks": int(np.sum(~base_wrong & pre_wrong)),
        "note": (
            "ler_oracle is a lower bound over all possible confidence gates on "
            "these shots; n_predecoder_saves counts shots the pre-decoder gets "
            "right that the baseline gets wrong, which is the entire source of "
            "any possible improvement."
        ),
    }


def sweep_tau(
    out: PreDecoderOutput,
    matcher: pymatching.Matching,
    observables: np.ndarray,
    gate: ConfidenceGate,
    taus,
) -> list:
    """Evaluate a range of thresholds, decoding each pure path only once."""
    baseline_predicted = matcher.decode_batch(out.raw_flat).astype(bool)
    residual = matcher.decode_batch(out.residual_flat).astype(bool)
    predecoder_predicted = residual ^ out.local_obs_parity.reshape(-1, 1)

    return [
        decode_hierarchical(
            out, matcher, observables, gate, tau,
            baseline_predicted=baseline_predicted,
            predecoder_predicted=predecoder_predicted,
        )
        for tau in taus
    ]
