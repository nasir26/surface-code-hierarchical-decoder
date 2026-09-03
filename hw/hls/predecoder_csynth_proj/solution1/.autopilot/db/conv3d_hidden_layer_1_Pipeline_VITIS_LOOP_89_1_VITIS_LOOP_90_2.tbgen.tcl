set moduleName conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {conv3d_hidden_layer<1>_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln43 int 3 regular  }
	{ window_0 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ window_0_1 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ window_0_2 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ zext_ln62 int 3 regular  }
	{ cmp8_i_i int 1 regular  }
	{ fb_0 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_1 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_2 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_3 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_4 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_6 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_7 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_8 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_9 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_10 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_12 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_13 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_14 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_15 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_16 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ select_ln62 int 3 regular  }
	{ fb_0_5 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_11 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ fb_0_17 int 8 regular {array 6 { 1 3 } 1 1 }  }
	{ cmp9_i_i_2 int 1 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln43", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "window_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "window_0_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "window_0_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "zext_ln62", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "cmp8_i_i", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_2", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_3", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_6", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_7", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_8", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_9", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_10", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_12", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_13", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_14", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_15", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_16", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln62", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_5", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_11", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "fb_0_17", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "cmp9_i_i_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 77
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln43 sc_in sc_lv 3 signal 0 } 
	{ window_0_address0 sc_out sc_lv 4 signal 1 } 
	{ window_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ window_0_we0 sc_out sc_logic 1 signal 1 } 
	{ window_0_d0 sc_out sc_lv 8 signal 1 } 
	{ window_0_1_address0 sc_out sc_lv 4 signal 2 } 
	{ window_0_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ window_0_1_we0 sc_out sc_logic 1 signal 2 } 
	{ window_0_1_d0 sc_out sc_lv 8 signal 2 } 
	{ window_0_2_address0 sc_out sc_lv 4 signal 3 } 
	{ window_0_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ window_0_2_we0 sc_out sc_logic 1 signal 3 } 
	{ window_0_2_d0 sc_out sc_lv 8 signal 3 } 
	{ zext_ln62 sc_in sc_lv 3 signal 4 } 
	{ cmp8_i_i sc_in sc_lv 1 signal 5 } 
	{ fb_0_address0 sc_out sc_lv 3 signal 6 } 
	{ fb_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ fb_0_q0 sc_in sc_lv 8 signal 6 } 
	{ fb_0_1_address0 sc_out sc_lv 3 signal 7 } 
	{ fb_0_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ fb_0_1_q0 sc_in sc_lv 8 signal 7 } 
	{ fb_0_2_address0 sc_out sc_lv 3 signal 8 } 
	{ fb_0_2_ce0 sc_out sc_logic 1 signal 8 } 
	{ fb_0_2_q0 sc_in sc_lv 8 signal 8 } 
	{ fb_0_3_address0 sc_out sc_lv 3 signal 9 } 
	{ fb_0_3_ce0 sc_out sc_logic 1 signal 9 } 
	{ fb_0_3_q0 sc_in sc_lv 8 signal 9 } 
	{ fb_0_4_address0 sc_out sc_lv 3 signal 10 } 
	{ fb_0_4_ce0 sc_out sc_logic 1 signal 10 } 
	{ fb_0_4_q0 sc_in sc_lv 8 signal 10 } 
	{ fb_0_6_address0 sc_out sc_lv 3 signal 11 } 
	{ fb_0_6_ce0 sc_out sc_logic 1 signal 11 } 
	{ fb_0_6_q0 sc_in sc_lv 8 signal 11 } 
	{ fb_0_7_address0 sc_out sc_lv 3 signal 12 } 
	{ fb_0_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ fb_0_7_q0 sc_in sc_lv 8 signal 12 } 
	{ fb_0_8_address0 sc_out sc_lv 3 signal 13 } 
	{ fb_0_8_ce0 sc_out sc_logic 1 signal 13 } 
	{ fb_0_8_q0 sc_in sc_lv 8 signal 13 } 
	{ fb_0_9_address0 sc_out sc_lv 3 signal 14 } 
	{ fb_0_9_ce0 sc_out sc_logic 1 signal 14 } 
	{ fb_0_9_q0 sc_in sc_lv 8 signal 14 } 
	{ fb_0_10_address0 sc_out sc_lv 3 signal 15 } 
	{ fb_0_10_ce0 sc_out sc_logic 1 signal 15 } 
	{ fb_0_10_q0 sc_in sc_lv 8 signal 15 } 
	{ fb_0_12_address0 sc_out sc_lv 3 signal 16 } 
	{ fb_0_12_ce0 sc_out sc_logic 1 signal 16 } 
	{ fb_0_12_q0 sc_in sc_lv 8 signal 16 } 
	{ fb_0_13_address0 sc_out sc_lv 3 signal 17 } 
	{ fb_0_13_ce0 sc_out sc_logic 1 signal 17 } 
	{ fb_0_13_q0 sc_in sc_lv 8 signal 17 } 
	{ fb_0_14_address0 sc_out sc_lv 3 signal 18 } 
	{ fb_0_14_ce0 sc_out sc_logic 1 signal 18 } 
	{ fb_0_14_q0 sc_in sc_lv 8 signal 18 } 
	{ fb_0_15_address0 sc_out sc_lv 3 signal 19 } 
	{ fb_0_15_ce0 sc_out sc_logic 1 signal 19 } 
	{ fb_0_15_q0 sc_in sc_lv 8 signal 19 } 
	{ fb_0_16_address0 sc_out sc_lv 3 signal 20 } 
	{ fb_0_16_ce0 sc_out sc_logic 1 signal 20 } 
	{ fb_0_16_q0 sc_in sc_lv 8 signal 20 } 
	{ select_ln62 sc_in sc_lv 3 signal 21 } 
	{ fb_0_5_address0 sc_out sc_lv 3 signal 22 } 
	{ fb_0_5_ce0 sc_out sc_logic 1 signal 22 } 
	{ fb_0_5_q0 sc_in sc_lv 8 signal 22 } 
	{ fb_0_11_address0 sc_out sc_lv 3 signal 23 } 
	{ fb_0_11_ce0 sc_out sc_logic 1 signal 23 } 
	{ fb_0_11_q0 sc_in sc_lv 8 signal 23 } 
	{ fb_0_17_address0 sc_out sc_lv 3 signal 24 } 
	{ fb_0_17_ce0 sc_out sc_logic 1 signal 24 } 
	{ fb_0_17_q0 sc_in sc_lv 8 signal 24 } 
	{ cmp9_i_i_2 sc_in sc_lv 1 signal 25 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln43", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "zext_ln43", "role": "default" }} , 
 	{ "name": "window_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "window_0", "role": "address0" }} , 
 	{ "name": "window_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "window_0", "role": "ce0" }} , 
 	{ "name": "window_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "window_0", "role": "we0" }} , 
 	{ "name": "window_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0", "role": "d0" }} , 
 	{ "name": "window_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "window_0_1", "role": "address0" }} , 
 	{ "name": "window_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "window_0_1", "role": "ce0" }} , 
 	{ "name": "window_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "window_0_1", "role": "we0" }} , 
 	{ "name": "window_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_1", "role": "d0" }} , 
 	{ "name": "window_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "window_0_2", "role": "address0" }} , 
 	{ "name": "window_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "window_0_2", "role": "ce0" }} , 
 	{ "name": "window_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "window_0_2", "role": "we0" }} , 
 	{ "name": "window_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_2", "role": "d0" }} , 
 	{ "name": "zext_ln62", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "zext_ln62", "role": "default" }} , 
 	{ "name": "cmp8_i_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp8_i_i", "role": "default" }} , 
 	{ "name": "fb_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0", "role": "address0" }} , 
 	{ "name": "fb_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0", "role": "ce0" }} , 
 	{ "name": "fb_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0", "role": "q0" }} , 
 	{ "name": "fb_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_1", "role": "address0" }} , 
 	{ "name": "fb_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_1", "role": "ce0" }} , 
 	{ "name": "fb_0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_1", "role": "q0" }} , 
 	{ "name": "fb_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_2", "role": "address0" }} , 
 	{ "name": "fb_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_2", "role": "ce0" }} , 
 	{ "name": "fb_0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_2", "role": "q0" }} , 
 	{ "name": "fb_0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_3", "role": "address0" }} , 
 	{ "name": "fb_0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_3", "role": "ce0" }} , 
 	{ "name": "fb_0_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_3", "role": "q0" }} , 
 	{ "name": "fb_0_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_4", "role": "address0" }} , 
 	{ "name": "fb_0_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_4", "role": "ce0" }} , 
 	{ "name": "fb_0_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_4", "role": "q0" }} , 
 	{ "name": "fb_0_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_6", "role": "address0" }} , 
 	{ "name": "fb_0_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_6", "role": "ce0" }} , 
 	{ "name": "fb_0_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_6", "role": "q0" }} , 
 	{ "name": "fb_0_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_7", "role": "address0" }} , 
 	{ "name": "fb_0_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_7", "role": "ce0" }} , 
 	{ "name": "fb_0_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_7", "role": "q0" }} , 
 	{ "name": "fb_0_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_8", "role": "address0" }} , 
 	{ "name": "fb_0_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_8", "role": "ce0" }} , 
 	{ "name": "fb_0_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_8", "role": "q0" }} , 
 	{ "name": "fb_0_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_9", "role": "address0" }} , 
 	{ "name": "fb_0_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_9", "role": "ce0" }} , 
 	{ "name": "fb_0_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_9", "role": "q0" }} , 
 	{ "name": "fb_0_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_10", "role": "address0" }} , 
 	{ "name": "fb_0_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_10", "role": "ce0" }} , 
 	{ "name": "fb_0_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_10", "role": "q0" }} , 
 	{ "name": "fb_0_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_12", "role": "address0" }} , 
 	{ "name": "fb_0_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_12", "role": "ce0" }} , 
 	{ "name": "fb_0_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_12", "role": "q0" }} , 
 	{ "name": "fb_0_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_13", "role": "address0" }} , 
 	{ "name": "fb_0_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_13", "role": "ce0" }} , 
 	{ "name": "fb_0_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_13", "role": "q0" }} , 
 	{ "name": "fb_0_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_14", "role": "address0" }} , 
 	{ "name": "fb_0_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_14", "role": "ce0" }} , 
 	{ "name": "fb_0_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_14", "role": "q0" }} , 
 	{ "name": "fb_0_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_15", "role": "address0" }} , 
 	{ "name": "fb_0_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_15", "role": "ce0" }} , 
 	{ "name": "fb_0_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_15", "role": "q0" }} , 
 	{ "name": "fb_0_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_16", "role": "address0" }} , 
 	{ "name": "fb_0_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_16", "role": "ce0" }} , 
 	{ "name": "fb_0_16_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_16", "role": "q0" }} , 
 	{ "name": "select_ln62", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "select_ln62", "role": "default" }} , 
 	{ "name": "fb_0_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_5", "role": "address0" }} , 
 	{ "name": "fb_0_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_5", "role": "ce0" }} , 
 	{ "name": "fb_0_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_5", "role": "q0" }} , 
 	{ "name": "fb_0_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_11", "role": "address0" }} , 
 	{ "name": "fb_0_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_11", "role": "ce0" }} , 
 	{ "name": "fb_0_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_11", "role": "q0" }} , 
 	{ "name": "fb_0_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_17", "role": "address0" }} , 
 	{ "name": "fb_0_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_17", "role": "ce0" }} , 
 	{ "name": "fb_0_17_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_17", "role": "q0" }} , 
 	{ "name": "cmp9_i_i_2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp9_i_i_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"],
		"CDFG" : "conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "47",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln43", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "window_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "window_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln62", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp8_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "fb_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "select_ln62", "Type" : "None", "Direction" : "I"},
			{"Name" : "fb_0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fb_0_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cmp9_i_i_2", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_89_1_VITIS_LOOP_90_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter37", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter37", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32s_3ns_2_36_1_U45", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_8_1_1_U46", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_8_1_1_U47", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_8_1_1_U48", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_8_1_1_U49", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_13_3_8_1_1_U50", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_13_3_8_1_1_U51", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_13_3_8_1_1_U52", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_8_1_1_U53", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_8_1_1_U54", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_8_1_1_U55", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_8_1_1_U56", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_8_1_1_U57", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2 {
		zext_ln43 {Type I LastRead 0 FirstWrite -1}
		window_0 {Type O LastRead -1 FirstWrite 37}
		window_0_1 {Type O LastRead -1 FirstWrite 37}
		window_0_2 {Type O LastRead -1 FirstWrite 37}
		zext_ln62 {Type I LastRead 0 FirstWrite -1}
		cmp8_i_i {Type I LastRead 0 FirstWrite -1}
		fb_0 {Type I LastRead 35 FirstWrite -1}
		fb_0_1 {Type I LastRead 35 FirstWrite -1}
		fb_0_2 {Type I LastRead 35 FirstWrite -1}
		fb_0_3 {Type I LastRead 35 FirstWrite -1}
		fb_0_4 {Type I LastRead 35 FirstWrite -1}
		fb_0_6 {Type I LastRead 35 FirstWrite -1}
		fb_0_7 {Type I LastRead 35 FirstWrite -1}
		fb_0_8 {Type I LastRead 35 FirstWrite -1}
		fb_0_9 {Type I LastRead 35 FirstWrite -1}
		fb_0_10 {Type I LastRead 35 FirstWrite -1}
		fb_0_12 {Type I LastRead 35 FirstWrite -1}
		fb_0_13 {Type I LastRead 35 FirstWrite -1}
		fb_0_14 {Type I LastRead 35 FirstWrite -1}
		fb_0_15 {Type I LastRead 35 FirstWrite -1}
		fb_0_16 {Type I LastRead 35 FirstWrite -1}
		select_ln62 {Type I LastRead 0 FirstWrite -1}
		fb_0_5 {Type I LastRead 35 FirstWrite -1}
		fb_0_11 {Type I LastRead 35 FirstWrite -1}
		fb_0_17 {Type I LastRead 35 FirstWrite -1}
		cmp9_i_i_2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "47", "Max" : "47"}
	, {"Name" : "Interval", "Min" : "47", "Max" : "47"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln43 { ap_none {  { zext_ln43 in_data 0 3 } } }
	window_0 { ap_memory {  { window_0_address0 mem_address 1 4 }  { window_0_ce0 mem_ce 1 1 }  { window_0_we0 mem_we 1 1 }  { window_0_d0 mem_din 1 8 } } }
	window_0_1 { ap_memory {  { window_0_1_address0 mem_address 1 4 }  { window_0_1_ce0 mem_ce 1 1 }  { window_0_1_we0 mem_we 1 1 }  { window_0_1_d0 mem_din 1 8 } } }
	window_0_2 { ap_memory {  { window_0_2_address0 mem_address 1 4 }  { window_0_2_ce0 mem_ce 1 1 }  { window_0_2_we0 mem_we 1 1 }  { window_0_2_d0 mem_din 1 8 } } }
	zext_ln62 { ap_none {  { zext_ln62 in_data 0 3 } } }
	cmp8_i_i { ap_none {  { cmp8_i_i in_data 0 1 } } }
	fb_0 { ap_memory {  { fb_0_address0 mem_address 1 3 }  { fb_0_ce0 mem_ce 1 1 }  { fb_0_q0 in_data 0 8 } } }
	fb_0_1 { ap_memory {  { fb_0_1_address0 mem_address 1 3 }  { fb_0_1_ce0 mem_ce 1 1 }  { fb_0_1_q0 in_data 0 8 } } }
	fb_0_2 { ap_memory {  { fb_0_2_address0 mem_address 1 3 }  { fb_0_2_ce0 mem_ce 1 1 }  { fb_0_2_q0 in_data 0 8 } } }
	fb_0_3 { ap_memory {  { fb_0_3_address0 mem_address 1 3 }  { fb_0_3_ce0 mem_ce 1 1 }  { fb_0_3_q0 in_data 0 8 } } }
	fb_0_4 { ap_memory {  { fb_0_4_address0 mem_address 1 3 }  { fb_0_4_ce0 mem_ce 1 1 }  { fb_0_4_q0 in_data 0 8 } } }
	fb_0_6 { ap_memory {  { fb_0_6_address0 mem_address 1 3 }  { fb_0_6_ce0 mem_ce 1 1 }  { fb_0_6_q0 in_data 0 8 } } }
	fb_0_7 { ap_memory {  { fb_0_7_address0 mem_address 1 3 }  { fb_0_7_ce0 mem_ce 1 1 }  { fb_0_7_q0 in_data 0 8 } } }
	fb_0_8 { ap_memory {  { fb_0_8_address0 mem_address 1 3 }  { fb_0_8_ce0 mem_ce 1 1 }  { fb_0_8_q0 in_data 0 8 } } }
	fb_0_9 { ap_memory {  { fb_0_9_address0 mem_address 1 3 }  { fb_0_9_ce0 mem_ce 1 1 }  { fb_0_9_q0 in_data 0 8 } } }
	fb_0_10 { ap_memory {  { fb_0_10_address0 mem_address 1 3 }  { fb_0_10_ce0 mem_ce 1 1 }  { fb_0_10_q0 in_data 0 8 } } }
	fb_0_12 { ap_memory {  { fb_0_12_address0 mem_address 1 3 }  { fb_0_12_ce0 mem_ce 1 1 }  { fb_0_12_q0 in_data 0 8 } } }
	fb_0_13 { ap_memory {  { fb_0_13_address0 mem_address 1 3 }  { fb_0_13_ce0 mem_ce 1 1 }  { fb_0_13_q0 in_data 0 8 } } }
	fb_0_14 { ap_memory {  { fb_0_14_address0 mem_address 1 3 }  { fb_0_14_ce0 mem_ce 1 1 }  { fb_0_14_q0 in_data 0 8 } } }
	fb_0_15 { ap_memory {  { fb_0_15_address0 mem_address 1 3 }  { fb_0_15_ce0 mem_ce 1 1 }  { fb_0_15_q0 in_data 0 8 } } }
	fb_0_16 { ap_memory {  { fb_0_16_address0 mem_address 1 3 }  { fb_0_16_ce0 mem_ce 1 1 }  { fb_0_16_q0 in_data 0 8 } } }
	select_ln62 { ap_none {  { select_ln62 in_data 0 3 } } }
	fb_0_5 { ap_memory {  { fb_0_5_address0 mem_address 1 3 }  { fb_0_5_ce0 mem_ce 1 1 }  { fb_0_5_q0 in_data 0 8 } } }
	fb_0_11 { ap_memory {  { fb_0_11_address0 mem_address 1 3 }  { fb_0_11_ce0 mem_ce 1 1 }  { fb_0_11_q0 in_data 0 8 } } }
	fb_0_17 { ap_memory {  { fb_0_17_address0 mem_address 1 3 }  { fb_0_17_ce0 mem_ce 1 1 }  { fb_0_17_q0 in_data 0 8 } } }
	cmp9_i_i_2 { ap_none {  { cmp9_i_i_2 in_data 0 1 } } }
}
