# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
#
# Targets are grouped by what they need. Everything under "software" runs on
# any machine with the Python environment; the FPGA targets need Vitis and, for
# `board`, a physical card. `make all` deliberately stops short of the FPGA
# flow so a clean clone can reproduce the paper's figures without a licence.

PYTHON  ?= .venv/bin/python
PYTHONPATH_ENV = PYTHONPATH=.
WORKERS ?= 60

.PHONY: help setup test data baselines threshold train trajectory width figures \
        numbers paper check hls csynth csim clean all

help:
	@echo "Software (no Vitis needed):"
	@echo "  setup       create .venv and install pinned dependencies"
	@echo "  test        run the unit tests"
	@echo "  baselines   full PyMatching baseline sweep (long; writes results/baselines)"
	@echo "  threshold   refit the threshold from committed baselines (fast)"
	@echo "  train       GPU training run at the default width"
	@echo "  trajectory  snapshot run + per-checkpoint evaluation (the misalignment test)"
	@echo "  width       train and evaluate the width sweep"
	@echo "  figures     regenerate all paper figures from results/"
	@echo "  numbers     regenerate paper/generated_numbers.tex from results/"
	@echo "  paper       build the manuscript and the Overleaf zip"
	@echo "  check       run the pre-submission manuscript checks"
	@echo "  all         test + threshold + numbers + figures + paper + check"
	@echo ""
	@echo "FPGA (needs Vitis; source scripts/env.sh first):"
	@echo "  csynth      C-synthesis only, harvested into results/hw/"
	@echo "  csim        C-simulation against the golden vectors"
	@echo "  hls         full csim -> csynth -> cosim flow"

setup:
	python3.11 -m pip install --user virtualenv
	python3.11 -m virtualenv .venv
	$(PYTHON) -m pip install -r requirements.txt

test:
	$(PYTHONPATH_ENV) $(PYTHON) -m pytest tests/ -q

baselines:
	$(PYTHONPATH_ENV) $(PYTHON) scripts/run_baselines.py --workers $(WORKERS)

data: baselines

threshold:
	$(PYTHONPATH_ENV) $(PYTHON) scripts/fit_threshold.py

train:
	$(PYTHONPATH_ENV) $(PYTHON) -m src.nn.train_gpu --total-shots 500000000 --num-workers 12

trajectory:
	$(PYTHONPATH_ENV) $(PYTHON) -m src.nn.train_gpu --width 12 --total-shots 200000000 \
		--num-workers 12 --log-every-shots 10000000 --snapshot --tag traj
	$(PYTHONPATH_ENV) $(PYTHON) scripts/run_trajectory.py --shots 200000 --tag traj

width:
	$(PYTHONPATH_ENV) $(PYTHON) scripts/run_width_sweep.py

figures:
	$(PYTHONPATH_ENV) $(PYTHON) scripts/make_figures.py

numbers:
	$(PYTHONPATH_ENV) $(PYTHON) scripts/make_numbers.py

paper: numbers figures
	cd paper && latexmk -pdf -interaction=nonstopmode main.tex
	@rm -f paper/overleaf_upload.zip
	cd paper && zip -q overleaf_upload.zip main.tex generated_numbers.tex references.bib \
		sn-jnl.cls *.bst Fig*.pdf README.md
	@echo "wrote paper/overleaf_upload.zip"

check:
	$(PYTHON) scripts/check_paper.py

# --- FPGA flows -------------------------------------------------------------
# These assume `source scripts/env.sh` has been run (the Xilinx tools are not
# on the default PATH on the development host).

csynth:
	./hw/scripts/run_csynth.sh
	$(PYTHONPATH_ENV) $(PYTHON) scripts/harvest_hls.py \
		--report hw/hls/predecoder_csynth_proj/solution1/syn/report/predecoder_kernel_csynth.rpt \
		--width $$(sed -n 's/.*constexpr int WIDTH = \([0-9]*\);.*/\1/p' hw/hls/kernel_config.h)

csim:
	./hw/scripts/run_csim.sh

hls:
	./hw/scripts/run_hls_flow.sh

all: test threshold numbers figures paper check

clean:
	rm -rf paper/*.aux paper/*.log paper/*.out paper/*.bbl paper/*.blg \
	       paper/*.fls paper/*.fdb_latexmk paper/main.pdf paper/overleaf_upload.zip
	find . -name __pycache__ -type d -prune -exec rm -rf {} + 2>/dev/null || true
