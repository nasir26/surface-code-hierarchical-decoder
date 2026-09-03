# Decisions and findings log

## 2026-09-02: GPU training at scale does NOT fix the pre-decoder's accuracy

The predecessor project's paper names one open question above all others: it
trained CPU-only at 40M shots total, ~1600x below the reference recipe, and
says whether training at scale closes the accuracy gap "is a directly
answerable empirical question that this project's CPU-only compute budget did
not allow answering". This project answers it.

**Setup.** Identical architecture (R=5, width 64, 113,358 params), identical
training target, identical evaluation, but on the RTX A4000 at ~118k shots/s
instead of CPU. Evaluated at d=5, p=0.003, 100k fresh shots, half for gate
calibration and half held out for measurement.

**Result at 150M shots** (3.75x the predecessor's entire training budget):

| quantity | value | vs baseline |
|---|---|---|
| PyMatching baseline LER | 0.003180 | 1.00x |
| pre-decoder only (unconditional) | 0.012040 | **3.79x worse** |
| oracle: best achievable by any gate | 0.002380 | **0.748x** |

For comparison, a 6M-shot model measured 3.03x worse. **More training made the
pre-decoder slightly worse, not better.** The training loss had converged by
then (0.002354 at 50M, 0.002241 at 100M, 0.002229 at 125M, 0.002222 at 150M),
so this is not undertraining.

**Interpretation: the training objective is misaligned with the goal.** The
network is trained to predict which local DEM error mechanisms fired, scored
by per-voxel BCE. It is *not* trained to minimise the logical error rate.
Optimising the proxy harder makes the network more confident and more
aggressive about applying corrections, and each wrong correction corrupts a
syndrome PyMatching would otherwise have decoded correctly. So driving the
proxy loss down drives the real metric up. Undertraining was never the binding
constraint; the objective was.

**The oracle number is the interesting part.** A gate that chose perfectly
between the two paths would reach 0.748x the baseline -- the pre-decoder does
carry information the matcher lacks. But the accounting shows why that is
almost unreachable in practice:

    shots the pre-decoder saves (baseline wrong, pre-decoder right):   40
    shots the pre-decoder breaks (baseline right, pre-decoder wrong):  483

A useful gate would have to pick out those 40 from among 483 look-alike
failures, roughly 1:12. The seven-feature logistic gate cannot, and as tau
rises it correctly gives up and escalates everything, converging exactly onto
the baseline.

**What this does not say.** It does not say pre-decoding cannot work. It says
this architecture, with this per-local-edge objective, does not, and that the
failure is not a compute budget problem. A loss that penalised logical errors
directly -- or a training target covering the 3+ detector mechanisms this one
excludes by construction -- remains untested and is the natural next question.

## 2026-09-02: the confidence gate is the load-bearing structural fix

Regardless of the accuracy finding above, gating changes the risk profile of
the whole approach. Because escalation decodes the *raw* syndrome, tau -> 1
reduces exactly to the PyMatching baseline, so the hierarchical decoder's LER
is bounded above by the baseline's. The predecessor's unconditional design had
no such bound and paid 3-4x for it. Verified as a test
(`tests/test_hierarchical.py::test_tau_limits_bracket_the_two_pure_decoders`)
rather than asserted, because the entire argument rests on it.

Measured gate calibration is good (expected calibration error 0.0021 at
d=5, p=0.003), so tau means what it claims to mean.

## 2026-09-02: the 1 us latency target is architecturally unreachable, not badly implemented

See `src/pipeline/roofline.py` and `results/roofline_R5_w64.json`. The
architecture costs 24,454,656 MACs per shot. Against 9,024 DSPs at 300 MHz
with INT8 packing, counting only multiply-accumulates and giving data
movement, activations and control away free, the floor is 4.52 us per shot and
1.33 logical qubits per card -- 0.66 qubits at a realistic 50% utilisation.

This reframes the predecessor's measured 13-15 ms. That build used 331 of
9,024 DSPs (3.7%) at 100 MHz, so roughly three orders of magnitude of
implementation headroom really did exist -- but spending all of it still
misses the round budget by ~4.5x. Optimising the kernel was never going to be
sufficient.

The actionable form is the inverse: at 50% DSP utilisation and INT8, width <=
52 sustains one logical qubit, width <= 25 sustains four, width <= 12
sustains sixteen. Width, not precision, is the axis that decides
deployability, and the predecessor swept precision only.

## 2026-09-02: statistical fixes carried over from Phase 1

- Threshold fits are windowed around a non-parametric crossing estimate. The
  collapse ansatz is a local expansion; fitting it across a full decade of p
  railed the optimiser onto its bound and produced p_th = 0.01 with a
  zero-width CI. A fit that lands on a bound is now flagged rather than
  reported.
- Clopper-Pearson intervals replace Wilson for anything reported, because
  several cells observe only tens of logical errors.
- Reported p_th = 0.00695, bootstrap CI [0.00684, 0.00706], with a window
  systematic of 0.0065-0.0070 that is wider than the statistical CI and is
  quoted alongside it.

## 2026-09-03: the misalignment claim, measured

The earlier entry inferred objective misalignment by elimination: training
budget and model capacity were both ruled out, so the objective was what
remained. Inference by elimination is not measurement, and it was the weakest
step in the argument. This tests it directly.

Twenty checkpoints from one width-12 run to 200M shots, each evaluated against
the same held-out 200,000 shots at d=5, p=0.003:

| shots | train loss | LER / baseline | saves | breaks |
|---|---|---|---|---|
| 10M | 0.0218 | **1.33** | 62 | 297 |
| 50M | 0.0028 | 3.41 | 147 | 1870 |
| 100M | 0.0026 | 3.92 | 177 | 2262 |
| 200M | 0.00255 | 3.56 | 170 | 2000 |

**corr(training loss, LER ratio) = -0.902.** The loss falls monotonically while
the logical error rate rises. The best decoder produced anywhere in the run is
the least-trained checkpoint.

The mechanism is in the last two columns: breaks grow 6.7x while saves grow
2.7x, so the ratio of harmful to helpful interventions worsens from 4.8:1 to
11.8:1. Training teaches the network to intervene more often, and the marginal
intervention is overwhelmingly harmful.

One nuance keeps this from being "the network just gets worse". The oracle
bound *improves* over the same run, 0.913 -> 0.762 of baseline. Training does
add information a perfect gate could exploit; what degrades is the network's
own decision rule about when to act on it. That distinction matters for what
to try next: the fix is a better decision rule or a loss that penalises
logical errors, not a better feature extractor.

The test was designed to be able to fail. run_trajectory.py reports the sign
of the correlation and states in words whether misalignment is supported or
refuted; a positive correlation would have refuted the paper's central claim.
