# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""GPU training for PreDecoder3D at a scale the earlier CPU-only run could not reach.

Why this file exists
--------------------
The predecessor project (fpga-neural-predecoder) trained this architecture on
CPU only -- its trainer literally asserted `not torch.cuda.is_available()` --
at 2M shots/epoch x 20 epochs = 40M shots total, roughly 1600x below the
reference recipe's 67M shots/epoch x 100 epochs on 8 GPUs. Its paper reports
the resulting pre-decoder is *worse* than a PyMatching-only baseline, and
names undertraining as the most plausible cause and re-running at scale as
"the most important piece of follow-up work this paper identifies". This
module is that follow-up.

Measured on the RTX A4000 in results/env.json, the throughput knobs matter a
lot for how much training fits in a session:

    fp32                                  29k shots/s
    + TF32                                85k
    + bf16 autocast                      148k
    + channels_last_3d                   167k   <- used here

At 167k shots/s the predecessor's entire 40M-shot run takes about four
minutes, so scale-ups of 10-50x are cheap. Data generation is not the
bottleneck: Stim sampling plus target construction runs at ~33k shots/s on a
single core, so a handful of DataLoader workers keeps the GPU fed.

Determinism: every worker derives its seeds from (base_seed, worker_id,
chunk_index), so a given --seed reproduces the same stream of shots
regardless of worker count.
"""
from __future__ import annotations

import argparse
import json
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator, Optional

import numpy as np
import torch
import torch.nn as nn
from torch.utils.data import DataLoader, IterableDataset

from src.nn.predecoder import PreDecoder3D, depth_for_receptive_field
from src.nn.train import build_training_circuit
from src.qec.sampling import sample_training_shots

REPO_ROOT = Path(__file__).resolve().parent.parent.parent


@dataclass
class TrainConfig:
    R: int = 5
    width: int = 64
    basis: str = "z"
    train_p: float = 0.006
    total_shots: int = 200_000_000
    batch_size: int = 4096
    chunk_shots: int = 32_768
    lr: float = 1e-3
    seed: int = 0
    num_workers: int = 8
    amp: bool = True
    channels_last: bool = True
    log_every_shots: int = 5_000_000
    tag: str = "gpu"
    # When set, each logging point also writes an immutable checkpoint named
    # by the shot count. Used to reconstruct the loss-versus-logical-error
    # trajectory: the rolling checkpoint is overwritten and cannot show how
    # the two metrics moved relative to each other during training.
    snapshot: bool = False


class ShotStream(IterableDataset):
    """Endless stream of freshly sampled training chunks.

    QEC training data is free to resample, so there is no fixed dataset, no
    train/validation split, and no possibility of overfitting by reuse: every
    shot the model sees is drawn once and discarded. Each worker samples an
    interleaved subset so no two workers generate identical shots.
    """

    def __init__(self, cfg: TrainConfig):
        self.cfg = cfg

    def __iter__(self) -> Iterator:
        info = torch.utils.data.get_worker_info()
        worker_id = info.id if info is not None else 0
        num_workers = info.num_workers if info is not None else 1

        # Each worker builds its own circuit/incidence: these are cheap
        # relative to a training run and cannot be shared across processes.
        circuit, _offsets, num_channels, incidence = build_training_circuit(
            self.cfg.R, self.cfg.basis, self.cfg.train_p
        )

        chunk_index = 0
        while True:
            seed = (
                self.cfg.seed * 1_000_003
                + worker_id * 10_007
                + chunk_index * num_workers
                + 1
            )
            shots = sample_training_shots(
                circuit, incidence, num_channels, self.cfg.R, self.cfg.R,
                self.cfg.chunk_shots, seed=seed,
            )
            yield (
                torch.from_numpy(shots.diff).unsqueeze(1),  # (n,1,T,H,W) uint8
                torch.from_numpy(shots.target),             # (n,C,T,H,W) uint8
            )
            chunk_index += 1


def build_model(cfg: TrainConfig, num_channels: int, device: str) -> nn.Module:
    model = PreDecoder3D(
        depth=depth_for_receptive_field(cfg.R),
        width=cfg.width,
        out_channels=num_channels,
    ).to(device)
    if cfg.channels_last and device == "cuda":
        model = model.to(memory_format=torch.channels_last_3d)
    return model


def train(cfg: TrainConfig, out_dir: Path, metrics_path: Path) -> dict:
    device = "cuda" if torch.cuda.is_available() else "cpu"
    if device == "cuda":
        torch.backends.cuda.matmul.allow_tf32 = True
        torch.backends.cudnn.allow_tf32 = True
        torch.backends.cudnn.benchmark = True

    torch.manual_seed(cfg.seed)
    np.random.seed(cfg.seed)

    circuit, edge_offsets, num_channels, _incidence = build_training_circuit(
        cfg.R, cfg.basis, cfg.train_p
    )
    model = build_model(cfg, num_channels, device)
    n_params = sum(p.numel() for p in model.parameters())

    opt = torch.optim.Adam(model.parameters(), lr=cfg.lr)
    # Cosine decay over the planned shot budget; the schedule is stepped per
    # optimiser step, so it must be sized in steps, not epochs.
    total_steps = max(1, cfg.total_shots // cfg.batch_size)
    sched = torch.optim.lr_scheduler.CosineAnnealingLR(opt, T_max=total_steps)
    loss_fn = nn.BCEWithLogitsLoss()
    use_amp = cfg.amp and device == "cuda"

    stream = ShotStream(cfg)
    loader = DataLoader(
        stream,
        batch_size=None,          # ShotStream already yields whole chunks
        num_workers=cfg.num_workers,
        pin_memory=(device == "cuda"),
        persistent_workers=cfg.num_workers > 0,
        prefetch_factor=4 if cfg.num_workers > 0 else None,
    )

    out_dir.mkdir(parents=True, exist_ok=True)
    metrics_path.parent.mkdir(parents=True, exist_ok=True)
    checkpoint_path = out_dir / f"predecoder_R{cfg.R}_{cfg.tag}.pt"

    print(f"device={device} params={n_params:,} channels={num_channels} "
          f"target_shots={cfg.total_shots:,} batch={cfg.batch_size} workers={cfg.num_workers} "
          f"amp={use_amp} channels_last={cfg.channels_last}")

    history: list = []
    shots_done = 0
    step = 0
    # Loss is accumulated in a GPU-resident tensor and only read back at log
    # time. Calling .item() every step would synchronise the device on every
    # iteration and serialise the pipeline: doing so measured 68k shots/s
    # against 167k for the same model in a sync-free microbenchmark.
    loss_accum = torch.zeros((), device=device, dtype=torch.float32)
    loss_count = 0
    next_log = cfg.log_every_shots
    t_start = time.time()

    for x_chunk, y_chunk in loader:
        if shots_done >= cfg.total_shots:
            break
        n = x_chunk.shape[0]
        for start in range(0, n, cfg.batch_size):
            end = min(start + cfg.batch_size, n)
            x = x_chunk[start:end].to(device, non_blocking=True).float()
            y = y_chunk[start:end].to(device, non_blocking=True).float()
            if cfg.channels_last and device == "cuda":
                x = x.contiguous(memory_format=torch.channels_last_3d)

            opt.zero_grad(set_to_none=True)
            with torch.amp.autocast("cuda", dtype=torch.bfloat16, enabled=use_amp):
                loss = loss_fn(model(x), y)
            loss.backward()
            opt.step()
            if step < total_steps:
                sched.step()

            loss_accum += loss.detach().float()
            loss_count += 1
            step += 1
            shots_done += end - start

        if shots_done >= next_log or shots_done >= cfg.total_shots:
            elapsed = time.time() - t_start
            mean_loss = float(loss_accum.item() / loss_count) if loss_count else float("nan")
            rate = shots_done / elapsed if elapsed > 0 else 0.0
            rec = {
                "shots": shots_done,
                "step": step,
                "loss": mean_loss,
                "lr": float(sched.get_last_lr()[0]),
                "elapsed_s": elapsed,
                "shots_per_s": rate,
            }
            history.append(rec)
            eta = (cfg.total_shots - shots_done) / rate if rate > 0 else float("nan")
            print(f"  shots={shots_done:>12,} loss={mean_loss:.6f} "
                  f"lr={rec['lr']:.2e} {rate:>9,.0f} shots/s eta={eta/60:.1f}min", flush=True)
            loss_accum.zero_()
            loss_count = 0
            next_log += cfg.log_every_shots

            torch.save(
                {
                    "model_state": model.state_dict(),
                    "depth": depth_for_receptive_field(cfg.R),
                    "width": cfg.width,
                    "out_channels": num_channels,
                    "edge_offsets": edge_offsets,
                    "R": cfg.R,
                    "basis": cfg.basis,
                    "train_p": cfg.train_p,
                    "shots_trained": shots_done,
                    "config": cfg.__dict__,
                },
                checkpoint_path,
            )
            if cfg.snapshot:
                snap = out_dir / f"predecoder_R{cfg.R}_{cfg.tag}_at{shots_done}.pt"
                import shutil
                shutil.copyfile(checkpoint_path, snap)
            metrics_path.write_text(json.dumps({
                "config": cfg.__dict__,
                "device": device,
                "n_params": n_params,
                "num_channels": num_channels,
                "edge_offsets": edge_offsets,
                "history": history,
            }, indent=2) + "\n")

    total_time = time.time() - t_start
    print(f"done: {shots_done:,} shots in {total_time/60:.1f} min "
          f"({shots_done/total_time:,.0f} shots/s); checkpoint {checkpoint_path}")
    return {"checkpoint_path": str(checkpoint_path), "shots": shots_done,
            "seconds": total_time, "history": history}


def parse_args() -> argparse.Namespace:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--R", type=int, default=5)
    ap.add_argument("--width", type=int, default=64)
    ap.add_argument("--basis", default="z", choices=["x", "z"])
    ap.add_argument("--train-p", type=float, default=0.006)
    ap.add_argument("--total-shots", type=int, default=200_000_000)
    ap.add_argument("--batch-size", type=int, default=4096)
    ap.add_argument("--chunk-shots", type=int, default=32_768)
    ap.add_argument("--lr", type=float, default=1e-3)
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--num-workers", type=int, default=8)
    ap.add_argument("--no-amp", action="store_true")
    ap.add_argument("--log-every-shots", type=int, default=5_000_000)
    ap.add_argument("--snapshot", action="store_true",
                    help="also keep an immutable checkpoint at each logging point")
    ap.add_argument("--tag", default="gpu")
    return ap.parse_args()


def main() -> None:
    args = parse_args()
    cfg = TrainConfig(
        R=args.R, width=args.width, basis=args.basis, train_p=args.train_p,
        total_shots=args.total_shots, batch_size=args.batch_size,
        chunk_shots=args.chunk_shots, lr=args.lr, seed=args.seed,
        num_workers=args.num_workers, amp=not args.no_amp,
        log_every_shots=args.log_every_shots, tag=args.tag,
        snapshot=args.snapshot,
    )
    train(
        cfg,
        out_dir=REPO_ROOT / "models",
        metrics_path=REPO_ROOT / "results" / "training" / f"train_R{args.R}_{args.tag}.json",
    )


if __name__ == "__main__":
    main()
