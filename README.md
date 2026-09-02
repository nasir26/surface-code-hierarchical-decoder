# Hierarchical NN Pre-Decoder + Sparse-Blossom Fallback for Surface Codes (simulated for Alveo U55C)

**Status: Phase 0 (recon) complete. Phases 1–9 not yet started.** See `NOTES/thesis.md` for the current scientific claim (draft, pending author approval) and `NOTES/blockers.md` for known constraints.

## What this is

A two-tier surface-code decoder: a small, quantized neural-network pre-decoder resolves most low-weight syndromes, escalating only hard cases through a calibrated confidence gate to an on-host Sparse Blossom (PyMatching v2) decoder. The pre-decoder is implemented in Vitis HLS and runs on a physical AMD Alveo U55C (HBM2, PCIe).

**Hardware and toolchain available** (see `results/env.json`, `results/device.json`):

- AMD Alveo U55C, `xcu55c-fsvh2892-2L-e`, at `0000:8c:00.1`, shell `xilinx_u55c_gen3x16_xdma_base_3`
- Vitis / Vitis HLS / Vivado 2023.2, XRT 2.15.225, platform `xilinx_u55c_gen3x16_xdma_3_202210_1`
- Host: AMD EPYC 7742 (64 cores), 251 GB RAM, NVIDIA RTX A4000 for training

Results are tier-tagged by provenance: **T1** measured on the card via XRT, **T2** post-place-and-route reports, **T3** Vitis HLS estimates, **T4** software simulation / analytical model. Every number in the paper traces to a tagged file under `results/`.

Before running anything that touches the FPGA tooling:

```bash
source scripts/env.sh    # sources Vitis 2023.2 settings64.sh + XRT setup.sh + the venv
```

Note that the Xilinx tools are **not** on the default `PATH` on this machine; `which v++` will fail until `scripts/env.sh` is sourced.

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
