# csim only: the controlled experiment for NOTES/blockers.md B5.
open_project -reset predecoder_csim_proj
set_top predecoder_kernel
add_files predecoder_kernel.cpp
add_files -tb tb_predecoder.cpp
add_files -tb ../../tests/vectors/vectors_int8_small.txt
open_solution -reset "solution1" -flow_target vitis
set_part {xcu55c-fsvh2892-2L-e}
create_clock -period 3.33 -name default
csim_design
exit
