# S2 — Fast and accurate AI-based pre-decoders for surface codes

**arXiv:2604.12841** (submitted 2026-04-14, quant-ph). Chamberland, Olle, Li, Thornton, Baratta (NVIDIA). Verified via arXiv API 2026-09-02. Companion open-source repo: `github.com/NVIDIA/Ising-Decoding` (Apache-2.0, verified via `gh api`).

## Contribution

This is the direct conceptual ancestor of our own pre-decoder idea, and we must be explicit that **the pre-decoder + global-decoder hierarchy is their idea, not ours** — our contribution is porting that hierarchy onto an HBM-class FPGA and studying multi-engine throughput scaling, not inventing the hierarchy itself. S2 introduces a scalable, block-wise-parallel AI pre-decoder for the surface code: a neural network consumes detector syndromes across space *and* time, removes the large majority of low-weight/local errors, and hands only the residual syndrome to a downstream global decoder (PyMatching, "uncorrelated" variant, in their surface-code path). The architecture is explicitly backend-agnostic and open-sourced.

## Method

Their target platform is **NVIDIA GB300 GPUs**, not FPGAs — this is the single most important distinction between S2 and our work. They report end-to-end decoding runtimes of order O(1 µs) per round at large code distances, reducible well below that with block-wise parallelism across multiple GPUs. They additionally introduce a noise-learning variant that infers matching-graph weights directly from syndrome statistics rather than requiring an explicit circuit-level noise model, which lets the pre-decoder be trained/calibrated without a hand-built noise model of the device. Their released repo (`NVIDIA/Ising-Decoding`) ships a public training config (`conf/config_public.yaml`), pre-trained models on Hugging Face, and an ONNX export + quantization path for downstream deployment — this is the exact recipe convention we adopt for our own `src/nn/export.py` (ONNX + golden-vector export for hardware cosim), crediting them for the pattern.

## What we reuse

- The **pre-decoder-removes-the-easy-majority, escalate-the-rest** architecture itself (with attribution — this is S2's core idea, refined from the general pre-decoder literature).
- Their config/training-recipe conventions and the ONNX export pipeline shape, per the build spec's explicit instruction to follow `nvidia/ising-decoding` conventions where the Apache-2.0 licence permits (see `THIRD_PARTY.md`).
- Their choice of PyMatching as the "downstream global decoder" — we use the same choice (Sparse Blossom / PyMatching v2), which also lets us use *their* baseline decoder honestly as our own escalation-path decoder rather than inventing a different fallback.

## What we deliberately do differently

- **Platform:** GPU (GB300) vs. our target, an HBM-attached **FPGA** (Alveo U55C). This is the paper's central novelty claim — nobody has published the FPGA+HBM version of this hierarchy at the time of writing (subject to the related-work search in §3 of the build spec).
- **Unit of scaling:** they scale by adding more GPUs; we scale by adding more HBM-bound decoder *engines within one card*, which is a fundamentally different resource/parallelism story (fixed silicon budget, pseudo-channel bandwidth partitioning) and is the subject of our Fig9/Fig14.
- **Confidence gating:** our design explicitly exposes and sweeps a tunable confidence threshold τ producing a coverage/accuracy/latency Pareto front (Fig10); S2's abstract does not describe an explicit per-shot confidence-gated escalation threshold as a tunable knob — it removes the majority of errors "before passing residual syndromes" but does not appear (as summarized) to present this as an operator-tunable τ sweep, which we treat as an area where we are more explicit / operationally oriented.

## Exact claim we compare against

"O(1 µs) end-to-end decoding runtime per round at large code distances on GB300 GPUs, integrated with uncorrelated PyMatching, with further reduction below O(1 µs) via block-wise multi-GPU parallelism." Cited in Related Work and used to frame the "GPU vs FPGA-HBM" contrast explicitly; never presented as a number we beat, since our own numbers are T4 and not measured on the same class of hardware.
