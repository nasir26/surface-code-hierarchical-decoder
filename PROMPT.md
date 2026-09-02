# Claude Code Build Spec — Hierarchical NN Pre-Decoder + Sparse-Blossom Fallback for Surface Codes on Alveo U55C

> **How to use:** save this file as `PROMPT.md` in an empty directory, open Claude Code there, and say:
> *"Read PROMPT.md and execute it phase by phase. Stop at each checkpoint and show me the artifacts before continuing."*

---

## 0. Role and mission

You are acting as a research engineer + first author. Your job is to produce **two coupled deliverables**:

1. **A working, reproducible codebase** that implements and evaluates a hierarchical quantum-error-correction decoder targeting a **Xilinx/AMD Alveo U55C** accelerator card, synthesising ideas from the source works listed in §3.
2. **A complete, submission-ready manuscript** for *The Journal of Supercomputing* (Springer, journal 11227), living in a self-contained `paper/` folder that can be zipped, uploaded to Overleaf, and compiled with zero edits.

Everything must be committed to GitHub with a clean, reviewable history.

**Work in phases (§15). Do not sprint to the paper.** The paper is written *from* `results/*.json`, never from memory or expectation.

---

## 1. Non-negotiable integrity rules

These override every other instruction in this file. Springer screens for fabrication and plagiarism, and a paper with invented numbers is worse than no paper.

**R1 — No invented numbers.** Every number in the manuscript must trace to a file under `results/`. If a value cannot be produced, the paper says so explicitly. Never write a plausible-looking latency, LUT count, accuracy, or power figure.

**R2 — Provenance tiers.** Every quantitative result carries a tier tag, and the tier appears in the paper (table captions and a dedicated methodology subsection):

| Tier | Meaning |
| --- | --- |
| **T1 — Hardware** | Measured on a physical U55C via XRT (`xbutil`, host timers, `xbutil examine --report power`). |
| **T2 — Implementation** | Post-place-and-route from Vitis/Vivado: timing closure, resource utilisation, `report_power`. No board required. |
| **T3 — HLS estimate** | Vitis HLS C-synthesis / cosim latency and resource *estimates*. |
| **T4 — Simulation/model** | Software emulation, or an analytical cycle model calibrated against T2/T3 numbers. |

**R3 — Honest titling.** If no physical board is available, the abstract, title, and Section 1 must say *"FPGA implementation evaluated in post-implementation simulation"* or equivalent — never "deployed", "measured on hardware", or "real-time demonstrated". Add a subsection **"Scope and limitations of the hardware evaluation"** in Section 6.

**R4 — Real references only.** Fetch every BibTeX entry from arXiv API, Crossref, or DOI content negotiation. Never hand-author an entry. Any citation that cannot be resolved goes into `paper/UNVERIFIED_REFS.md` and is removed from the manuscript.

**R5 — Baselines are run, not quoted.** PyMatching v2 / Sparse Blossom and Stim numbers must come from *your* runs on *your* machine with recorded versions and hardware specs — not from the numbers printed in their papers. Quoting their published numbers alongside yours as if measured on the same setup is a misrepresentation.

**R6 — Stop and ask.** If a phase is blocked (no Vitis licence, no board, an arXiv ID that does not resolve), stop, write the blocker into `NOTES/blockers.md`, and ask me. Do not paper over it with a plausible substitute.

---

## 2. Inputs to confirm before Phase 1

Ask me for these in one batch and write the answers into `config/project.yaml`. Use the defaults if I do not answer within the first exchange.

```yaml
authors:
  - name: "<FULL NAME>"          # ASK
    affiliation: "<DEPT, INSTITUTION, CITY, COUNTRY>"   # ASK
    email: "<EMAIL>"             # ASK
    orcid: "<ORCID or omit>"
    corresponding: true
github:
  remote: "<git@github.com:USER/REPO.git>"   # ASK
  visibility: public
  create_with_gh_cli: true
environment:
  vitis_version: "<e.g. 2023.2 / 2024.1>"    # ASK — detect via `which v++ && v++ --version`
  platform: "xilinx_u55c_gen3x16_xdma_3_202210_1"   # detect via `platforminfo -l`
  board_present: auto            # detect via `xbutil examine`
  gpu_available: auto            # for the NVIDIA Ising-Decoding training recipes
budget:
  max_stim_shots_per_point: 20000000
  max_wall_clock_hours_per_phase: 6
```

