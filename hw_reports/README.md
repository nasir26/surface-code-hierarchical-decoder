# Archived synthesis reports and run logs

The raw evidence behind numbers reported elsewhere in this repository. These
are copied here because the directories they are produced in (`hw/hls/*_proj/`,
`results/logs/`) are excluded by `.gitignore`, so cleaning a build tree would
otherwise destroy the provenance of committed results while leaving the
committed JSON looking authoritative.

| File | Backs |
|---|---|
| `predecoder_kernel_csynth_w12.rpt` | Every figure in `results/hw/csynth_w12.json`: latency, clock estimate, LUT/FF/DSP/BRAM. Parsed by `scripts/harvest_hls.py`. |
| `csynth_design_size_w12.rpt` | Per-function design size for the same synthesis run. |
| `csynth_w12.log.gz` | Full Vitis HLS transcript for that run. |
| `train_scale500m.log.gz` | The 500M-shot training run behind `results/training/train_R5_scale500m.json`. |
| `train_traj.log.gz` | The snapshot run behind `results/trajectory_traj.json`. |
| `width_sweep.log.gz` | The width sweep behind `results/width_sweep_training.json`. |
| `baselines_full.log.gz` | The sinter baseline sweep behind `results/baselines/`. |
| `csim_w64.log.gz` | The width-64 control experiment for the open mismatch in `NOTES/blockers.md` B5. |

**The synthesis report describes a width-12 build whose C-simulation does not
match the golden model** (B5). It is retained as the source of the T3 resource
and latency estimates, which describe the shape of the datapath; it is not
evidence that the design computes correct corrections.

Decompress a log with `gunzip -k <file>.gz`.
