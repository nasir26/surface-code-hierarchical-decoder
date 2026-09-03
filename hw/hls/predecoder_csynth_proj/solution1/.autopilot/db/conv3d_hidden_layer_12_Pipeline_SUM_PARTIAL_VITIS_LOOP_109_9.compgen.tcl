# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler predecoder_kernel_sparsemux_7_2_20_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {auto}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2084 \
    name acc_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_cast \
    op interface \
    ports { acc_cast { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2085 \
    name conv3_i203_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i203_reload \
    op interface \
    ports { conv3_i203_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2086 \
    name conv3_i_1116206_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1116206_reload \
    op interface \
    ports { conv3_i_1116206_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2087 \
    name conv3_i_2131209_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2131209_reload \
    op interface \
    ports { conv3_i_2131209_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2088 \
    name conv3_i_1212_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1212_reload \
    op interface \
    ports { conv3_i_1212_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2089 \
    name conv3_i_1_1215_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_1215_reload \
    op interface \
    ports { conv3_i_1_1215_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2090 \
    name conv3_i_1_2218_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_2218_reload \
    op interface \
    ports { conv3_i_1_2218_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2091 \
    name conv3_i_2221_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2221_reload \
    op interface \
    ports { conv3_i_2221_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2092 \
    name conv3_i_2_1224_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_1224_reload \
    op interface \
    ports { conv3_i_2_1224_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2093 \
    name conv3_i_2_2227_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_2227_reload \
    op interface \
    ports { conv3_i_2_2227_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2094 \
    name conv3_i_1148204_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1148204_reload \
    op interface \
    ports { conv3_i_1148204_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2095 \
    name conv3_i_1116_1207_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1116_1207_reload \
    op interface \
    ports { conv3_i_1116_1207_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2096 \
    name conv3_i_2131_1210_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2131_1210_reload \
    op interface \
    ports { conv3_i_2131_1210_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2097 \
    name conv3_i_1_188213_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_188213_reload \
    op interface \
    ports { conv3_i_1_188213_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2098 \
    name conv3_i_1_1_1216_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_1_1216_reload \
    op interface \
    ports { conv3_i_1_1_1216_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2099 \
    name conv3_i_1_2_1219_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_2_1219_reload \
    op interface \
    ports { conv3_i_1_2_1219_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2100 \
    name conv3_i_2_162222_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_162222_reload \
    op interface \
    ports { conv3_i_2_162222_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2101 \
    name conv3_i_2_1_1225_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_1_1225_reload \
    op interface \
    ports { conv3_i_2_1_1225_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2102 \
    name conv3_i_2_2_1228_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_2_1228_reload \
    op interface \
    ports { conv3_i_2_2_1228_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2103 \
    name conv3_i_2161205_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2161205_reload \
    op interface \
    ports { conv3_i_2161205_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2104 \
    name conv3_i_1116_2208_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1116_2208_reload \
    op interface \
    ports { conv3_i_1116_2208_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2105 \
    name conv3_i_2131_2211_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2131_2211_reload \
    op interface \
    ports { conv3_i_2131_2211_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2106 \
    name conv3_i_1_2101214_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_2101214_reload \
    op interface \
    ports { conv3_i_1_2101214_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2107 \
    name conv3_i_1_1_2217_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_1_2217_reload \
    op interface \
    ports { conv3_i_1_1_2217_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2108 \
    name conv3_i_1_2_2220_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_1_2_2220_reload \
    op interface \
    ports { conv3_i_1_2_2220_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2109 \
    name conv3_i_2_275223_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_275223_reload \
    op interface \
    ports { conv3_i_2_275223_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2110 \
    name conv3_i_2_1_2226_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_1_2226_reload \
    op interface \
    ports { conv3_i_2_1_2226_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2111 \
    name conv3_i_2_2_2229_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_2_2_2229_reload \
    op interface \
    ports { conv3_i_2_2_2229_reload { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2112 \
    name acc_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_3_out \
    op interface \
    ports { acc_3_out { O 25 vector } acc_3_out_ap_vld { O 1 bit } } \
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


