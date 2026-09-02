# Thesis (draft — needs your approval before Phase 1)

## One-paragraph claim

We study a two-tier surface-code decoder in which a heavily quantized neural-network **pre-decoder** — designed for, but in this project's environment only *simulated against*, the Alveo U55C's HBM-attached fabric — resolves the majority of low-weight syndromes within a single QEC round, while an on-host Sparse Blossom (PyMatching v2) decoder handles only the residual, escalated syndromes. We show that the pre-decoder's coverage/accuracy operating point is tunable via a confidence threshold τ, producing a Pareto front between decode latency, logical fidelity, and (modeled) FPGA fabric resources; and we build an analytical, cycle-level throughput model of HBM pseudo-channel parallelism showing how many independent decoder engines — and hence how many logical qubits' worth of syndrome bandwidth — a single U55C could plausibly sustain, addressing the decoder-backlog problem at the fleet level rather than the single-decoder level.

## What changed since the original build-spec draft, and why it matters

The build spec that seeded this project assumed we might find *either* no board *and* Vitis HLS available (giving T3 estimates), *or* a board (T1/T2). Actual detection in this environment (`NOTES/blockers.md`, B1) found **neither Vitis/Vivado nor XRT installed, and no board attached** — a strictly worse starting point than the spec anticipated. Consequences we're committing to up front, per your decision to proceed T4-only:

1. **No T1, T2, or T3 result is possible from this project as currently resourced.** Every FPGA-side number in this paper is **T4**: an analytical/cycle-count model, not a synthesis or hardware measurement.
2. We will still **write** an HLS-style C++ kernel (`hw/hls/kernel.cpp`) following standard idioms (`ap_fixed`, `#pragma HLS PIPELINE II=1`, dataflow) as a concrete design artifact, but we cannot compile, csim, or cosim it in this environment — it must be labeled **"untested design, no toolchain available to verify"**, not "synthesizable" or "verified."
3. The paper's title, abstract, and Section 1 must say **"evaluated via analytical simulation; no hardware synthesis was performed"** — never "implemented", "deployed", "synthesized", or "measured on hardware." This is stricter than the build spec's own fallback language ("post-implementation simulation"), because we have no implementation step at all, not even HLS C-synthesis.

## Honest novelty pitch (revised after reading S1 and S2's actual abstracts, not just their titles)

This is the most important update from Phase 0 recon. Both S1 and S2 are **closer to our idea than the original spec's framing assumed**:

- **S1** (arXiv:2605.04892) is a **hardware-measured (T1)** real-time FPGA NN decoder already integrated into a real superconducting control loop, at 550 ns closed-loop / 124 ns decode latency, distance-3. This is not a pre-decoder-plus-fallback hierarchy — it's a standalone real-time NN decoder embedded in the control stack — but it means "FPGA NN decoder, real, fast" is **already demonstrated on real hardware** by someone else. We cannot claim to be first to real-time FPGA NN decoding, and must not imply our T4 numbers are comparable to their T1 numbers.
- **S2** (arXiv:2604.12841, NVIDIA) **already published the pre-decoder + global-decoder hierarchy** we based our core idea on, including a confidence-style escalation to PyMatching, open-sourced training recipes, and O(1 µs)/round performance — but on **GPU (GB300)**, not FPGA.

Given that, our defensible novelty is narrower and more specific than the original four-point pitch:

1. **Porting the (already-published, S2-originated) pre-decoder/global-decoder hierarchy to an HBM-class FPGA target**, which — as far as our Related Work search can establish — has not been published; prior FPGA decoder work (Das et al., Ueno et al., Barber et al. — to be verified in Phase 0's related-work pass) targets DDR/BRAM-class devices and single-decoder latency, not HBM pseudo-channel fleet parallelism.
2. **A fleet/backlog-level throughput study** (how many logical qubits per card) via HBM pseudo-channel parallelism, framed explicitly against Skoric et al.'s backlog argument — this is a different question from S1's single-qubit latency result and S2's multi-GPU scaling result.
3. **A quantization-vs-fidelity Pareto analysis** at HLS-relevant bit-widths (FP32/INT8/INT6/INT4/ternary), which is a resource-cost question specific to fabric implementation, not GPU inference.
4. **Full honesty about the simulation/no-hardware boundary** as a methodological contribution in its own right — an explicit provenance-tier framework (T1–T4) applied throughout, so a reader always knows exactly how much to trust each number. Given we're at T4 throughout the FPGA side, this paper reads as a **design-space and analytical-performance study**, not an implementation paper — which is a legitimate, honestly-scoped contribution, not a downgrade to hide.

**This paper is not claiming to be first to NN pre-decoders (S2) or first to real-time FPGA QEC decoding (S1). It claims to be the first (pending Related Work verification) analytical study of pre-decoder+fallback hierarchies specifically on HBM-class multi-engine FPGA fabric, with an explicit backlog/fleet-throughput framing.** Please confirm this narrower framing is what you want before Phase 1 — it is more defensible than the original four-point pitch but is also a smaller claim.

## Journal fit

*The Journal of Supercomputing* is an HPC/architecture venue. Emphasis stays on: memory hierarchy (HBM pseudo-channels), dataflow, roofline/bandwidth analysis, latency tails (p50/p99/p99.9), and fleet-level scaling — not quantum physics. This is unaffected by the hardware-availability finding above.

---
**Awaiting your go/no-go on this narrower novelty framing before starting Phase 1 (Stim data generation + PyMatching baselines).**
