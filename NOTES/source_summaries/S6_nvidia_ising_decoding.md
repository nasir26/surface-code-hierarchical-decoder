# S6 — github.com/NVIDIA/Ising-Decoding

Verified via `gh api repos/NVIDIA/Ising-Decoding` and repo README, 2026-09-02. Public, Apache-2.0 licensed ("NVIDIA CORPORATION & AFFILIATES"), 114 stars, created 2026-03-03. Companion code release for S2.

## Contribution

This is the open-source training-recipe repository accompanying S2 (and a companion color-code paper). It provides: a single user-facing YAML config (`conf/config_public.yaml`) selecting between `code: surface` and `code: color`; pre-trained surface-code and color-code pre-decoder models published on Hugging Face (`nvidia/Ising-Decoder-SurfaceCode-1-{Fast,Accurate}`, `nvidia/Ising-Decoder-ColorCode-1-Fast`); a single runner script covering both code families; and a downstream tooling chain including `.pt` → SafeTensors conversion and **ONNX export with quantization**, plus a data-generation path for CUDA-Q QEC real-time pre-decoder test applications.

## What we reuse (licence-permitted, Apache-2.0 — see `THIRD_PARTY.md`)

- **Config/recipe conventions**, not code verbatim: a single YAML config file driving both training and inference, mirrored in our own `config/experiments/matrix.yaml` structure.
- **The ONNX-export-plus-quantization pipeline shape** for `src/nn/export.py` — export a trained model to ONNX, then quantize, matching our own requirement (build spec §5.3) to produce ONNX + a NumPy golden-vector oracle for HLS cosim bit-exactness checking.
- The general idea of **publishing pre-trained checkpoints alongside training recipes** for reproducibility — we follow the same pattern for our own (much smaller) QAT-swept models, publishing checkpoints/ONNX exports as GitHub Release artifacts rather than a separate model hub, given our scale.

We do **not** vendor or import their code directly; our models target a different platform (FPGA HLS synthesis at ≤ ~100k parameters vs. their GPU-scale models for GB300), so no source-level reuse is applicable beyond following the same conventions. `THIRD_PARTY.md` records the Apache-2.0 licence and confirms our usage (convention-following, no code copied) is compliant.

## What we deliberately do differently

Everything downstream of "detector syndromes in, correction + confidence out": our target is Vitis HLS synthesis (`ap_fixed` quantized C++), not a GPU training/inference runtime; our models are two-to-three orders of magnitude smaller by parameter count (≤ ~100k vs. GPU-scale); and our quantization sweep (FP32/INT8/INT6/INT4/ternary) targets HLS bit-width/resource tradeoffs specifically, rather than GPU inference throughput.

## Exact claim we compare against

None directly — S6 is cited as the software/recipe artifact accompanying S2's numerical claims (already captured in `S2_ai_predecoders.md`), and separately in `THIRD_PARTY.md` for licence compliance.
