# S8 — github.com/quantumlib/Stim

Verified via `gh api repos/quantumlib/Stim`, 2026-09-02. Public, Apache-2.0, 816 stars. Description: "A fast stabilizer circuit library." Latest release **v1.16.0 "Flowing Circuits"** (2026-05-22); our environment has the matching **1.16.0** installed (`results/env.json`).

## Contribution

The reference implementation of S5 (the Stim paper), extended well beyond the original 2021 paper's scope over subsequent years of development — circuit generation helpers (including the `surface_code:rotated_memory_z` generator we use directly), detector-error-model export, and the `sinter` package for parallel sampling/decoding statistics with confidence-interval handling, all live in this ecosystem (`sinter` is a separate PyPI package maintained alongside Stim by the same project).

## What we reuse

- `stim.Circuit.generated(...)` for all rotated-surface-code circuit construction across our full distance/noise-parameter matrix.
- `circuit.detector_error_model(decompose_errors=True)` as the shared DEM interface feeding both the neural pre-decoder's training data and PyMatching's decoding input.
- `sinter.Task` / `sinter.collect` for statistically sound, parallelized Monte Carlo shot collection across our experiment matrix, including its built-in shot/error-count-based stopping criteria, which we rely on to satisfy the build spec's requirement (§5.1) of ≥ 1000 logical errors observed per point (or the configured shot cap, whichever binds first).

## What we deliberately do differently

Nothing at the tool level. Our contribution is entirely downstream of Stim: what we do with the sampled detector events and DEM (train an FPGA-targeted NN pre-decoder, hierarchically combine it with PyMatching, and analyze FPGA-side throughput scaling), not any modification to circuit simulation itself.

## Exact claim we compare against

None — infrastructure citation, version-pinned in `results/env.json` and Table T10 for reproducibility.
