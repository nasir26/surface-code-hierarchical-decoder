set moduleName conv3d_hidden_layer_1_Pipeline_OC_LOOP
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
set C_modelName {conv3d_hidden_layer<1>_Pipeline_OC_LOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ window_0_load_cast int 8 regular  }
	{ window_1_0_load_cast int 8 regular  }
	{ window_2_0_load_cast int 8 regular  }
	{ window_0_load_1_cast int 8 regular  }
	{ window_1_0_load_1_cast int 8 regular  }
	{ window_2_0_load_1_cast int 8 regular  }
	{ window_0_load_2_cast int 8 regular  }
	{ window_1_0_load_2_cast int 8 regular  }
	{ window_2_0_load_2_cast int 8 regular  }
	{ window_0_load_3_cast int 8 regular  }
	{ window_1_0_load_3_cast int 8 regular  }
	{ window_2_0_load_3_cast int 8 regular  }
	{ window_0_load_4_cast int 8 regular  }
	{ window_1_0_load_4_cast int 8 regular  }
	{ window_2_0_load_4_cast int 8 regular  }
	{ window_0_load_5_cast int 8 regular  }
	{ window_1_0_load_5_cast int 8 regular  }
	{ window_2_0_load_5_cast int 8 regular  }
	{ window_0_load_6_cast int 8 regular  }
	{ window_1_0_load_6_cast int 8 regular  }
	{ window_2_0_load_6_cast int 8 regular  }
	{ window_0_load_7_cast int 8 regular  }
	{ window_1_0_load_7_cast int 8 regular  }
	{ window_2_0_load_7_cast int 8 regular  }
	{ window_0_load_8_cast int 8 regular  }
	{ window_1_0_load_8_cast int 8 regular  }
	{ zext_ln69 int 8 regular  }
	{ out_r int 8 regular {array 12 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "window_0_load_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_1_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_1_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_1_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_2_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_2_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_2_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_3_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_3_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_3_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_4_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_4_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_4_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_5_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_5_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_5_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_6_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_6_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_6_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_7_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_7_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_2_0_load_7_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_0_load_8_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "window_1_0_load_8_cast", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln69", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "out_r", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ window_0_load_cast sc_in sc_lv 8 signal 0 } 
	{ window_1_0_load_cast sc_in sc_lv 8 signal 1 } 
	{ window_2_0_load_cast sc_in sc_lv 8 signal 2 } 
	{ window_0_load_1_cast sc_in sc_lv 8 signal 3 } 
	{ window_1_0_load_1_cast sc_in sc_lv 8 signal 4 } 
	{ window_2_0_load_1_cast sc_in sc_lv 8 signal 5 } 
	{ window_0_load_2_cast sc_in sc_lv 8 signal 6 } 
	{ window_1_0_load_2_cast sc_in sc_lv 8 signal 7 } 
	{ window_2_0_load_2_cast sc_in sc_lv 8 signal 8 } 
	{ window_0_load_3_cast sc_in sc_lv 8 signal 9 } 
	{ window_1_0_load_3_cast sc_in sc_lv 8 signal 10 } 
	{ window_2_0_load_3_cast sc_in sc_lv 8 signal 11 } 
	{ window_0_load_4_cast sc_in sc_lv 8 signal 12 } 
	{ window_1_0_load_4_cast sc_in sc_lv 8 signal 13 } 
	{ window_2_0_load_4_cast sc_in sc_lv 8 signal 14 } 
	{ window_0_load_5_cast sc_in sc_lv 8 signal 15 } 
	{ window_1_0_load_5_cast sc_in sc_lv 8 signal 16 } 
	{ window_2_0_load_5_cast sc_in sc_lv 8 signal 17 } 
	{ window_0_load_6_cast sc_in sc_lv 8 signal 18 } 
	{ window_1_0_load_6_cast sc_in sc_lv 8 signal 19 } 
	{ window_2_0_load_6_cast sc_in sc_lv 8 signal 20 } 
	{ window_0_load_7_cast sc_in sc_lv 8 signal 21 } 
	{ window_1_0_load_7_cast sc_in sc_lv 8 signal 22 } 
	{ window_2_0_load_7_cast sc_in sc_lv 8 signal 23 } 
	{ window_0_load_8_cast sc_in sc_lv 8 signal 24 } 
	{ window_1_0_load_8_cast sc_in sc_lv 8 signal 25 } 
	{ zext_ln69 sc_in sc_lv 8 signal 26 } 
	{ out_r_address0 sc_out sc_lv 4 signal 27 } 
	{ out_r_ce0 sc_out sc_logic 1 signal 27 } 
	{ out_r_we0 sc_out sc_logic 1 signal 27 } 
	{ out_r_d0 sc_out sc_lv 8 signal 27 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "window_0_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_cast", "role": "default" }} , 
 	{ "name": "window_0_load_1_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_1_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_1_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_1_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_1_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_1_cast", "role": "default" }} , 
 	{ "name": "window_0_load_2_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_2_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_2_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_2_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_2_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_2_cast", "role": "default" }} , 
 	{ "name": "window_0_load_3_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_3_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_3_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_3_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_3_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_3_cast", "role": "default" }} , 
 	{ "name": "window_0_load_4_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_4_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_4_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_4_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_4_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_4_cast", "role": "default" }} , 
 	{ "name": "window_0_load_5_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_5_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_5_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_5_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_5_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_5_cast", "role": "default" }} , 
 	{ "name": "window_0_load_6_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_6_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_6_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_6_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_6_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_6_cast", "role": "default" }} , 
 	{ "name": "window_0_load_7_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_7_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_7_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_7_cast", "role": "default" }} , 
 	{ "name": "window_2_0_load_7_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_2_0_load_7_cast", "role": "default" }} , 
 	{ "name": "window_0_load_8_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_0_load_8_cast", "role": "default" }} , 
 	{ "name": "window_1_0_load_8_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "window_1_0_load_8_cast", "role": "default" }} , 
 	{ "name": "zext_ln69", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln69", "role": "default" }} , 
 	{ "name": "out_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "address0" }} , 
 	{ "name": "out_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "ce0" }} , 
 	{ "name": "out_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "we0" }} , 
 	{ "name": "out_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_r", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58"],
		"CDFG" : "conv3d_hidden_layer_1_Pipeline_OC_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "27", "EstimateLatencyMax" : "27",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "window_0_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_1_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_1_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_1_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_2_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_2_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_2_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_3_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_3_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_3_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_4_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_4_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_4_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_5_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_5_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_5_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_6_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_6_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_6_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_7_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_7_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_2_0_load_7_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_0_load_8_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "window_1_0_load_8_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln69", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "predecoder_weights_LAYER0_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layer0_mult", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "OC_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_16_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_17_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_18_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_19_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_20_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_21_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_22_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_23_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_24_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_25_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_26_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predecoder_weights_LAYER0_BIAS_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layer0_mult_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_76ns_57ns_132_5_1_U89", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U90", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U91", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U92", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U93", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U94", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U95", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U96", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U97", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U98", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8s_8ns_16_1_1_U99", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_16s_17_4_1_U100", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_6s_16s_17_4_1_U101", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_16s_17_4_1_U102", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_7s_16s_17_4_1_U103", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_17s_17_4_1_U104", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_7s_16s_17_4_1_U105", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_16s_17_4_1_U106", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_17s_17_4_1_U107", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_16s_17_4_1_U108", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_16s_17_4_1_U109", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_17s_18_4_1_U110", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_17s_18_4_1_U111", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_17s_18_4_1_U112", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_7s_16s_17_4_1_U113", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_7s_9s_15_4_1_U114", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_16s_17_4_1_U115", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8s_8ns_20s_20_4_1_U116", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv3d_hidden_layer_1_Pipeline_OC_LOOP {
		window_0_load_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_1_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_1_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_1_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_2_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_2_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_2_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_3_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_3_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_3_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_4_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_4_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_4_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_5_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_5_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_5_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_6_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_6_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_6_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_7_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_7_cast {Type I LastRead 0 FirstWrite -1}
		window_2_0_load_7_cast {Type I LastRead 0 FirstWrite -1}
		window_0_load_8_cast {Type I LastRead 0 FirstWrite -1}
		window_1_0_load_8_cast {Type I LastRead 0 FirstWrite -1}
		zext_ln69 {Type I LastRead 0 FirstWrite -1}
		out_r {Type O LastRead -1 FirstWrite 14}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_0 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_1 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_2 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_3 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_4 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_5 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_6 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_7 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_8 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_9 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_10 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_11 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_12 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_13 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_14 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_15 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_16 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_17 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_18 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_19 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_20 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_21 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_22 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_23 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_24 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_25 {Type I LastRead -1 FirstWrite -1}
		p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_26 {Type I LastRead -1 FirstWrite -1}
		predecoder_weights_LAYER0_BIAS {Type I LastRead -1 FirstWrite -1}
		layer0_mult {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "27", "Max" : "27"}
	, {"Name" : "Interval", "Min" : "27", "Max" : "27"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	window_0_load_cast { ap_none {  { window_0_load_cast in_data 0 8 } } }
	window_1_0_load_cast { ap_none {  { window_1_0_load_cast in_data 0 8 } } }
	window_2_0_load_cast { ap_none {  { window_2_0_load_cast in_data 0 8 } } }
	window_0_load_1_cast { ap_none {  { window_0_load_1_cast in_data 0 8 } } }
	window_1_0_load_1_cast { ap_none {  { window_1_0_load_1_cast in_data 0 8 } } }
	window_2_0_load_1_cast { ap_none {  { window_2_0_load_1_cast in_data 0 8 } } }
	window_0_load_2_cast { ap_none {  { window_0_load_2_cast in_data 0 8 } } }
	window_1_0_load_2_cast { ap_none {  { window_1_0_load_2_cast in_data 0 8 } } }
	window_2_0_load_2_cast { ap_none {  { window_2_0_load_2_cast in_data 0 8 } } }
	window_0_load_3_cast { ap_none {  { window_0_load_3_cast in_data 0 8 } } }
	window_1_0_load_3_cast { ap_none {  { window_1_0_load_3_cast in_data 0 8 } } }
	window_2_0_load_3_cast { ap_none {  { window_2_0_load_3_cast in_data 0 8 } } }
	window_0_load_4_cast { ap_none {  { window_0_load_4_cast in_data 0 8 } } }
	window_1_0_load_4_cast { ap_none {  { window_1_0_load_4_cast in_data 0 8 } } }
	window_2_0_load_4_cast { ap_none {  { window_2_0_load_4_cast in_data 0 8 } } }
	window_0_load_5_cast { ap_none {  { window_0_load_5_cast in_data 0 8 } } }
	window_1_0_load_5_cast { ap_none {  { window_1_0_load_5_cast in_data 0 8 } } }
	window_2_0_load_5_cast { ap_none {  { window_2_0_load_5_cast in_data 0 8 } } }
	window_0_load_6_cast { ap_none {  { window_0_load_6_cast in_data 0 8 } } }
	window_1_0_load_6_cast { ap_none {  { window_1_0_load_6_cast in_data 0 8 } } }
	window_2_0_load_6_cast { ap_none {  { window_2_0_load_6_cast in_data 0 8 } } }
	window_0_load_7_cast { ap_none {  { window_0_load_7_cast in_data 0 8 } } }
	window_1_0_load_7_cast { ap_none {  { window_1_0_load_7_cast in_data 0 8 } } }
	window_2_0_load_7_cast { ap_none {  { window_2_0_load_7_cast in_data 0 8 } } }
	window_0_load_8_cast { ap_none {  { window_0_load_8_cast in_data 0 8 } } }
	window_1_0_load_8_cast { ap_none {  { window_1_0_load_8_cast in_data 0 8 } } }
	zext_ln69 { ap_none {  { zext_ln69 in_data 0 8 } } }
	out_r { ap_memory {  { out_r_address0 mem_address 1 4 }  { out_r_ce0 mem_ce 1 1 }  { out_r_we0 mem_we 1 1 }  { out_r_d0 mem_din 1 8 } } }
}
