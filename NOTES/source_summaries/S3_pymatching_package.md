# S3 — PyMatching: A Python package for decoding quantum codes with minimum-weight perfect matching

**arXiv:2105.13082** (v1: 2021-05-27, v2: 2021-07-12). Oscar Higgott, sole author. Verified via arXiv API 2026-09-02.

**Correction note:** the build-spec draft referred to this as "PyMatching: A Python/C++ library for decoding quantum error correcting codes with minimum-weight perfect matching" — that phrase is actually the current GitHub repository *description* (verified via `gh api repos/oscarhiggott/PyMatching`), not the paper's title. The paper's real title is "PyMatching: A Python package for decoding quantum codes with minimum-weight perfect matching." Both are cited correctly and separately in `references.bib` (arXiv paper vs. software/repository), using the correct title for each.

## Contribution

Introduces PyMatching, the original open-source Python package for MWPM decoding of quantum error-correcting codes, at the time built as a Python wrapper providing an ergonomic interface for QEC researchers. Alongside the standard MWPM decoder, the paper introduces **local matching**: a variant that restricts each syndrome defect to be matched only within a local neighbourhood, which cuts computational complexity roughly quadratically relative to full MWPM while giving decoding performance almost identical to the standard MWPM decoder in practice. The paper benchmarks PyMatching against NetworkX- and Blossom-V-based full-MWPM implementations and shows several-orders-of-magnitude speedups at problem sizes typical of QEC simulation. It supports weighted edges, hook errors, boundaries, and measurement errors — the feature set that makes it usable for realistic circuit-level noise, not just idealized code-capacity models.

## What we reuse

- PyMatching's **Python API and DEM-based decoding interface** are what our software pipeline calls directly (`src/qec/baselines.py`) for the "MWPM" baseline curves and for the on-host fallback decoder inside the hierarchical pipeline (`src/pipeline/hierarchical.py`).
- The **local-matching concept** is conceptually relevant background for our confidence-gated hierarchy: both approaches are, in different ways, about not paying full global-MWPM cost on every shot.
- We report **v2.4.0** installed in this project's environment (`results/env.json`), i.e. we run the modern C++-core PyMatching (Sparse Blossom, S4), not the pure-Python v1 architecture this original paper describes — we make this version distinction explicit wherever we cite "PyMatching" to avoid conflating the 2021 paper's algorithm with the 2023 Sparse Blossom algorithm actually running under the hood.

## What we deliberately do differently

Nothing algorithmic — S3 is background/API provenance, not a design we are modifying. The distinction we maintain in the paper is purely bibliographic: S3 is cited for the *package and local-matching concept*, S4 (Sparse Blossom) is cited for the *actual decoding algorithm* our baseline numbers measure, per R5 of the build spec (baselines must be run on our machine, not quoted from either paper).

## Exact claim we compare against

No performance number from S3 is used as a compared-against target (the paper predates the C++ Sparse Blossom core and its 2021-era timing numbers are not representative of the `pymatching==2.4.0` we actually run). We instead re-run PyMatching v2.4.0 ourselves (R5) and only use S3 for the local-matching background paragraph in Related Work.
