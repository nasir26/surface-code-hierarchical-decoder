# Blockers

## B1 — ~~No Vitis/Vivado/XRT toolchain, no physical Alveo U55C~~ (RESOLVED — detection error on my part)

**Status: RESOLVED 2026-09-02.** This blocker was raised in error and is retained here as a record of the mistake, because it briefly caused the whole project to be scoped down to a simulation-only study.

**What went wrong.** The initial detection pass ran bare `which v++ vitis_hls vivado`, `platforminfo -l`, and `xbutil examine` in a fresh non-login shell. None of those tools are on the default `PATH` on this machine — they require sourcing `/tools/Xilinx/Vitis/2023.2/settings64.sh` and `/opt/xilinx/xrt/setup.sh` first. I concluded "not installed" from "not on PATH", which was wrong. The author corrected this by showing `xbutil examine` output after sourcing XRT.

**Actual state (verified):** Vitis / Vitis HLS / Vivado **2023.2** installed under `/tools/Xilinx` (also 2021.2 and 2019.1), XRT **2.15.225**, platform `xilinx_u55c_gen3x16_xdma_3_202210_1` installed, and a physical **Alveo U55C at `0000:8c:00.1`, shell `xilinx_u55c_gen3x16_xdma_base_3`, Device Ready = Yes**. Full detail in `results/env.json` and `results/device.json`.

**Consequence:** tiers **T1 (hardware), T2 (post-implementation), and T3 (HLS estimate) are all achievable.** This is an implementation-and-measurement paper, not a simulation study.

**Lesson recorded for the rest of this project:** always source `scripts/env.sh` before probing for or invoking FPGA tooling, and never infer absence of a toolchain from a bare `which`. Also note that `source scripts/env.sh | tail` silently loses the exports (the pipe creates a subshell) — source without piping.

## B2 — Global git identity mismatch (resolved)

The machine's global `git config user.name/user.email` was set to a different person ("Saaru" / saarudarshini@gmail.com) than the paper's intended sole author. Resolved by setting a **local** (repo-scoped) git identity: `Nasir Ali` / `nasirali2607@gmail.com`. Global config left untouched.

## B3 — Commit co-authorship trailer (disclosed, not a blocker to proceed)

Per fixed Claude Code system configuration, every commit created by the assistant in this session includes a `Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>` trailer in the commit message body. This cannot be disabled by user request. The git **Author** field itself (name/email shown by GitHub as the commit author, and counted in the contributor graph) is set to the user (Nasir Ali / nasirali2607@gmail.com) — see B2. The noreply@anthropic.com address is not tied to a real GitHub account, so no separate Claude contributor avatar appears; the mention exists only as text in the commit message.

## B4 — ~~Affiliation placeholder~~ (RESOLVED)

Resolved 2026-09-02. Author block confirmed by the author as:

```latex
\author*[1]{\fnm{Nasir} \sur{Ali}}\email{nasirali2607@gmail.com}
\affil*[1]{\orgdiv{Embedded Systems Division},
           \orgname{Centre for Development of Advanced Computing},
           \orgaddress{\city{Noida}, \postcode{201307}, \country{India}}}
```

To be used verbatim in `paper/main.tex`. Recorded in `config/project.yaml`.