**Auto-detect, do not assume:**

```bash
which v++ vitis_hls vivado 2>/dev/null; v++ --version 2>/dev/null | head -3
platforminfo -l 2>/dev/null | grep -i u55
xbutil examine 2>/dev/null | head -40
nvidia-smi 2>/dev/null | head -10
python -c "import stim, pymatching, sinter; print(stim.__version__, pymatching.__version__, sinter.__version__)"
```

Record the full result in `results/env.json`. That file is the single source of truth for the "Experimental setup" subsection of the paper.

---

## 3. Source material to ingest first

Fetch, read, and write a structured summary of each into `NOTES/source_summaries/<slug>.md` (500–800 words each: contribution, method, what we reuse, what we deliberately do differently, and the exact claim we will compare against).

| # | Source | Role in this work |
| --- | --- | --- |
| S1 | *Real-time Surface-Code Error Correction Using an FPGA-based Neural-Network Decoder* — arXiv:2605.04892 | Primary architectural reference for the FPGA NN decoder. **Verify this ID resolves** (it postdates common training data). If it 404s, tell me. |
| S2 | *Fast and accurate AI-based pre-decoders for surface codes* — arXiv:2604.12841 | The pre-decoder concept: NN handles easy syndromes, exact decoder handles the rest. **Verify this ID resolves.** |
| S3 | *PyMatching: A Python package for decoding quantum codes with MWPM* — Higgott, arXiv:2105.13082 | MWPM baseline, API, local-matching variant. |
| S4 | *Sparse Blossom: correcting a million errors per core second with MWPM* — Higgott & Gidney, *Quantum* 9, 1600 (2025), quantum-journal.org/papers/q-2025-01-20-1600/ | PyMatching v2 algorithm; the CPU throughput bar we must beat, and our exact fallback decoder. |
| S5 | *Stim: a fast stabilizer circuit simulator* — Gidney, *Quantum* 5, 497 (2021) | Circuit-level noise sampling, detector error models, `sinter` for Monte Carlo. |
| S6 | `github.com/nvidia/ising-decoding` | Training recipes / data pipeline conventions for AI QEC decoders. Reuse where licence permits; **check the LICENSE and honour it**, record it in `THIRD_PARTY.md`. |
| S7 | `github.com/oscarhiggott/PyMatching` | Implementation, C++ core, benchmarking harness. |
| S8 | `github.com/quantumlib/stim` | Circuit generation, DEM export, `sinter` harness. |

Also pull, for the related-work section, at least: Google Quantum AI's below-threshold surface code result, AlphaQubit / recurrent-transformer decoders, union-find decoders (Delfosse–Nickerson), Skoric et al. parallel window decoding and the decoder backlog problem, and prior FPGA/ASIC decoder work (Das et al. LILLIPUT/AFS, Ueno et al. QECOOL/QULATIS, Barber et al. real-time matching). Resolve each via Crossref/arXiv — see R4.

---

## 4. The scientific contribution (write this down before coding)

Draft `NOTES/thesis.md` stating the claim in one paragraph, then have me approve it. Proposed thesis:

> **A two-tier surface-code decoder in which a heavily quantised feed-forward/convolutional neural-network *pre-decoder* is mapped to the Alveo U55C's HBM-attached fabric to resolve the overwhelming majority of low-weight syndromes within a single QEC round, while an on-host Sparse Blossom decoder handles only the residual hard syndromes. We show that the pre-decoder's *coverage/accuracy* operating point can be tuned by a confidence threshold, yielding a Pareto front between round-level latency, logical fidelity, and fabric resources; and that HBM channel parallelism on the U55C permits N independent decoder engines to sustain the aggregate syndrome bandwidth of many logical qubits, addressing the decoder backlog problem at the system level rather than the single-decoder level.**

