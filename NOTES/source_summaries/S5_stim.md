# S5 — Stim: a fast stabilizer circuit simulator

**arXiv:2103.02202** (submitted 2021-03-03, revised 2021-06-18). **Published: Quantum 5, 497 (2021).** Craig Gidney, sole author. Verified via arXiv API 2026-09-02.

## Contribution

Introduces Stim, a stabilizer-circuit simulator built around three main improvements over the classic Aaronson–Gottesman CHP-style tableau simulator: (1) tracking the *inverse* of the circuit's stabilizer tableau to make deterministic measurement linear rather than quadratic in circuit size; (2) a cache-friendly data layout using 256-bit-wide SIMD instructions for the constant-factor speedup; and (3) using expensive tableau simulation only *once*, to build a single reference sample, after which further samples are generated cheaply by propagating batches of Pauli frames relative to that reference. The paper reports analyzing a distance-100 surface code circuit (20,000 qubits, 8 million gates, 1 million measurements) in 15 seconds, then sampling full circuit shots at 1 kHz.

## What we reuse

Stim is our **entire dataset-generation and noise-modelling substrate** (`src/qec/dataset.py`), exactly as prescribed by the build spec:
- `stim.Circuit.generated("surface_code:rotated_memory_z", ...)` for rotated-surface-code memory experiments at distances d ∈ {3, 5, 7, (9)}.
- `circuit.detector_error_model(decompose_errors=True)` as the **single shared interface** between the two decoders — both the neural pre-decoder and PyMatching (S4) train/decode against the same DEM, so neither decoder ever sees a different noise model than the other, which the build spec explicitly requires (§5.1).
- `sinter` (part of the same project ecosystem, `quantumlib`) for parallel Monte Carlo collection of baseline decoder statistics with correct confidence-interval plumbing.

We record the installed Stim version (1.16.0, per `results/env.json`) and use fixed seeds throughout for reproducibility, per the build spec's R-level integrity requirements.

## What we deliberately do differently

Nothing — Stim is infrastructure we depend on, not a design we are extending or comparing against. There is no "claim to compare against" in the sense of a performance number we are trying to beat; Stim's role in our paper is purely as the cited tool that produced every shot in `results/`, and its own microbenchmarks (1 kHz sampling, 15 s for a distance-100 circuit analysis) are cited only as background evidence that circuit-level Monte Carlo at our target distances (≤ 9, far below Stim's own distance-100 example) is comfortably within reach on our 64-core host.

## Exact claim we compare against

None (infrastructure citation). Version and citation recorded for reproducibility per the Methodology section and Table T10 (reproduction manifest).
