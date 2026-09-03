#!/usr/bin/env bash
set -u
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
source "$REPO/scripts/env.sh" >/dev/null 2>&1
cd "$REPO/hw/hls"
exec vitis_hls -f run_csynth_only.tcl