The novelty pitch — this must be defensible, and Section 2 must be honest that each ingredient exists separately:
1. **Co-design of pre-decoder + exact fallback on an HBM-class FPGA**, where prior FPGA decoder work targets DDR/BRAM-only devices and prior pre-decoder work is CPU/GPU-only.
2. **A multi-logical-qubit throughput study** driven by HBM pseudo-channel parallelism, not a single-decoder latency figure.
3. **A quantisation-vs-fidelity Pareto analysis** relating bit-width to the code-capacity/circuit-level threshold shift — i.e. how much fidelity you actually pay for INT4/INT8.
4. **An open, one-command reproducible artefact** spanning Stim generation → training → HLS → implementation → paper figures.

This framing keeps *The Journal of Supercomputing* in scope: it is an HPC-architecture and accelerator paper, not a quantum-physics paper. Emphasise the memory hierarchy, dataflow, roofline/bandwidth analysis, latency tails, and scaling — that is what its readership and editors reward.

---

## 5. System design specification

### 5.1 Dataset generation (`src/qec/dataset.py`)

- Use Stim to generate rotated surface-code memory experiments: `stim.Circuit.generated("surface_code:rotated_memory_z", distance=d, rounds=r, after_clifford_depolarization=p, before_round_data_depolarization=p, before_measure_flip_probability=p, after_reset_flip_probability=p)`.
- Distances `d ∈ {3, 5, 7}` mandatory, `d = 9` if compute allows. Rounds `r = d` (report also `r = 3d` as a robustness check for at least one distance).
- Physical error rates: log-spaced, `p ∈ [1e-3, 1e-2]`, ≥ 9 points, chosen to bracket the threshold.
- Export the **detector error model** (`circuit.detector_error_model(decompose_errors=True)`) — this is the shared interface: the NN trains on detector events, PyMatching decodes the same DEM. Do not let the two decoders see different noise models.
- Persist shots as compressed `.npz` / `.b8` with a manifest recording circuit hash, seed, Stim version. **Fixed seeds everywhere.**
- Sample sizes: enough shots per point that ≥ 1000 logical errors are observed, or the cap in `config/project.yaml`, whichever comes first. Record the actual shot count and error count per point — the paper reports both.

### 5.2 Baselines (`src/qec/baselines.py`)

- **B1: PyMatching v2 (Sparse Blossom)** on the DEM — the accuracy reference and the CPU throughput reference. Report decoded-shots/second single-core and the per-shot latency distribution.
- **B2: PyMatching local matching / v1-style** if available, for the accuracy-vs-speed context of S3.
- **B3 (optional): Union-Find** if a maintained implementation is available, as the "fast approximate" comparison point.
- **B4: NN-only decoder** (no fallback) — the ablation that shows why the hierarchy is needed.
- Use `sinter` for parallel Monte Carlo of the baselines; it handles the statistics and CI plumbing correctly.

### 5.3 Neural pre-decoder (`src/nn/`)

Design for hardware from the first line of Python.

- **Input:** detector-event bit vector for a sliding window of `w` rounds (start with `w = 3`), reshaped to the code's spatial layout so a small 2D/3D CNN is natural. Document the layout mapping in a figure.
- **Output heads:** (a) per-window correction / logical-flip prediction, and (b) a **confidence scalar**. The confidence gate is the whole point: `if conf ≥ τ` accept the NN correction, else escalate to Sparse Blossom.
- **Architecture:** start deliberately small — 2–3 conv layers (≤ 32 channels) + 1–2 dense layers, ≤ ~100k parameters. A model that will not fit or will not meet timing is not a result.
- **Training:** follow the recipes in `nvidia/ising-decoding` where applicable. Class imbalance is severe at low `p` — use focal loss or importance sampling and *report which*. Log to `results/training/*.json`.
- **Quantisation-aware training:** sweep `{FP32, INT8, INT6, INT4, ternary}` weights and activations (Brevitas or QKeras — pick one and justify). This sweep is a headline figure, so run it properly.
- **Calibration:** the confidence head must be calibrated (temperature scaling / reliability diagram) or the threshold `τ` is meaningless. Include a reliability diagram as a figure.
- **Export:** ONNX + a plain NumPy golden reference, `results/nn/golden_vectors.npz`, used as the bit-exactness oracle for HLS cosim.

### 5.4 FPGA implementation (`hw/`)

