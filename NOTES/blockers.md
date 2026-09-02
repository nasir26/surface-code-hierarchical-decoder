# Blockers

## B1 — No Vitis/Vivado/XRT toolchain, no physical Alveo U55C (open, structural)

**Status:** confirmed, 2026-09-02, via direct detection (see `results/env.json`).

**Detection performed:**
```
which v++ vitis_hls vivado        -> nothing found
platforminfo -l | grep -i u55     -> platforminfo not found
which xbutil; xbutil examine      -> xbutil not found
```

**Impact:** Per the provenance-tier scheme (README / paper Methodology), this rules out:
- **T1 (hardware)** — no board to run `xbutil`/host timers against.
- **T2 (post-implementation)** — no Vivado to place-and-route.
- **T3 (HLS estimate)** — no Vitis HLS to C-synthesize even an estimate.

Everything under `hw/` in this repo is therefore a **T4** artifact: a hand-written HLS-style C++ kernel that is believed synthesizable (follows standard `ap_fixed`/`#pragma HLS PIPELINE`/dataflow idioms) plus an analytical cycle-count and resource model calibrated against publicly documented U55C device limits (LUT/FF/DSP/BRAM/URAM/HBM capacity — cited from the AMD datasheet, not measured). It has **not** been synthesized, placed, routed, or run on silicon.

**Resolution options (per user decision 2026-09-02):** proceed with option "T4 simulation-only" — the paper is framed throughout as a design-and-simulation study, never as "implemented", "deployed", or "measured on hardware". Title/abstract must reflect this per R3. If the user later gets access to a machine with Vitis/Vivado/XRT and/or a physical U55C, this blocker can be revisited and Phases 4–5 re-run for real T2/T3/T1 numbers.

**Action:** all HLS/hardware claims in the paper carry an explicit T4 tag and a citation to this file / the "Scope and limitations of the hardware evaluation" subsection.

## B2 — Global git identity mismatch (resolved)

The machine's global `git config user.name/user.email` was set to a different person ("Saaru" / saarudarshini@gmail.com) than the paper's intended sole author. Resolved by setting a **local** (repo-scoped) git identity: `Nasir Ali` / `nasirali2607@gmail.com`. Global config left untouched.

## B3 — Commit co-authorship trailer (disclosed, not a blocker to proceed)

Per fixed Claude Code system configuration, every commit created by the assistant in this session includes a `Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>` trailer in the commit message body. This cannot be disabled by user request. The git **Author** field itself (name/email shown by GitHub as the commit author, and counted in the contributor graph) is set to the user (Nasir Ali / nasirali2607@gmail.com) — see B2. The noreply@anthropic.com address is not tied to a real GitHub account, so no separate Claude contributor avatar appears; the mention exists only as text in the commit message.

## B4 — Affiliation placeholder

`config/project.yaml` currently lists affiliation as "Independent Researcher" as a placeholder pending user confirmation. Update before final submission if a real institutional affiliation should be used instead.
