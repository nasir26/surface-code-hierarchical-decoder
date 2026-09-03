set moduleName conv3d_hidden_layer_1_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2
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
set C_modelName {conv3d_hidden_layer<1>_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ fb_0 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_1 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_2 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_3 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_4 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_5 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_6 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_7 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_8 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_9 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_10 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_11 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_12 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_13 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_14 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_15 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_16 int 8 regular {array 6 { 0 3 } 0 1 }  }
	{ fb_0_17 int 8 regular {array 6 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "fb_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_8", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_9", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_10", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_11", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_12", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_13", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_14", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_15", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_16", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fb_0_17", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 78
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fb_0_address0 sc_out sc_lv 3 signal 0 } 
	{ fb_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ fb_0_we0 sc_out sc_logic 1 signal 0 } 
	{ fb_0_d0 sc_out sc_lv 8 signal 0 } 
	{ fb_0_1_address0 sc_out sc_lv 3 signal 1 } 
	{ fb_0_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ fb_0_1_we0 sc_out sc_logic 1 signal 1 } 
	{ fb_0_1_d0 sc_out sc_lv 8 signal 1 } 
	{ fb_0_2_address0 sc_out sc_lv 3 signal 2 } 
	{ fb_0_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ fb_0_2_we0 sc_out sc_logic 1 signal 2 } 
	{ fb_0_2_d0 sc_out sc_lv 8 signal 2 } 
	{ fb_0_3_address0 sc_out sc_lv 3 signal 3 } 
	{ fb_0_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ fb_0_3_we0 sc_out sc_logic 1 signal 3 } 
	{ fb_0_3_d0 sc_out sc_lv 8 signal 3 } 
	{ fb_0_4_address0 sc_out sc_lv 3 signal 4 } 
	{ fb_0_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ fb_0_4_we0 sc_out sc_logic 1 signal 4 } 
	{ fb_0_4_d0 sc_out sc_lv 8 signal 4 } 
	{ fb_0_5_address0 sc_out sc_lv 3 signal 5 } 
	{ fb_0_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ fb_0_5_we0 sc_out sc_logic 1 signal 5 } 
	{ fb_0_5_d0 sc_out sc_lv 8 signal 5 } 
	{ fb_0_6_address0 sc_out sc_lv 3 signal 6 } 
	{ fb_0_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ fb_0_6_we0 sc_out sc_logic 1 signal 6 } 
	{ fb_0_6_d0 sc_out sc_lv 8 signal 6 } 
	{ fb_0_7_address0 sc_out sc_lv 3 signal 7 } 
	{ fb_0_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ fb_0_7_we0 sc_out sc_logic 1 signal 7 } 
	{ fb_0_7_d0 sc_out sc_lv 8 signal 7 } 
	{ fb_0_8_address0 sc_out sc_lv 3 signal 8 } 
	{ fb_0_8_ce0 sc_out sc_logic 1 signal 8 } 
	{ fb_0_8_we0 sc_out sc_logic 1 signal 8 } 
	{ fb_0_8_d0 sc_out sc_lv 8 signal 8 } 
	{ fb_0_9_address0 sc_out sc_lv 3 signal 9 } 
	{ fb_0_9_ce0 sc_out sc_logic 1 signal 9 } 
	{ fb_0_9_we0 sc_out sc_logic 1 signal 9 } 
	{ fb_0_9_d0 sc_out sc_lv 8 signal 9 } 
	{ fb_0_10_address0 sc_out sc_lv 3 signal 10 } 
	{ fb_0_10_ce0 sc_out sc_logic 1 signal 10 } 
	{ fb_0_10_we0 sc_out sc_logic 1 signal 10 } 
	{ fb_0_10_d0 sc_out sc_lv 8 signal 10 } 
	{ fb_0_11_address0 sc_out sc_lv 3 signal 11 } 
	{ fb_0_11_ce0 sc_out sc_logic 1 signal 11 } 
	{ fb_0_11_we0 sc_out sc_logic 1 signal 11 } 
	{ fb_0_11_d0 sc_out sc_lv 8 signal 11 } 
	{ fb_0_12_address0 sc_out sc_lv 3 signal 12 } 
	{ fb_0_12_ce0 sc_out sc_logic 1 signal 12 } 
	{ fb_0_12_we0 sc_out sc_logic 1 signal 12 } 
	{ fb_0_12_d0 sc_out sc_lv 8 signal 12 } 
	{ fb_0_13_address0 sc_out sc_lv 3 signal 13 } 
	{ fb_0_13_ce0 sc_out sc_logic 1 signal 13 } 
	{ fb_0_13_we0 sc_out sc_logic 1 signal 13 } 
	{ fb_0_13_d0 sc_out sc_lv 8 signal 13 } 
	{ fb_0_14_address0 sc_out sc_lv 3 signal 14 } 
	{ fb_0_14_ce0 sc_out sc_logic 1 signal 14 } 
	{ fb_0_14_we0 sc_out sc_logic 1 signal 14 } 
	{ fb_0_14_d0 sc_out sc_lv 8 signal 14 } 
	{ fb_0_15_address0 sc_out sc_lv 3 signal 15 } 
	{ fb_0_15_ce0 sc_out sc_logic 1 signal 15 } 
	{ fb_0_15_we0 sc_out sc_logic 1 signal 15 } 
	{ fb_0_15_d0 sc_out sc_lv 8 signal 15 } 
	{ fb_0_16_address0 sc_out sc_lv 3 signal 16 } 
	{ fb_0_16_ce0 sc_out sc_logic 1 signal 16 } 
	{ fb_0_16_we0 sc_out sc_logic 1 signal 16 } 
	{ fb_0_16_d0 sc_out sc_lv 8 signal 16 } 
	{ fb_0_17_address0 sc_out sc_lv 3 signal 17 } 
	{ fb_0_17_ce0 sc_out sc_logic 1 signal 17 } 
	{ fb_0_17_we0 sc_out sc_logic 1 signal 17 } 
	{ fb_0_17_d0 sc_out sc_lv 8 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fb_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0", "role": "address0" }} , 
 	{ "name": "fb_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0", "role": "ce0" }} , 
 	{ "name": "fb_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0", "role": "we0" }} , 
 	{ "name": "fb_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0", "role": "d0" }} , 
 	{ "name": "fb_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_1", "role": "address0" }} , 
 	{ "name": "fb_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_1", "role": "ce0" }} , 
 	{ "name": "fb_0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_1", "role": "we0" }} , 
 	{ "name": "fb_0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_1", "role": "d0" }} , 
 	{ "name": "fb_0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_2", "role": "address0" }} , 
 	{ "name": "fb_0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_2", "role": "ce0" }} , 
 	{ "name": "fb_0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_2", "role": "we0" }} , 
 	{ "name": "fb_0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_2", "role": "d0" }} , 
 	{ "name": "fb_0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_3", "role": "address0" }} , 
 	{ "name": "fb_0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_3", "role": "ce0" }} , 
 	{ "name": "fb_0_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_3", "role": "we0" }} , 
 	{ "name": "fb_0_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_3", "role": "d0" }} , 
 	{ "name": "fb_0_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_4", "role": "address0" }} , 
 	{ "name": "fb_0_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_4", "role": "ce0" }} , 
 	{ "name": "fb_0_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_4", "role": "we0" }} , 
 	{ "name": "fb_0_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_4", "role": "d0" }} , 
 	{ "name": "fb_0_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_5", "role": "address0" }} , 
 	{ "name": "fb_0_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_5", "role": "ce0" }} , 
 	{ "name": "fb_0_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_5", "role": "we0" }} , 
 	{ "name": "fb_0_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_5", "role": "d0" }} , 
 	{ "name": "fb_0_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_6", "role": "address0" }} , 
 	{ "name": "fb_0_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_6", "role": "ce0" }} , 
 	{ "name": "fb_0_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_6", "role": "we0" }} , 
 	{ "name": "fb_0_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_6", "role": "d0" }} , 
 	{ "name": "fb_0_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_7", "role": "address0" }} , 
 	{ "name": "fb_0_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_7", "role": "ce0" }} , 
 	{ "name": "fb_0_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_7", "role": "we0" }} , 
 	{ "name": "fb_0_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_7", "role": "d0" }} , 
 	{ "name": "fb_0_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_8", "role": "address0" }} , 
 	{ "name": "fb_0_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_8", "role": "ce0" }} , 
 	{ "name": "fb_0_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_8", "role": "we0" }} , 
 	{ "name": "fb_0_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_8", "role": "d0" }} , 
 	{ "name": "fb_0_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_9", "role": "address0" }} , 
 	{ "name": "fb_0_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_9", "role": "ce0" }} , 
 	{ "name": "fb_0_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_9", "role": "we0" }} , 
 	{ "name": "fb_0_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_9", "role": "d0" }} , 
 	{ "name": "fb_0_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_10", "role": "address0" }} , 
 	{ "name": "fb_0_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_10", "role": "ce0" }} , 
 	{ "name": "fb_0_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_10", "role": "we0" }} , 
 	{ "name": "fb_0_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_10", "role": "d0" }} , 
 	{ "name": "fb_0_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_11", "role": "address0" }} , 
 	{ "name": "fb_0_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_11", "role": "ce0" }} , 
 	{ "name": "fb_0_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_11", "role": "we0" }} , 
 	{ "name": "fb_0_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_11", "role": "d0" }} , 
 	{ "name": "fb_0_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_12", "role": "address0" }} , 
 	{ "name": "fb_0_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_12", "role": "ce0" }} , 
 	{ "name": "fb_0_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_12", "role": "we0" }} , 
 	{ "name": "fb_0_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_12", "role": "d0" }} , 
 	{ "name": "fb_0_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_13", "role": "address0" }} , 
 	{ "name": "fb_0_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_13", "role": "ce0" }} , 
 	{ "name": "fb_0_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_13", "role": "we0" }} , 
 	{ "name": "fb_0_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_13", "role": "d0" }} , 
 	{ "name": "fb_0_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_14", "role": "address0" }} , 
 	{ "name": "fb_0_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_14", "role": "ce0" }} , 
 	{ "name": "fb_0_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_14", "role": "we0" }} , 
 	{ "name": "fb_0_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_14", "role": "d0" }} , 
 	{ "name": "fb_0_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_15", "role": "address0" }} , 
 	{ "name": "fb_0_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_15", "role": "ce0" }} , 
 	{ "name": "fb_0_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_15", "role": "we0" }} , 
 	{ "name": "fb_0_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_15", "role": "d0" }} , 
 	{ "name": "fb_0_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_16", "role": "address0" }} , 
 	{ "name": "fb_0_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_16", "role": "ce0" }} , 
 	{ "name": "fb_0_16_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_16", "role": "we0" }} , 
 	{ "name": "fb_0_16_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_16", "role": "d0" }} , 
 	{ "name": "fb_0_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "fb_0_17", "role": "address0" }} , 
 	{ "name": "fb_0_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_17", "role": "ce0" }} , 
 	{ "name": "fb_0_17_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_0_17", "role": "we0" }} , 
 	{ "name": "fb_0_17_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb_0_17", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "conv3d_hidden_layer_1_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "110", "EstimateLatencyMax" : "110",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "fb_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_16", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fb_0_17", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv3d_hidden_layer_1_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2 {
		fb_0 {Type O LastRead -1 FirstWrite 1}
		fb_0_1 {Type O LastRead -1 FirstWrite 1}
		fb_0_2 {Type O LastRead -1 FirstWrite 1}
		fb_0_3 {Type O LastRead -1 FirstWrite 1}
		fb_0_4 {Type O LastRead -1 FirstWrite 1}
		fb_0_5 {Type O LastRead -1 FirstWrite 1}
		fb_0_6 {Type O LastRead -1 FirstWrite 1}
		fb_0_7 {Type O LastRead -1 FirstWrite 1}
		fb_0_8 {Type O LastRead -1 FirstWrite 1}
		fb_0_9 {Type O LastRead -1 FirstWrite 1}
		fb_0_10 {Type O LastRead -1 FirstWrite 1}
		fb_0_11 {Type O LastRead -1 FirstWrite 1}
		fb_0_12 {Type O LastRead -1 FirstWrite 1}
		fb_0_13 {Type O LastRead -1 FirstWrite 1}
		fb_0_14 {Type O LastRead -1 FirstWrite 1}
		fb_0_15 {Type O LastRead -1 FirstWrite 1}
		fb_0_16 {Type O LastRead -1 FirstWrite 1}
		fb_0_17 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "110", "Max" : "110"}
	, {"Name" : "Interval", "Min" : "110", "Max" : "110"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	fb_0 { ap_memory {  { fb_0_address0 mem_address 1 3 }  { fb_0_ce0 mem_ce 1 1 }  { fb_0_we0 mem_we 1 1 }  { fb_0_d0 mem_din 1 8 } } }
	fb_0_1 { ap_memory {  { fb_0_1_address0 mem_address 1 3 }  { fb_0_1_ce0 mem_ce 1 1 }  { fb_0_1_we0 mem_we 1 1 }  { fb_0_1_d0 mem_din 1 8 } } }
	fb_0_2 { ap_memory {  { fb_0_2_address0 mem_address 1 3 }  { fb_0_2_ce0 mem_ce 1 1 }  { fb_0_2_we0 mem_we 1 1 }  { fb_0_2_d0 mem_din 1 8 } } }
	fb_0_3 { ap_memory {  { fb_0_3_address0 mem_address 1 3 }  { fb_0_3_ce0 mem_ce 1 1 }  { fb_0_3_we0 mem_we 1 1 }  { fb_0_3_d0 mem_din 1 8 } } }
	fb_0_4 { ap_memory {  { fb_0_4_address0 mem_address 1 3 }  { fb_0_4_ce0 mem_ce 1 1 }  { fb_0_4_we0 mem_we 1 1 }  { fb_0_4_d0 mem_din 1 8 } } }
	fb_0_5 { ap_memory {  { fb_0_5_address0 mem_address 1 3 }  { fb_0_5_ce0 mem_ce 1 1 }  { fb_0_5_we0 mem_we 1 1 }  { fb_0_5_d0 mem_din 1 8 } } }
	fb_0_6 { ap_memory {  { fb_0_6_address0 mem_address 1 3 }  { fb_0_6_ce0 mem_ce 1 1 }  { fb_0_6_we0 mem_we 1 1 }  { fb_0_6_d0 mem_din 1 8 } } }
	fb_0_7 { ap_memory {  { fb_0_7_address0 mem_address 1 3 }  { fb_0_7_ce0 mem_ce 1 1 }  { fb_0_7_we0 mem_we 1 1 }  { fb_0_7_d0 mem_din 1 8 } } }
	fb_0_8 { ap_memory {  { fb_0_8_address0 mem_address 1 3 }  { fb_0_8_ce0 mem_ce 1 1 }  { fb_0_8_we0 mem_we 1 1 }  { fb_0_8_d0 mem_din 1 8 } } }
	fb_0_9 { ap_memory {  { fb_0_9_address0 mem_address 1 3 }  { fb_0_9_ce0 mem_ce 1 1 }  { fb_0_9_we0 mem_we 1 1 }  { fb_0_9_d0 mem_din 1 8 } } }
	fb_0_10 { ap_memory {  { fb_0_10_address0 mem_address 1 3 }  { fb_0_10_ce0 mem_ce 1 1 }  { fb_0_10_we0 mem_we 1 1 }  { fb_0_10_d0 mem_din 1 8 } } }
	fb_0_11 { ap_memory {  { fb_0_11_address0 mem_address 1 3 }  { fb_0_11_ce0 mem_ce 1 1 }  { fb_0_11_we0 mem_we 1 1 }  { fb_0_11_d0 mem_din 1 8 } } }
	fb_0_12 { ap_memory {  { fb_0_12_address0 mem_address 1 3 }  { fb_0_12_ce0 mem_ce 1 1 }  { fb_0_12_we0 mem_we 1 1 }  { fb_0_12_d0 mem_din 1 8 } } }
	fb_0_13 { ap_memory {  { fb_0_13_address0 mem_address 1 3 }  { fb_0_13_ce0 mem_ce 1 1 }  { fb_0_13_we0 mem_we 1 1 }  { fb_0_13_d0 mem_din 1 8 } } }
	fb_0_14 { ap_memory {  { fb_0_14_address0 mem_address 1 3 }  { fb_0_14_ce0 mem_ce 1 1 }  { fb_0_14_we0 mem_we 1 1 }  { fb_0_14_d0 mem_din 1 8 } } }
	fb_0_15 { ap_memory {  { fb_0_15_address0 mem_address 1 3 }  { fb_0_15_ce0 mem_ce 1 1 }  { fb_0_15_we0 mem_we 1 1 }  { fb_0_15_d0 mem_din 1 8 } } }
	fb_0_16 { ap_memory {  { fb_0_16_address0 mem_address 1 3 }  { fb_0_16_ce0 mem_ce 1 1 }  { fb_0_16_we0 mem_we 1 1 }  { fb_0_16_d0 mem_din 1 8 } } }
	fb_0_17 { ap_memory {  { fb_0_17_address0 mem_address 1 3 }  { fb_0_17_ce0 mem_ce 1 1 }  { fb_0_17_we0 mem_we 1 1 }  { fb_0_17_d0 mem_din 1 8 } } }
}