Target: **Alveo U55C (XCU55C)**, HBM2, PCIe. **Do not trust remembered device numbers** — extract LUT/FF/DSP/BRAM/URAM/HBM capacity from `platforminfo`, the Vivado part database, or the official datasheet, and write them into `results/device.json`. Cite the datasheet in the paper.

- **Path A (preferred): Vitis HLS C++ kernel.** Hand-written, `#pragma HLS PIPELINE II=1` on the inner loops, `ARRAY_PARTITION` on weights, `dataflow` between layers, `ap_fixed<W,I>` matching the QAT bit-widths.
- **Path B: hls4ml** as a cross-check / faster route to a working design. If both build, compare them — that is a legitimate extra table.
- **HBM mapping:** bind kernel ports to distinct HBM pseudo-channels via `--connectivity.sp`. Instantiate `N ∈ {1, 2, 4, 8, 16}` decoder engines and measure aggregate throughput scaling. This is the U55C-specific contribution — do not skip it.
- **Host (`host/`):** XRT native C++ API. Pinned buffers, batched enqueue, `std::chrono::steady_clock` around kernel execution, and a separate measurement of PCIe transfer vs kernel compute so the paper can report both and discuss where a real deployment would place the decoder.
- **Verification ladder:** `csim` (vs golden vectors) → `cosim` (RTL, latency in cycles) → `v++ -t hw_emu` → `v++ -t hw` (only if a board is present).
- **Reports to harvest into `results/hw/`:** HLS synthesis report (latency, II, resources), post-route utilisation, timing summary (WNS/TNS — a design that fails timing must be reported as failing), `report_power`.

### 5.5 The hierarchical runtime (`src/pipeline/`)

- Round-level flow: syndrome window → FPGA pre-decoder → confidence gate → {accept | escalate to PyMatching}.
- Measure and report: **escalation rate** as a function of `τ`, `p`, and `d`; end-to-end latency distribution (p50/p90/p99/p99.9 — *tails matter more than means for backlog*); and effective throughput.
- **Backlog analysis:** superconducting QEC rounds arrive on the order of ~1 µs. Compute, per configuration, whether the decode rate exceeds the syndrome generation rate, and how many logical qubits one U55C can service. Frame it against the exponential-slowdown backlog argument (cite Skoric et al.).
- Sweep `τ` to produce the accuracy/latency/coverage Pareto front. This is Figure "money shot" material.

---

## 6. Experiment matrix

Encode as `experiments/matrix.yaml`; a runner iterates it and writes one JSON per cell.

| Axis | Values |
| --- | --- |
| Distance `d` | 3, 5, 7 (+9 if feasible) |
| Physical error `p` | ≥ 9 log-spaced points in [1e-3, 1e-2] |
| Decoder | MWPM (PyMatching v2), NN-only, **NN+MWPM hierarchical**, (UF optional) |
| Quantisation | FP32, INT8, INT6, INT4 |
| Confidence threshold `τ` | ≥ 6 points in [0.5, 0.999] |
| Engines `N` | 1, 2, 4, 8, 16 |
| Provenance tier | T1–T4 per §1 |

Statistics: report logical error rate per round with **Clopper–Pearson 95% CIs**; estimate the threshold by fitting the standard finite-size-scaling ansatz `p_L = A + B x + C x²`, `x = (p − p_th) d^{1/ν}`, with bootstrap CIs on `p_th`. Report `p_th` for every decoder variant. Never plot a point without its CI.

---

## 7. Results as data

Every experiment writes a JSON conforming to `schemas/result.schema.json`:

```json
{
  "experiment_id": "d5_p0.005_hier_int8_tau0.9",
  "timestamp": "ISO8601",
  "git_commit": "sha",
  "tier": "T3",
  "config": { "...": "..." },
  "metrics": { "logical_error_rate": 0.0, "ci_low": 0.0, "ci_high": 0.0,
               "shots": 0, "errors": 0,
               "latency_ns": {"p50":0,"p99":0,"p999":0},
               "throughput_shots_per_s": 0,
               "escalation_rate": 0.0 },
  "resources": { "lut": 0, "ff": 0, "dsp": 0, "bram": 0, "uram": 0,
                 "fmax_mhz": 0, "wns_ns": 0 },
  "env_ref": "results/env.json"
}
```

