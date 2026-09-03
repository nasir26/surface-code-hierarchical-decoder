#!/usr/bin/env bash
# Runs the HLS flow (csim -> csynth -> cosim) detached from the caller.
set -u
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
source "$REPO/scripts/env.sh" >/dev/null 2>&1
cd "$REPO/hw/hls"
exec vitis_hls -f run_hls.tcl
