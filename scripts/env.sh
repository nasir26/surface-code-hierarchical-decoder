#!/usr/bin/env bash
# Source this before any FPGA tool invocation:  source scripts/env.sh
# Pins the toolchain versions recorded in results/env.json.

export XILINX_VERSION=2023.2
source /tools/Xilinx/Vitis/${XILINX_VERSION}/settings64.sh
source /opt/xilinx/xrt/setup.sh >/dev/null

export PLATFORM_NAME=xilinx_u55c_gen3x16_xdma_3_202210_1
export PLATFORM_XPFM=/opt/xilinx/platforms/${PLATFORM_NAME}/${PLATFORM_NAME}.xpfm

# Python environment for the software half of the project.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [ -d "${REPO_ROOT}/.venv" ]; then
  source "${REPO_ROOT}/.venv/bin/activate"
fi
