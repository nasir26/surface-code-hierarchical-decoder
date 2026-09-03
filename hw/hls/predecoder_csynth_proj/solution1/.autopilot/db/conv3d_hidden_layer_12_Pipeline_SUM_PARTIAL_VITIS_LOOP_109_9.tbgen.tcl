set moduleName conv3d_hidden_layer_12_Pipeline_SUM_PARTIAL_VITIS_LOOP_109_9
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
set C_modelName {conv3d_hidden_layer<12>_Pipeline_SUM_PARTIAL_VITIS_LOOP_109_9}
set C_modelType { void 0 }
set C_modelArgList {
	{ acc_cast int 14 regular  }
	{ conv3_i203_reload int 20 regular  }
	{ conv3_i_1116206_reload int 20 regular  }
	{ conv3_i_2131209_reload int 20 regular  }
	{ conv3_i_1212_reload int 20 regular  }
	{ conv3_i_1_1215_reload int 20 regular  }
	{ conv3_i_1_2218_reload int 20 regular  }
	{ conv3_i_2221_reload int 20 regular  }
	{ conv3_i_2_1224_reload int 20 regular  }
	{ conv3_i_2_2227_reload int 20 regular  }
	{ conv3_i_1148204_reload int 20 regular  }
	{ conv3_i_1116_1207_reload int 20 regular  }
	{ conv3_i_2131_1210_reload int 20 regular  }
	{ conv3_i_1_188213_reload int 20 regular  }
	{ conv3_i_1_1_1216_reload int 20 regular  }
	{ conv3_i_1_2_1219_reload int 20 regular  }
	{ conv3_i_2_162222_reload int 20 regular  }
	{ conv3_i_2_1_1225_reload int 20 regular  }
	{ conv3_i_2_2_1228_reload int 20 regular  }
	{ conv3_i_2161205_reload int 20 regular  }
	{ conv3_i_1116_2208_reload int 20 regular  }
	{ conv3_i_2131_2211_reload int 20 regular  }
	{ conv3_i_1_2101214_reload int 20 regular  }
	{ conv3_i_1_1_2217_reload int 20 regular  }
	{ conv3_i_1_2_2220_reload int 20 regular  }
	{ conv3_i_2_275223_reload int 20 regular  }
	{ conv3_i_2_1_2226_reload int 20 regular  }
	{ conv3_i_2_2_2229_reload int 20 regular  }
	{ acc_3_out int 25 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "acc_cast", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i203_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1116206_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2131209_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1212_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_1215_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_2218_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2221_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_1224_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_2227_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1148204_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1116_1207_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2131_1210_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_188213_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_1_1216_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_2_1219_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_162222_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_1_1225_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_2_1228_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2161205_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1116_2208_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2131_2211_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_2101214_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_1_2217_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_1_2_2220_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_275223_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_1_2226_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_2_2_2229_reload", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "acc_3_out", "interface" : "wire", "bitwidth" : 25, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ acc_cast sc_in sc_lv 14 signal 0 } 
	{ conv3_i203_reload sc_in sc_lv 20 signal 1 } 
	{ conv3_i_1116206_reload sc_in sc_lv 20 signal 2 } 
	{ conv3_i_2131209_reload sc_in sc_lv 20 signal 3 } 
	{ conv3_i_1212_reload sc_in sc_lv 20 signal 4 } 
	{ conv3_i_1_1215_reload sc_in sc_lv 20 signal 5 } 
	{ conv3_i_1_2218_reload sc_in sc_lv 20 signal 6 } 
	{ conv3_i_2221_reload sc_in sc_lv 20 signal 7 } 
	{ conv3_i_2_1224_reload sc_in sc_lv 20 signal 8 } 
	{ conv3_i_2_2227_reload sc_in sc_lv 20 signal 9 } 
	{ conv3_i_1148204_reload sc_in sc_lv 20 signal 10 } 
	{ conv3_i_1116_1207_reload sc_in sc_lv 20 signal 11 } 
	{ conv3_i_2131_1210_reload sc_in sc_lv 20 signal 12 } 
	{ conv3_i_1_188213_reload sc_in sc_lv 20 signal 13 } 
	{ conv3_i_1_1_1216_reload sc_in sc_lv 20 signal 14 } 
	{ conv3_i_1_2_1219_reload sc_in sc_lv 20 signal 15 } 
	{ conv3_i_2_162222_reload sc_in sc_lv 20 signal 16 } 
	{ conv3_i_2_1_1225_reload sc_in sc_lv 20 signal 17 } 
	{ conv3_i_2_2_1228_reload sc_in sc_lv 20 signal 18 } 
	{ conv3_i_2161205_reload sc_in sc_lv 20 signal 19 } 
	{ conv3_i_1116_2208_reload sc_in sc_lv 20 signal 20 } 
	{ conv3_i_2131_2211_reload sc_in sc_lv 20 signal 21 } 
	{ conv3_i_1_2101214_reload sc_in sc_lv 20 signal 22 } 
	{ conv3_i_1_1_2217_reload sc_in sc_lv 20 signal 23 } 
	{ conv3_i_1_2_2220_reload sc_in sc_lv 20 signal 24 } 
	{ conv3_i_2_275223_reload sc_in sc_lv 20 signal 25 } 
	{ conv3_i_2_1_2226_reload sc_in sc_lv 20 signal 26 } 
	{ conv3_i_2_2_2229_reload sc_in sc_lv 20 signal 27 } 
	{ acc_3_out sc_out sc_lv 25 signal 28 } 
	{ acc_3_out_ap_vld sc_out sc_logic 1 outvld 28 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "acc_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "acc_cast", "role": "default" }} , 
 	{ "name": "conv3_i203_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i203_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1116206_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1116206_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2131209_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2131209_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1212_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1212_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_1215_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_1215_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_2218_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_2218_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2221_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2221_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_1224_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_1224_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_2227_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_2227_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1148204_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1148204_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1116_1207_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1116_1207_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2131_1210_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2131_1210_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_188213_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_188213_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_1_1216_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_1_1216_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_2_1219_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_2_1219_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_162222_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_162222_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_1_1225_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_1_1225_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_2_1228_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_2_1228_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2161205_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2161205_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1116_2208_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1116_2208_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2131_2211_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2131_2211_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_2101214_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_2101214_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_1_2217_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_1_2217_reload", "role": "default" }} , 
 	{ "name": "conv3_i_1_2_2220_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_1_2_2220_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_275223_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_275223_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_1_2226_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_1_2226_reload", "role": "default" }} , 
 	{ "name": "conv3_i_2_2_2229_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "conv3_i_2_2_2229_reload", "role": "default" }} , 
 	{ "name": "acc_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":25, "type": "signal", "bundle":{"name": "acc_3_out", "role": "default" }} , 
 	{ "name": "acc_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_3_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"],
		"CDFG" : "conv3d_hidden_layer_12_Pipeline_SUM_PARTIAL_VITIS_LOOP_109_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "acc_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i203_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1116206_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2131209_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1212_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_1215_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_2218_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2221_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_1224_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_2227_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1148204_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1116_1207_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2131_1210_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_188213_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_1_1216_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_2_1219_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_162222_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_1_1225_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_2_1228_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2161205_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1116_2208_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2131_2211_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_2101214_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_1_2217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_1_2_2220_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_275223_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_1_2226_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_2_2_2229_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "acc_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "SUM_PARTIAL_VITIS_LOOP_109_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2071", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2072", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2073", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2074", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2075", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2076", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2077", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2078", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2079", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2080", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2081", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_20_1_1_U2082", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv3d_hidden_layer_12_Pipeline_SUM_PARTIAL_VITIS_LOOP_109_9 {
		acc_cast {Type I LastRead 0 FirstWrite -1}
		conv3_i203_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1116206_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2131209_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1212_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_1215_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_2218_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2221_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_1224_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_2227_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1148204_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1116_1207_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2131_1210_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_188213_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_1_1216_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_2_1219_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_162222_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_1_1225_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_2_1228_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2161205_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1116_2208_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2131_2211_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_2101214_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_1_2217_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_1_2_2220_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_275223_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_1_2226_reload {Type I LastRead 0 FirstWrite -1}
		conv3_i_2_2_2229_reload {Type I LastRead 0 FirstWrite -1}
		acc_3_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	acc_cast { ap_none {  { acc_cast in_data 0 14 } } }
	conv3_i203_reload { ap_none {  { conv3_i203_reload in_data 0 20 } } }
	conv3_i_1116206_reload { ap_none {  { conv3_i_1116206_reload in_data 0 20 } } }
	conv3_i_2131209_reload { ap_none {  { conv3_i_2131209_reload in_data 0 20 } } }
	conv3_i_1212_reload { ap_none {  { conv3_i_1212_reload in_data 0 20 } } }
	conv3_i_1_1215_reload { ap_none {  { conv3_i_1_1215_reload in_data 0 20 } } }
	conv3_i_1_2218_reload { ap_none {  { conv3_i_1_2218_reload in_data 0 20 } } }
	conv3_i_2221_reload { ap_none {  { conv3_i_2221_reload in_data 0 20 } } }
	conv3_i_2_1224_reload { ap_none {  { conv3_i_2_1224_reload in_data 0 20 } } }
	conv3_i_2_2227_reload { ap_none {  { conv3_i_2_2227_reload in_data 0 20 } } }
	conv3_i_1148204_reload { ap_none {  { conv3_i_1148204_reload in_data 0 20 } } }
	conv3_i_1116_1207_reload { ap_none {  { conv3_i_1116_1207_reload in_data 0 20 } } }
	conv3_i_2131_1210_reload { ap_none {  { conv3_i_2131_1210_reload in_data 0 20 } } }
	conv3_i_1_188213_reload { ap_none {  { conv3_i_1_188213_reload in_data 0 20 } } }
	conv3_i_1_1_1216_reload { ap_none {  { conv3_i_1_1_1216_reload in_data 0 20 } } }
	conv3_i_1_2_1219_reload { ap_none {  { conv3_i_1_2_1219_reload in_data 0 20 } } }
	conv3_i_2_162222_reload { ap_none {  { conv3_i_2_162222_reload in_data 0 20 } } }
	conv3_i_2_1_1225_reload { ap_none {  { conv3_i_2_1_1225_reload in_data 0 20 } } }
	conv3_i_2_2_1228_reload { ap_none {  { conv3_i_2_2_1228_reload in_data 0 20 } } }
	conv3_i_2161205_reload { ap_none {  { conv3_i_2161205_reload in_data 0 20 } } }
	conv3_i_1116_2208_reload { ap_none {  { conv3_i_1116_2208_reload in_data 0 20 } } }
	conv3_i_2131_2211_reload { ap_none {  { conv3_i_2131_2211_reload in_data 0 20 } } }
	conv3_i_1_2101214_reload { ap_none {  { conv3_i_1_2101214_reload in_data 0 20 } } }
	conv3_i_1_1_2217_reload { ap_none {  { conv3_i_1_1_2217_reload in_data 0 20 } } }
	conv3_i_1_2_2220_reload { ap_none {  { conv3_i_1_2_2220_reload in_data 0 20 } } }
	conv3_i_2_275223_reload { ap_none {  { conv3_i_2_275223_reload in_data 0 20 } } }
	conv3_i_2_1_2226_reload { ap_none {  { conv3_i_2_1_2226_reload in_data 0 20 } } }
	conv3_i_2_2_2229_reload { ap_none {  { conv3_i_2_2_2229_reload in_data 0 20 } } }
	acc_3_out { ap_vld {  { acc_3_out out_data 1 25 }  { acc_3_out_ap_vld out_vld 1 1 } } }
}
