# Hierarchical NN Pre-Decoder + Sparse-Blossom Fallback for Surface Codes (simulated for Alveo U55C)

**Status: Phase 0 (recon) complete. Phases 1–9 not yet started.** See `NOTES/thesis.md` for the current scientific claim (draft, pending author approval) and `NOTES/blockers.md` for known constraints.

## What this is

A study of a two-tier surface-code decoder: a small, quantized neural-network pre-decoder resolves most low-weight syndromes, escalating only hard cases to an on-host Sparse Blossom (PyMatching v2) decoder. The pre-decoder is designed for an AMD/Xilinx Alveo U55C (HBM2, PCIe), but **no Vitis, Vivado, XRT toolchain, or physical U55C is available in the development environment used for this project** (see `results/env.json`, `NOTES/blockers.md`). Consequently:

- **No FPGA synthesis, place-and-route, or hardware run has been performed.**
- All FPGA-side numbers in this repository and its accompanying paper are **Tier T4** — analytical/cycle-model estimates or software simulation — never "measured," "implemented," or "deployed."
- Software-side results (Stim-generated circuits, PyMatching baselines, NN training/inference) are real measurements taken on the host described in `results/env.json` (AMD EPYC 7742, NVIDIA RTX A4000).

See the provenance-tier table in the paper's Methodology section for the full T1–T4 definitions used throughout.

## Repository layout

See `PROMPT.md` (the original build specification this project follows) for the intended full layout. Current state:

```
config/            project + experiment configuration
schemas/           JSON schema for result files
src/qec/           Stim dataset generation, PyMatching baselines, statistics  [not yet implemented]
src/nn/            neural pre-decoder: model, training, quantization, export   [not yet implemented]
src/pipeline/      hierarchical decode + confidence gate + backlog model      [not yet implemented]
hw/                HLS-style kernel design (untested — no toolchain to verify) [not yet implemented]
host/              XRT host code (not runnable without a board)               [not yet implemented]
scripts/           reference fetching, figure/table generation                [not yet implemented]
results/           env.json (done), device.json, per-experiment JSON          [in progress]
paper/             Overleaf-ready Journal of Supercomputing manuscript        [not yet started]
NOTES/             thesis, blockers, decisions, source summaries              [in progress]
```

## Reproducing the environment

```bash
python3.11 -m pip install --user virtualenv   # this repo's dev host had no python3.11-venv/ensurepip system package
python3.11 -m virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Provenance and integrity

This project follows a strict no-fabrication policy: every number in the paper traces to a file under `results/`, tagged with its provenance tier (T1 hardware / T2 post-implementation / T3 HLS estimate / T4 simulation-model). See `NOTES/blockers.md` for the specific toolchain/hardware constraints of this project's environment, and `THIRD_PARTY.md` for third-party licence compliance.

## License

Apache-2.0 — see `LICENSE`.
