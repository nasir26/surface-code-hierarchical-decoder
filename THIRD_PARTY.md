# Third-party software and licences

This project depends on and, in places, follows the conventions of the following third-party open-source projects. This file records their licences and exactly how each is used here, per the integrity requirements of this project.

## Stim

- Repository: https://github.com/quantumlib/Stim
- Licence: Apache-2.0
- Version used: 1.16.0 (see `results/env.json`)
- Usage: direct dependency. Used unmodified via its Python API for circuit generation, detector-error-model export, and Monte Carlo sampling (`sinter`). No source code copied.

## PyMatching

- Repository: https://github.com/oscarhiggott/PyMatching
- Licence: Apache-2.0
- Version used: 2.4.0 (see `results/env.json`)
- Usage: direct dependency. Used unmodified as the MWPM/Sparse Blossom baseline decoder and as the on-host fallback decoder in the hierarchical pipeline. No source code copied.

## sinter

- Distributed alongside Stim by the same project (`quantumlib`).
- Licence: Apache-2.0
- Version used: 1.16.0
- Usage: direct dependency for parallel Monte Carlo collection with confidence-interval statistics.

## NVIDIA/Ising-Decoding

- Repository: https://github.com/NVIDIA/Ising-Decoding
- Licence: Apache-2.0 (copyright NVIDIA Corporation & Affiliates), verified via `gh api repos/NVIDIA/Ising-Decoding` on 2026-09-02.
- Usage: **conventions only, no code copied or vendored.** We follow the shape of their public-config-driven training recipe and their ONNX-export-plus-quantization pipeline as a pattern for our own `src/nn/` code, which is written independently for a different target (small, HLS-synthesizable-scale models, not GPU-scale). This usage (following a documented convention/architecture pattern rather than copying source) is compatible with Apache-2.0 and does not require attribution beyond this good-faith citation and the citation in `references.bib`.

## Springer Nature LaTeX template (`sn-jnl.cls`, `sn-basic.bst`)

- Source: Springer Nature's official LaTeX author-support page for *The Journal of Supercomputing* (journal 11227), per the journal's submission guidelines.
- Licence: Springer Nature's LaTeX Template Licence (permits use for manuscript preparation and submission to Springer Nature journals).
- Usage: vendored into `paper/` unmodified, as instructed by the journal's own submission guidelines, so the Overleaf project is self-contained.
- **Status: not yet vendored** — to be fetched and added in the paper-drafting phase (Phase 8).

## Data/statement

No other third-party source code is copied into this repository. Where an idea, architecture, or convention is reused from a cited paper without copying its code (e.g. the general pre-decoder+global-decoder hierarchy from S2, NVIDIA/Ising-Decoding, arXiv:2604.12841), that is disclosed in `NOTES/source_summaries/` and cited in `paper/references.bib`, not silently presented as original.
