# This script segment is generated automatically by AutoPilot

set name predecoder_kernel_mul_76ns_57ns_132_5_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 4 ALLOW_PRAGMA 1
}


set name predecoder_kernel_mul_8s_8ns_16_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set id 100
set name predecoder_kernel_mac_muladd_8s_8ns_16s_17_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 1
set in1_width 8
set in1_signed 0
set in2_width 16
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 17
set arg_lists {i0 {8 1 +} i1 {8 0 +} m {16 1 +} i2 {16 1 +} p {17 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 101
set name predecoder_kernel_mac_muladd_8ns_6s_16s_17_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 6
set in1_signed 1
set in2_width 16
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 17
set arg_lists {i0 {8 0 +} i1 {6 1 +} m {14 1 +} i2 {16 1 +} p {17 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 103
set name predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 7
set in1_signed 1
set in2_width 16
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 17
set arg_lists {i0 {8 0 +} i1 {7 1 +} m {15 1 +} i2 {16 1 +} p {17 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 104
set name predecoder_kernel_mac_muladd_8s_8ns_17s_17_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 1
set in1_width 8
set in1_signed 0
set in2_width 17
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 17
set arg_lists {i0 {8 1 +} i1 {8 0 +} m {16 1 +} i2 {17 1 +} p {17 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 110
set name predecoder_kernel_mac_muladd_8s_8ns_17s_18_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 1
set in1_width 8
set in1_signed 0
set in2_width 17
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 18
set arg_lists {i0 {8 1 +} i1 {8 0 +} m {16 1 +} i2 {17 1 +} p {18 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 114
set name predecoder_kernel_mac_muladd_8ns_7s_9s_15_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 7
set in1_signed 1
set in2_width 9
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 15
set arg_lists {i0 {8 0 +} i1 {7 1 +} m {15 1 +} i2 {9 1 +} p {15 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 116
set name predecoder_kernel_mac_muladd_8s_8ns_20s_20_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 1
set in1_width 8
set in1_signed 0
set in2_width 20
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 20
set arg_lists {i0 {8 1 +} i1 {8 0 +} m {16 1 +} i2 {20 1 +} p {20 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGbkb BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGcud BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGdEe BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGeOg BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGfYi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGg8j BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGhbi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGibs BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGjbC BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGkbM BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGlbW BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGmb6 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGncg BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGocq BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGpcA BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGqcK BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGrcU BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGsc4 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGtde BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGudo BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGvdy BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGwdI BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGxdS BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGyd2 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGzec BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGAem BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_p_ZN18predecoder_weightsL13LAYER0_WEIGBew BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_predecoder_weights_LAYER0_BIAS_ROM_AUTCeG BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_conv3d_hidden_layer_1_Pipeline_OC_LOOP_layer0_mult_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 182 \
    name out_r \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename out_r \
    op interface \
    ports { out_r_address0 { O 4 vector } out_r_ce0 { O 1 bit } out_r_we0 { O 1 bit } out_r_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_r'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name window_0_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_cast \
    op interface \
    ports { window_0_load_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name window_1_0_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_cast \
    op interface \
    ports { window_1_0_load_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name window_2_0_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_cast \
    op interface \
    ports { window_2_0_load_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name window_0_load_1_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_1_cast \
    op interface \
    ports { window_0_load_1_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name window_1_0_load_1_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_1_cast \
    op interface \
    ports { window_1_0_load_1_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name window_2_0_load_1_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_1_cast \
    op interface \
    ports { window_2_0_load_1_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name window_0_load_2_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_2_cast \
    op interface \
    ports { window_0_load_2_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name window_1_0_load_2_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_2_cast \
    op interface \
    ports { window_1_0_load_2_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name window_2_0_load_2_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_2_cast \
    op interface \
    ports { window_2_0_load_2_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name window_0_load_3_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_3_cast \
    op interface \
    ports { window_0_load_3_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name window_1_0_load_3_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_3_cast \
    op interface \
    ports { window_1_0_load_3_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name window_2_0_load_3_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_3_cast \
    op interface \
    ports { window_2_0_load_3_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name window_0_load_4_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_4_cast \
    op interface \
    ports { window_0_load_4_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name window_1_0_load_4_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_4_cast \
    op interface \
    ports { window_1_0_load_4_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name window_2_0_load_4_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_4_cast \
    op interface \
    ports { window_2_0_load_4_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name window_0_load_5_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_5_cast \
    op interface \
    ports { window_0_load_5_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name window_1_0_load_5_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_5_cast \
    op interface \
    ports { window_1_0_load_5_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name window_2_0_load_5_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_5_cast \
    op interface \
    ports { window_2_0_load_5_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name window_0_load_6_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_6_cast \
    op interface \
    ports { window_0_load_6_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name window_1_0_load_6_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_6_cast \
    op interface \
    ports { window_1_0_load_6_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name window_2_0_load_6_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_6_cast \
    op interface \
    ports { window_2_0_load_6_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name window_0_load_7_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_7_cast \
    op interface \
    ports { window_0_load_7_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name window_1_0_load_7_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_7_cast \
    op interface \
    ports { window_1_0_load_7_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name window_2_0_load_7_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_2_0_load_7_cast \
    op interface \
    ports { window_2_0_load_7_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name window_0_load_8_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_0_load_8_cast \
    op interface \
    ports { window_0_load_8_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name window_1_0_load_8_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_window_1_0_load_8_cast \
    op interface \
    ports { window_1_0_load_8_cast { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name zext_ln69 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln69 \
    op interface \
    ports { zext_ln69 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName predecoder_kernel_flow_control_loop_pipe_sequential_init_U
set CompName predecoder_kernel_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix predecoder_kernel_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


