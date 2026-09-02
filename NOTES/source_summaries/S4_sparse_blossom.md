# S4 — Sparse Blossom: correcting a million errors per core second with minimum-weight matching

**arXiv:2303.15933** (v1: 2023-03-28, v2: 2025-01-14). **Published: Quantum 9, 1600 (2025).** Oscar Higgott, Craig Gidney. Verified via arXiv API 2026-09-02.

**Correction note:** the build-spec draft cited this under a slightly different arXiv ID placeholder; the correct, verified ID is **2303.15933**, and it should be cited primarily as the published *Quantum* journal article (per R4's preference for the published version over the preprint), with the arXiv ID retained as a secondary/preprint reference in the BibTeX entry's `eprint` field.

## Contribution

Introduces the **sparse blossom** algorithm, a variant of Edmonds' blossom algorithm specialised to directly solve the MWPM decoding problem for quantum error correction, rather than solving a generic weighted-matching problem via repeated all-to-all Dijkstra searches (the bottleneck in earlier MWPM decoder implementations). The headline result: for 0.1% circuit-level depolarizing noise, sparse blossom decodes both the X and Z bases of a **distance-17** surface code circuit in **under 1 µs per round of syndrome extraction on a single CPU core** — matching the syndrome-generation rate of real superconducting hardware. The algorithm is released as **PyMatching v2**.

## What we reuse

This is **the exact fallback decoder in our hierarchical design.** Every "escalated" syndrome in our pipeline (`src/pipeline/hierarchical.py`) is handed to PyMatching v2 (sparse blossom), and our own MWPM baseline curves in Fig6/Fig7 are sparse-blossom curves. Per **R5** of the build spec, we do **not** quote the 1-µs/distance-17 number from the paper as our own baseline — we re-run PyMatching v2.4.0 ourselves, on our own AMD EPYC 7742 host (see `results/env.json`), record our own single-core throughput and per-shot latency distribution, and report our machine's spec alongside the number, precisely because the paper's number was measured on different hardware and reporting it as if measured on ours would misrepresent it.

## What we deliberately do differently

Nothing algorithmic on the CPU side — we are consumers of sparse blossom, not modifiers of it. Our contribution relative to S4 is architectural: S4 establishes that a *single CPU core* can sustain real-time MWPM throughput for a *single* logical qubit's syndrome stream. Our backlog analysis (Fig14) asks the *multi-qubit fleet* version of that question — how many logical qubits' worth of syndromes can be kept off the CPU entirely by an FPGA pre-decoder, so that the CPU-bound sparse-blossom fallback (whose throughput ceiling S4 established) is only ever exercised on the residual, escalated fraction. Our escalation-rate sweep (τ vs. escalation rate, feeding into the Pareto front, Fig10) is explicitly a study of how close to the sparse-blossom-alone throughput ceiling a hierarchical system needs to come, as a function of how good the pre-decoder is.

## Exact claim we compare against

"< 1 µs per round, both bases, distance-17, 0.1% circuit-level depolarizing noise, single CPU core (their hardware)." We compare our **own re-measured** single-core PyMatching v2 throughput (our hardware, our noise points, tier **T4/host-CPU**, reported in `results/*.json` and Table T8) against this claim only as context — never substituting their number for a measurement we did not make.