Then: **`scripts/make_figures.py` and `scripts/make_tables.py` read only these JSONs.** They emit `paper/Fig*.pdf`, `paper/tables/*.tex`, and — critically — `paper/generated_numbers.tex`, a file of `\newcommand` definitions:

```latex
\newcommand{\hierLatencyPnn}{412}      % ns, d=5, INT8, tau=0.9, T3
\newcommand{\mwpmThroughput}{1.02}     % Mshots/s, T1-CPU
```

**The manuscript cites `\hierLatencyPnn`, never a typed literal.** This makes it structurally impossible for the prose and the data to drift apart, and it is the single best defence against R1 violations.

---

## 8. Figures (generate all; drop any that turn out uninformative)

Name them `Fig1.pdf` … `FigN.pdf` per Springer, flat in `paper/`. Also emit `.eps` copies for final submission (Springer prefers EPS for vector art).

1. **Fig1** — System architecture: quantum device → syndrome stream → PCIe/host → U55C fabric → hierarchical decoder → correction.
2. **Fig2** — Hierarchical decoding pipeline with the confidence gate and escalation path.
3. **Fig3** — NN pre-decoder topology with tensor shapes and per-layer bit-widths annotated.
4. **Fig4** — Detector layout → tensor mapping for the rotated surface code (this is the bit reviewers will not otherwise follow).
5. **Fig5** — HLS dataflow and HBM pseudo-channel binding for `N` engines.
6. **Fig6** — Logical error rate per round vs `p`, one panel per `d`, all decoders, with CIs.
7. **Fig7** — Threshold collapse plot with fitted `p_th` and bootstrap CI.
8. **Fig8** — Latency CCDF (log-y) showing p99/p99.9 tails vs the 1 µs round budget as a vertical line.
9. **Fig9** — Throughput vs engine count `N`, with the ideal-scaling line and the HBM bandwidth roofline.
10. **Fig10** — Pareto: logical error rate vs latency, points coloured by `τ`, marker shape by bit-width.
11. **Fig11** — Resource utilisation (LUT/DSP/BRAM/URAM %) vs `d` and bit-width, stacked bars.
12. **Fig12** — Accuracy degradation vs quantisation bit-width, with FP32 and MWPM reference lines.
13. **Fig13** — Confidence-head reliability diagram.
14. **Fig14** — Backlog: sustainable logical qubits per card vs `d`, annotated with the assumed round period.

**Style rules:** vector output, embedded fonts, sans-serif labels (Helvetica/Arial) at 8–12 pt, colourblind-safe palette **plus** distinct markers/linestyles so the figure survives greyscale printing, no title inside the image (Springer puts it in the caption), sized to 84 mm or 174 mm width. Set `matplotlib.rcParams['pdf.fonttype'] = 42`.

---

## 9. Tables

1. **T1** — Notation and symbols.
2. **T2** — Related work comparison: platform, code, distance, decoder type, reported latency, accuracy, whether hardware-measured. Populate only from the actual papers; mark unavailable cells "—", never guess.
3. **T3** — Stim circuit and noise-model parameters.
4. **T4** — NN architecture and training hyperparameters.
5. **T5** — Post-implementation resource utilisation per configuration, with device totals and % (tier-tagged).
6. **T6** — Latency breakdown per pipeline stage (H2D, kernel, gate, escalation, D2H).
7. **T7** — Logical error rate and estimated threshold per decoder variant with CIs.
8. **T8** — Throughput and energy-per-decode: this work vs PyMatching v2 CPU (and GPU, if `nvidia-smi` found one).
9. **T9** — Ablation: NN-only / MWPM-only / hierarchical at several `τ`.
10. **T10** — Reproduction manifest: software versions, seeds, wall-clock cost per experiment.

Every table caption ends with its provenance tier(s).

---

## 10. The manuscript

### 10.1 Format — Journal of Supercomputing (Springer, 11227)

Confirmed requirements from the journal's submission guidelines:

