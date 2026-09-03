// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1__HH__
#define __predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1__HH__
#include "predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int dout_WIDTH>
SC_MODULE(predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2 predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U;

    SC_CTOR(predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1):  predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U ("predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U") {
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.clk(clk);
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.rst(reset);
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.ce(ce);
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.in0(din0);
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.in1(din1);
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.in2(din2);
        predecoder_kernel_mac_muladd_8ns_7s_16s_17_4_1_DSP48_2_U.dout(dout);

    }

};

#endif //
