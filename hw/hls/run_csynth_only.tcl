# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
#
# C-synthesis only: no csim, no cosim. Used to obtain resource and latency
# estimates for a datapath whose *shape* is settled, independently of the
# functional mismatch tracked in NOTES/blockers.md. Numbers from this flow are
# T3 estimates and must not be reported as functionally verified.
open_project -reset predecoder_csynth_proj
set_top predecoder_kernel
add_files predecoder_kernel.cpp
open_solution -reset "solution1" -flow_target vitis
set_part {xcu55c-fsvh2892-2L-e}
create_clock -period 3.33 -name default
csynth_design
exit
