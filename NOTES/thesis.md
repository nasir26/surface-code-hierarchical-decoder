# Thesis

**Revised 2026-09-02** after the toolchain/board detection error was corrected (see `NOTES/blockers.md`, B1). The earlier draft scoped this to a T4 simulation-only study on the false premise that no FPGA toolchain or board existed. Both do. This is an implementation-and-measurement paper.

## One-paragraph claim

We present a two-tier surface-code decoder in which a heavily quantized convolutional neural-network **pre-decoder**, implemented in Vitis HLS and deployed on an AMD Alveo U55C, resolves the majority of low-weight syndromes within a single QEC round, while an on-host Sparse Blossom (PyMatching v2) decoder handles only the residual syndromes escalated by a calibrated confidence gate. We show that the gate threshold τ tunes a Pareto front between logical fidelity, end-to-end latency, and fabric resources; that quantization to INT8/INT6/INT4 trades measurable logical-error-rate degradation against LUT/DSP cost; and — the U55C-specific contribution — that binding N independent decoder engines to distinct HBM pseudo-channels scales aggregate syndrome throughput, letting one card service the syndrome bandwidth of many logical qubits. All FPGA results are measured on a physical card (T1) or harvested from post-place-and-route reports (T2), with HLS estimates (T3) reported alongside for the design-space sweep.

## Novelty — narrowed after reading S1 and S2 properly

This is the most important correction from Phase 0. I fetched the real abstracts rather than working from titles, and both 2026 papers are closer to the original pitch than the build spec assumed:

- **S1** (arXiv:2605.04892) is a **T1 hardware** real-time FPGA NN decoder already integrated into a live superconducting control loop: 550 ns deterministic closed loop, 124 ns NN decode, distance-3, inside a 1.25 µs cycle. So "real-time FPGA neural decoding, demonstrated on hardware" is **already done**. We cannot claim it.
- **S2** (arXiv:2604.12841, NVIDIA) **already published the pre-decoder + global-decoder hierarchy itself**, escalating residual syndromes to PyMatching, open-sourced, at O(1 µs)/round on GB300 GPUs, and beating correlated PyMatching up to distance-13. So the hierarchy is **their** idea, not ours.

What honestly remains ours:

1. **The hierarchy on HBM-class FPGA fabric.** S2's hierarchy is GPU-resident; S1's FPGA decoder is a monolithic real-time decoder in the control stack, not a pre-decoder with an exact fallback. The combination — quantized pre-decoder in fabric, exact decoder on host, confidence gate between them, on a PCIe/HBM accelerator — is, pending the Related Work sweep, unpublished.
2. **Fleet-level throughput via HBM pseudo-channel parallelism.** S1 answers "how fast for one logical qubit"; S2 answers "how fast with more GPUs". We ask "how many logical qubits can one card sustain", scaling engines against the card's 32 HBM pseudo-channels and measuring where bandwidth, not compute, binds. This is the question *The Journal of Supercomputing*'s readership actually cares about, and it is an accelerator-architecture question rather than a quantum-physics one.
3. **Quantization-vs-fidelity Pareto at HLS bit-widths**, tied to measured LUT/DSP/BRAM cost from real place-and-route — a fabric-specific tradeoff with no GPU analogue.
4. **An end-to-end reproducible artifact** spanning Stim generation → QAT training → HLS → xclbin → on-card measurement → paper figures, with every number tier-tagged to its provenance.

**We are not claiming to be first to NN pre-decoders (S2) or first to real-time FPGA QEC decoding (S1).** We claim the first HBM-class multi-engine FPGA realization of the pre-decoder/exact-fallback hierarchy, with a fleet-throughput and quantization-cost analysis grounded in on-card measurement. Related Work must state both prior claims plainly and early.

## Honest comparison discipline

S1's 550 ns is a closed-loop latency including feedback on a real quantum device; our latency will be a host-to-card-to-host decode latency on a synthetic syndrome stream. **These are not the same quantity** and the paper must never table them as if they were. Where we tabulate S1 and S2 alongside our numbers (Table T2), each row carries its platform, what was measured, and whether a quantum device was in the loop.

## Journal fit

*The Journal of Supercomputing* is an HPC/accelerator-architecture venue. Emphasis: memory hierarchy (HBM pseudo-channel binding, bandwidth roofline), dataflow and II, latency tails (p50/p99/p99.9) against the ~1 µs round budget, energy per decode, and multi-engine scaling. The quantum content is the workload, not the contribution.
