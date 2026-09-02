# S7 — github.com/oscarhiggott/PyMatching

Verified via `gh api repos/oscarhiggott/PyMatching`, 2026-09-02. Public, Apache-2.0, 359 stars. Description: "PyMatching: A Python/C++ library for decoding quantum error correcting codes with minimum-weight perfect matching." Latest release **v2.3.1** (2025-09-25) at time of the source-verification pass; our environment has **v2.4.0** installed (`results/env.json`), a point release newer than what was current when the source list was drafted — recorded here so the version discrepancy is explained rather than silently inconsistent.

## Contribution

The reference implementation of both S3 (the original Python-package MWPM decoder and local matching) and S4 (sparse blossom, the C++ core shipped as PyMatching v2). It is the concrete software artifact underlying two of our citations, and it is the software we actually run.

## What we reuse

- **The library itself**, directly, as: (a) the accuracy/threshold baseline decoder (B1 in the build spec's baseline matrix), and (b) the on-host fallback decoder inside our hierarchical pipeline whenever the NN pre-decoder's confidence gate escalates a shot.
- Its **benchmarking-harness conventions** (used together with `sinter`, S5/S8) for parallel Monte Carlo collection.
- Its DEM-based decode interface, matched directly to Stim's `detector_error_model()` export, which is precisely the shared-interface requirement in build spec §5.1.

## What we deliberately do differently

Nothing at the algorithm level — we treat PyMatching as a trusted, unmodified dependency. Our own contribution is entirely in what happens *before* a shot reaches PyMatching (the FPGA-side pre-decoder and confidence gate) and in the *system-level throughput/backlog study* of how much load a well-tuned pre-decoder keeps off PyMatching entirely.

## Exact claim we compare against

We record the exact installed version (v2.4.0) in every result JSON via `env_ref` (build spec §7 schema), and Table T10 (reproduction manifest) lists it explicitly, so that any future re-run of this codebase against a different PyMatching release can be sanity-checked against a known baseline version rather than an undated "PyMatching" citation.
