# S1 — Real-time Surface-Code Error Correction Using an FPGA-based Neural-Network Decoder

**arXiv:2605.04892** (submitted 2026-05-06, quant-ph). Yang, Sun, Wu, Zhang, Jiang, Linpeng, Zhou, Chu, Niu, Zhong, Liu, Yu. Verified via arXiv API 2026-09-02.

## Contribution

This is a **hardware-measured (T1)** demonstration, not a simulation. The authors report a hardware-integrated control architecture built around an FPGA-based neural-network decoder, wired directly into the control electronics of a real superconducting quantum processor, and run a distance-3 rotated surface-code memory experiment with genuine real-time feedback. The headline number is a deterministic closed-loop latency of **550 ns**, of which **124 ns** is attributable to the NN decode itself, comfortably inside a 1.25 µs QEC cycle. They further demonstrate mid-circuit feedback correction for non-Clifford logical circuits — a regime where simple Pauli-frame tracking (deferring corrections to the end of the circuit) is not sufficient and the correction must actually be applied mid-computation, which requires the low latency they achieve.

## Method

The NN decoder appears to be a small, low-latency model mapped directly onto FPGA fabric sitting in the classical control loop of the cryostat's control electronics (not a PCIe-attached accelerator card decoding batched syndromes from a separate host, which is the architecture we and S2 use). The comparison against "offline decoding" (i.e., decoding the same shots later, off the critical path, presumably with a more powerful decoder) is used to show the real-time path does not sacrifice logical performance.

## What we reuse

- The framing that **decoder latency vs. QEC-cycle-period** is the correct way to state the real-time requirement (we use it identically in our backlog analysis, §5.5 of the design doc).
- Their result as the credible **T1 upper bound of what dedicated real-time FPGA NN decoding can achieve** for distance-3 — useful as a related-work anchor point.
- The mid-circuit feedback framing as motivation in our Introduction for why sub-microsecond decode-and-correct matters beyond simply avoiding backlog.

## What we deliberately do differently

We target the **Alveo U55C**, a PCIe/HBM-attached datacenter accelerator card, not decoder logic embedded directly in the qubit control stack. Our system is a **host-attached decoder for a batched/streamed syndrome interface** (the architecture realistically compatible with a classical control system that ships syndromes off-cryostat over a fast link), and our contribution is about **HBM-channel parallelism across many logical qubits** and a **confidence-gated hierarchical fallback to Sparse Blossom**, not single-qubit closed-loop latency on custom control hardware. Because we have no Vitis/Vivado/board in this project's environment (see `NOTES/blockers.md`, B1), all of our own numbers are Tier T4 (analytical/simulated) — we do **not** claim to match or beat S1's 550 ns T1 hardware result; we cite it explicitly as the state of the art for real hardware and are careful never to imply our T4 estimate is comparable evidence.

## Exact claim we compare against

"550 ns deterministic closed-loop latency, 124 ns NN-decode component, distance-3, T1 hardware, single logical qubit, embedded control-loop FPGA." This goes into related-work Table T2 with an explicit "T1, hardware" tag, contrasted against our T4 estimate for a very different architecture (host-attached multi-engine HBM decoder), so the comparison is stated as apples-to-oranges rather than a head-to-head.