- **Springer Nature LaTeX template** (`sn-jnl.cls`), bibliography style **`sn-basic.bst`**. Download from Springer's LaTeX author-support page and **vendor the files into `paper/`** — do not rely on Overleaf having them.
- **Numbered citations in square brackets**: `[3]`, `[1-3, 7]`. Configure the template accordingly (`\documentclass[sn-basic]{sn-jnl}` — verify the exact option in the template's own documentation, do not guess).
- **Abstract: 100–150 words.** Enforce with a word-count check in CI; it is a common desk-reject trigger.
- **4–6 keywords.**
- **Decimal headings, maximum three levels.**
- **No subfolders in the LaTeX submission** — figures and `.bib` sit flat alongside `main.tex`.
- **Figures named `Fig1`, `Fig2`, …**; captions begin with bold **Fig. n**, no terminal punctuation; captions live in the `.tex`, not the image.
- **DOIs as full links** (`https://doi.org/...`) in the reference list.
- **Declarations section before the references**, covering: Funding; Competing interests; Data availability; Code availability; Author contributions (CRediT); Ethics approval (n/a).
- **Data Availability Statement is mandatory** — point to the GitHub repo and, ideally, a Zenodo DOI archiving `results/` (tell me if you want me to mint one).
- Footnotes, not endnotes. Journal-name abbreviations per ISSN LTWA, or full titles if unsure.
- Note: the journal no longer publishes author biographies or photographs — omit them.

### 10.2 Structure and length (target 9,000–11,000 words)

| § | Content | ~Words |
| --- | --- | --- |
| 1 | Introduction — the decoder backlog problem, why FPGAs, why HBM, contributions as a bulleted list, paper roadmap | 1,200 |
| 2 | Background — surface codes, circuit-level noise, detector error models, MWPM/Sparse Blossom, NN decoders, Alveo U55C architecture | 1,800 |
| 3 | Related work — software decoders, NN decoders, pre-decoders, hardware decoders (FPGA/ASIC); closes with Table T2 and an explicit "what is new here" paragraph | 1,200 |
| 4 | Design — hierarchical architecture, confidence gating, NN topology, quantisation, HLS dataflow, HBM channel mapping, host runtime | 2,200 |
| 5 | Methodology — Stim generation, training protocol, statistical procedure, verification ladder, **the provenance-tier table**, experimental setup from `results/env.json` | 1,300 |
| 6 | Results — accuracy/threshold, latency and tails, resources, scaling, Pareto, ablation, energy; then **"Scope and limitations of the hardware evaluation"** | 2,200 |
| 7 | Discussion — where this fits in a real control stack, cryogenic/latency implications, what breaks at `d ≥ 11`, honest threats to validity | 800 |
| 8 | Conclusion and future work | 400 |
| — | Declarations, References, (Appendix: HLS pragmas, full hyperparameters) | — |

### 10.3 Writing quality

Write like a systems paper: active voice, concrete claims, quantified statements. Every claim in Section 6 either cites a `\newcommand` from `generated_numbers.tex` or points at a figure. Kill hedging that hides a missing measurement — if it was not measured, say it was not measured.

Do **not** copy sentences from the source papers. Paraphrase fully and cite. Run a self-check for near-verbatim overlap before finishing; Springer screens for this.

---

## 11. References

- Build `paper/references.bib` programmatically: `scripts/fetch_refs.py` takes a list of arXiv IDs / DOIs / URLs and pulls BibTeX from `https://arxiv.org/abs/<id>` (arXiv API), Crossref, or DOI content negotiation (`curl -LH "Accept: application/x-bibtex" https://doi.org/<doi>`).
- Prefer the **published journal version** over the preprint where one exists — e.g. Sparse Blossom and Stim are both published in *Quantum* and should be cited as such, not as arXiv preprints.
- Cite software as software: Stim, PyMatching, and the NVIDIA repo get repository/Zenodo citations in addition to their papers.
- Target **45–70 references**. Include the Alveo U55C datasheet and the relevant Vitis/HLS user guide as cited online documents with access dates.
- Run a final pass verifying every `\cite` key resolves and every bib entry is cited; fail CI otherwise.
- Anything unresolvable → `paper/UNVERIFIED_REFS.md`, removed from the manuscript, flagged to me.

---

## 12. Repository layout

```
.
├── README.md                  # what, why, how to reproduce, results teaser, citation
├── LICENSE                    # Apache-2.0 or MIT (ask me)
├── THIRD_PARTY.md             # licences of Stim, PyMatching, ising-decoding, template files
├── CITATION.cff
├── PROMPT.md                  # this file
├── Makefile                   # make setup | data | train | hls | impl | eval | figures | paper | all
├── config/
│   ├── project.yaml
│   └── experiments/matrix.yaml
├── schemas/result.schema.json
├── src/
│   ├── qec/          # dataset.py, dem.py, baselines.py, stats.py
│   ├── nn/           # model.py, train.py, quantize.py, calibrate.py, export.py
│   └── pipeline/     # hierarchical.py, gate.py, backlog.py
├── hw/
│   ├── hls/          # kernel.cpp, kernel.h, weights.h, tb_kernel.cpp, run_hls.tcl
│   ├── hls4ml/       # alternative flow
│   ├── link/         # u55c.cfg  (connectivity.sp HBM bindings, clock, profiling)
│   └── scripts/      # build_hw.sh, build_hw_emu.sh, harvest_reports.py
├── host/             # host.cpp (XRT native API), CMakeLists.txt
├── scripts/          # fetch_refs.py, make_figures.py, make_tables.py, make_numbers.py,
│                     # run_matrix.py, check_paper.py
├── results/          # env.json, device.json, <experiment_id>.json, hw/, training/
├── paper/            # SELF-CONTAINED — see §13
├── NOTES/            # thesis.md, blockers.md, decisions.md, source_summaries/
└── .github/workflows/ci.yml
```

---

## 13. The `paper/` folder — Overleaf contract

`paper/` must compile on a stock Overleaf project (TeX Live, pdfLaTeX + BibTeX) with **zero manual fixes**. Concretely:

- Flat structure. `main.tex`, `sn-jnl.cls`, `sn-basic.bst`, `references.bib`, `generated_numbers.tex`, `Fig1.pdf` … `FigN.pdf`, plus any `.sty` the template needs.
- **No** absolute paths, `\graphicspath` to outside dirs, `minted`/`--shell-escape`, `\write18`, or symlinks.
- **No** packages outside a standard TeX Live distribution.
- Tables as `\input{}`-free inline code or generated straight into `main.tex` by `make_tables.py` (avoids subfolder issues).
- `main.pdf` committed so I can eyeball it without building.
- `paper/overleaf_upload.zip` produced by `make paper` — the exact artefact I drag into Overleaf.
- A `paper/README.md` with a one-line "unzip → New Project → Upload Project → compile with pdfLaTeX" instruction and the compile command used locally.

**Local verification before you claim it works:**

```bash
cd paper && latexmk -C && latexmk -pdf -interaction=nonstopmode main.tex
grep -iE "Undefined control|Citation .* undefined|Reference .* undefined|LaTeX Warning: There were" main.log
python ../scripts/check_paper.py     # abstract word count 100-150, 4-6 keywords,
                                     # all figs cited in order, all tables cited,
                                     # no orphan bib entries, no typed numeric literals
                                     # in Results prose, declarations section present
```

If `latexmk` is unavailable locally, install TeX Live or use `tectonic`; if neither is possible, say so rather than asserting the folder compiles.

---

## 14. GitHub and CI

- `git init`, sensible `.gitignore` (`*.npz`, `build/`, `_x/`, `.Xil/`, `*.xclbin`, `__pycache__`, `*.aux`, `*.log`, `*.out`, `*.bbl`, `*.blg`, `*.fls`, `*.fdb_latexmk`).
- **Git LFS** for `*.xclbin`, large `.npz`, and any figure over 5 MB.
- Conventional commits (`feat:`, `fix:`, `exp:`, `paper:`, `docs:`). One logical change per commit, not one giant dump. Commit at each phase checkpoint.
- Create the remote with `gh repo create` if I supplied a name; otherwise print the exact commands for me to run.
- Tag `v1.0-submission` when the paper is complete; attach `overleaf_upload.zip` and `results.tar.gz` to a GitHub Release.
- **`.github/workflows/ci.yml`** — runs on push, must be fast (no Vitis in CI):
  - install Python deps, run unit tests;
  - a tiny smoke experiment (`d=3`, few thousand shots) end-to-end to prove the pipeline is not broken;
  - regenerate figures/tables from committed `results/` and fail if they differ from what is committed (guarantees paper ↔ data consistency);
  - compile `paper/` with a TeX Live container and upload `main.pdf` as an artifact;
  - run `scripts/check_paper.py`.

---

## 15. Execution plan — phases and checkpoints

Stop at each **CHECKPOINT**, show me what exists, and wait.

- **Phase 0 — Recon.** Confirm §2 inputs, detect toolchain, fetch and summarise §3 sources, verify the two 2026 arXiv IDs resolve, draft `NOTES/thesis.md`. → **CHECKPOINT: thesis + environment report.**
- **Phase 1 — Data and baselines.** Stim generation, DEM export, PyMatching baselines, statistics module, first `results/*.json`, a draft Fig6. → **CHECKPOINT: baseline threshold plot that looks physically sane** (if the MWPM threshold for circuit-level noise is not in the right ballpark, something is wrong — debug before continuing).
- **Phase 2 — NN pre-decoder.** Model, training, QAT sweep, calibration, ONNX + golden vectors, NN-only accuracy. → **CHECKPOINT: accuracy vs bit-width table.**
- **Phase 3 — Hierarchical decoder in software.** Confidence gate, escalation, `τ` sweep, Pareto front, backlog model. → **CHECKPOINT: Pareto figure.**
- **Phase 4 — HLS.** Kernel, csim vs golden, cosim latency, resource estimates, harvested reports. → **CHECKPOINT: cosim bit-exact against golden + latency report.**
- **Phase 5 — Implementation / hardware.** `hw_emu`, then full `v++ -t hw` build if a licence exists; board run if present. Harvest utilisation, timing, power. Multi-engine HBM scaling. → **CHECKPOINT: utilisation + timing summary, tier declared honestly.**
- **Phase 6 — Full matrix.** Run `experiments/matrix.yaml`, populate `results/`. → **CHECKPOINT: results inventory.**
- **Phase 7 — Figures, tables, numbers.** All artefacts regenerated from JSON. → **CHECKPOINT: figure contact sheet.**
- **Phase 8 — Manuscript.** Section by section, in order, using only generated numbers. → **CHECKPOINT after Sections 1–3, then after 4–6, then complete.**
- **Phase 9 — Polish and ship.** Reference verification, `check_paper.py`, overlap self-check, Overleaf zip, README, CI green, release tag. → **CHECKPOINT: final.**

---

## 16. Definition of done

- [ ] `make all` runs from a clean clone (documenting anything that needs Vitis/a board).
- [ ] Every figure and table regenerates from `results/` with no manual steps.
- [ ] No numeric literal in the Results prose that is not a `\newcommand` from `generated_numbers.tex`.
- [ ] Every result tier-tagged; title/abstract consistent with the highest tier actually achieved.
- [ ] `paper/overleaf_upload.zip` compiles clean on Overleaf (I will verify — you must have verified locally first).
- [ ] Abstract 100–150 words; 4–6 keywords; ≤ 3 heading levels; declarations section present; DOIs as full links.
- [ ] Every reference resolved from a real source; `UNVERIFIED_REFS.md` empty or explicitly discussed with me.
- [ ] CI green; repo pushed; `v1.0-submission` tagged with release artefacts.
- [ ] `NOTES/blockers.md` lists everything that could not be done and why.

---

## 17. When you get stuck

- **No Vitis licence / no board:** proceed to T3 (HLS estimates) and, if Vivado synthesis alone is available, T2 for resources. Retitle honestly. Do not simulate a number and call it measured.
- **A source paper does not resolve:** report it. Build the design from the sources that do resolve, and note the gap in Related Work.
- **Training will not converge:** the usual culprits are class imbalance at low `p` and a window `w` too small to capture measurement errors. Log what you tried in `NOTES/decisions.md`; a documented negative result belongs in the paper.
- **A result contradicts the thesis:** report the contradiction. Revise the thesis, not the data. A paper honestly reporting that the pre-decoder buys less than hoped is publishable; a fabricated one is not.

---

**Begin with Phase 0. Ask me the §2 questions first.**
