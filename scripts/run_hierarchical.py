#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Evaluate the gated hierarchical decoder and sweep the threshold tau.

Splits the sampled shots in two: the first half fits the confidence gate
(which needs to know, per shot, whether the pre-decoder path was actually
correct), the second half measures it. Fitting and evaluating on the same
shots would report an optimistically biased escalation/accuracy trade-off.

Writes one JSON per (distance, p) with the whole tau sweep inside, plus the
gate's calibration curve.
"""
from __future__ import annotations

import argparse
import datetime
import json
import subprocess
import sys
import time
from pathlib import Path

import numpy as np
import torch

REPO_ROOT = Path(__file__).resolve().parent.parent
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from src.nn.edges import apply_local_edge_corrections
from src.nn.predecoder import PreDecoder3D
from src.pipeline.gate import confidence_features, fit_gate, reliability_curve
from src.pipeline.hierarchical import PreDecoderOutput, oracle_bounds, sweep_tau
from src.qec import metrics as qec_metrics
from src.qec.circuits import (
    NoiseModel,
    build_rotated_surface_code_circuit,
    detector_coords_to_grid_index,
)
from src.qec.dem import (
    build_channel_observable_map,
    build_detector_error_model,
    build_matching_graph,
)
from src.qec.sampling import diff_frames, sample_detection_volume

RESULTS_DIR = REPO_ROOT / "results" / "hierarchical"


def git_commit() -> str:
    try:
        return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown"


def load_checkpoint(path: Path):
    ckpt = torch.load(path, map_location="cpu", weights_only=False)
    model = PreDecoder3D(
        depth=ckpt["depth"], width=ckpt["width"], out_channels=ckpt["out_channels"]
    )
    model.load_state_dict(ckpt["model_state"])
    model.eval()
    return model, ckpt


def run_predecoder(model, ckpt, circuit, sampled, distance, threshold, device, batch=8192):
    """Model forward over all shots -> PreDecoderOutput."""
    diff = diff_frames(sampled.volume)
    edge_offsets = ckpt["edge_offsets"]
    obs_map = build_channel_observable_map(circuit, edge_offsets)
    grid_index = detector_coords_to_grid_index(circuit)
    t_idx, row_idx, col_idx = grid_index[:, 0], grid_index[:, 1], grid_index[:, 2]

    model = model.to(device)
    probs_parts, act_parts = [], []
    with torch.no_grad():
        for s in range(0, diff.shape[0], batch):
            x = torch.from_numpy(diff[s : s + batch]).float().unsqueeze(1).to(device)
            p = torch.sigmoid(model(x))
            probs_parts.append(p.cpu().numpy())
            act_parts.append((p > threshold).to(torch.uint8).cpu().numpy())
    probs = np.concatenate(probs_parts)
    activation = np.concatenate(act_parts)

    correction = apply_local_edge_corrections(activation, edge_offsets)
    residual_volume = sampled.volume ^ correction
    residual_flat = residual_volume[:, t_idx, row_idx, col_idx].astype(bool)

    shots = activation.shape[0]
    flat = activation[:, :, t_idx, row_idx, col_idx].astype(np.uint32)
    parity = (flat.reshape(shots, -1) @ obs_map.flatten().astype(np.uint32)) % 2

    return PreDecoderOutput(
        probs=probs,
        activation=activation,
        residual_flat=residual_flat,
        raw_flat=sampled.flat_detectors.astype(bool),
        local_obs_parity=parity.astype(bool),
    )


def slice_output(out: PreDecoderOutput, sl) -> PreDecoderOutput:
    return PreDecoderOutput(
        probs=out.probs[sl],
        activation=out.activation[sl],
        residual_flat=out.residual_flat[sl],
        raw_flat=out.raw_flat[sl],
        local_obs_parity=out.local_obs_parity[sl],
    )


def evaluate(model, ckpt, distance, p, shots, seed, taus, threshold, device) -> dict:
    rounds = distance
    basis = ckpt["basis"]
    circuit = build_rotated_surface_code_circuit(
        distance, rounds, basis, NoiseModel.uniform_depolarizing(p)
    )
    matcher = build_matching_graph(build_detector_error_model(circuit))
    sampled = sample_detection_volume(circuit, distance, rounds, shots, seed)

    t0 = time.time()
    out = run_predecoder(model, ckpt, circuit, sampled, distance, threshold, device)
    infer_s = time.time() - t0

    half = shots // 2
    cal, test = slice(0, half), slice(half, shots)
    out_cal, out_test = slice_output(out, cal), slice_output(out, test)
    obs_cal, obs_test = sampled.observables[cal], sampled.observables[test]

    # Gate training labels: was the pre-decoder path correct on this shot?
    pre_cal = matcher.decode_batch(out_cal.residual_flat).astype(bool)
    pre_cal = pre_cal ^ out_cal.local_obs_parity.reshape(-1, 1)
    correct_cal = ~np.any(pre_cal != obs_cal, axis=1)

    feats_cal = confidence_features(
        out_cal.probs, out_cal.activation, out_cal.raw_flat, out_cal.residual_flat
    )
    gate = fit_gate(feats_cal, correct_cal)

    # Calibration quality is measured on the held-out half.
    pre_test = matcher.decode_batch(out_test.residual_flat).astype(bool)
    pre_test = pre_test ^ out_test.local_obs_parity.reshape(-1, 1)
    correct_test = ~np.any(pre_test != obs_test, axis=1)
    feats_test = confidence_features(
        out_test.probs, out_test.activation, out_test.raw_flat, out_test.residual_flat
    )
    scores_test = gate.score(feats_test)
    reliability = reliability_curve(scores_test, correct_test)

    results = sweep_tau(out_test, matcher, obs_test, gate, taus)

    base_test = matcher.decode_batch(out_test.raw_flat).astype(bool)
    oracle = oracle_bounds(pre_test, base_test, obs_test)

    return {
        "oracle": oracle,
        "distance": distance,
        "rounds": rounds,
        "p": p,
        "basis": basis,
        "shots_total": shots,
        "shots_calibration": half,
        "shots_test": shots - half,
        "activation_threshold": threshold,
        "inference_seconds": infer_s,
        "gate": gate.to_dict(),
        "reliability": reliability,
        "tau_sweep": [r.to_dict() for r in results],
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--checkpoint", type=Path, required=True)
    ap.add_argument("--distances", type=int, nargs="+", default=[5, 7, 9])
    ap.add_argument("--p", type=float, nargs="+", default=[0.003])
    ap.add_argument("--shots", type=int, default=200_000)
    ap.add_argument("--seed", type=int, default=12345)
    ap.add_argument("--threshold", type=float, default=0.5)
    ap.add_argument("--device", default="cuda" if torch.cuda.is_available() else "cpu")
    ap.add_argument("--tag", default="gpu")
    args = ap.parse_args()

    taus = [0.0, 0.5, 0.8, 0.9, 0.95, 0.99, 0.995, 0.999, 0.9999, 1.01]

    model, ckpt = load_checkpoint(args.checkpoint)
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    commit = git_commit()
    stamp = datetime.datetime.now(datetime.timezone.utc).isoformat()

    for d in args.distances:
        for p in args.p:
            print(f"--- d={d} p={p} shots={args.shots} ---", flush=True)
            res = evaluate(model, ckpt, d, p, args.shots, args.seed, taus,
                           args.threshold, args.device)
            record = {
                "experiment_id": f"d{d}_p{p:.6g}_hierarchical_{args.tag}",
                "timestamp": stamp,
                "git_commit": commit,
                "tier": "T4",
                "config": {
                    "checkpoint": str(args.checkpoint),
                    "shots_trained": ckpt.get("shots_trained"),
                    "train_p": ckpt.get("train_p"),
                    "R": ckpt.get("R"),
                    **{k: res[k] for k in
                       ("distance", "rounds", "p", "basis", "shots_total",
                        "shots_calibration", "shots_test", "activation_threshold")},
                },
                "gate": res["gate"],
                "oracle": res["oracle"],
                "reliability": res["reliability"],
                "tau_sweep": res["tau_sweep"],
                "env_ref": "results/env.json",
            }
            out_path = RESULTS_DIR / f"{record['experiment_id']}.json"
            out_path.write_text(json.dumps(record, indent=2) + "\n")

            base = res["tau_sweep"][0]["ler_baseline"]
            pre = res["tau_sweep"][0]["ler_predecoder_only"]
            print(f"    baseline LER      = {base:.6f}")
            print(f"    pre-decoder only  = {pre:.6f}  ({pre/base:.2f}x baseline)")
            orc = res["oracle"]
            print(f"    oracle (best gate)= {orc['ler_oracle']:.6f}  ({orc['ler_oracle']/base:.3f}x baseline)")
            print(f"    pre-dec saves={orc['n_predecoder_saves']} breaks={orc['n_predecoder_breaks']}")
            print(f"    gate ECE          = {res['reliability']['expected_calibration_error']:.4f}")
            for r in res["tau_sweep"]:
                print(f"    tau={r['tau']:<7} esc={r['escalation_rate']*100:6.2f}%  "
                      f"LER={r['ler']:.6f}  ({r['ler']/base:.3f}x baseline)")
            print(f"    wrote {out_path}", flush=True)


if __name__ == "__main__":
    main()
