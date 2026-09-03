set moduleName conv3d_hidden_layer_1_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {conv3d_hidden_layer<1>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s0 int 96 regular {fifo 0 volatile }  }
	{ s1 int 96 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s0", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "s1", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ s0_dout sc_in sc_lv 96 signal 0 } 
	{ s0_num_data_valid sc_in sc_lv 4 signal 0 } 
	{ s0_fifo_cap sc_in sc_lv 4 signal 0 } 
	{ s0_empty_n sc_in sc_logic 1 signal 0 } 
	{ s0_read sc_out sc_logic 1 signal 0 } 
	{ s1_din sc_out sc_lv 96 signal 1 } 
	{ s1_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ s1_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ s1_full_n sc_in sc_logic 1 signal 1 } 
	{ s1_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "s0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "s0", "role": "dout" }} , 
 	{ "name": "s0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s0", "role": "num_data_valid" }} , 
 	{ "name": "s0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s0", "role": "fifo_cap" }} , 
 	{ "name": "s0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "empty_n" }} , 
 	{ "name": "s0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "read" }} , 
 	{ "name": "s1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "s1", "role": "din" }} , 
 	{ "name": "s1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s1", "role": "num_data_valid" }} , 
 	{ "name": "s1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s1", "role": "fifo_cap" }} , 
 	{ "name": "s1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s1", "role": "full_n" }} , 
 	{ "name": "s1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s1", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "25", "27", "42"],
		"CDFG" : "conv3d_hidden_layer_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "133", "EstimateLatencyMax" : "23086",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2_fu_627", "Port" : "s0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_0", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_1", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_2", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_3", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_4", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_5", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_6", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_7", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_8", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_9", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_10", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_11", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_12", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_13", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_14", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_15", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_16", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_17", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_18", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_19", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_20", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_21", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_22", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_23", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_24", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_25", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_26", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "predecoder_weights_LAYER0_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "predecoder_weights_LAYER0_BIAS", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "layer0_mult", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Port" : "layer0_mult", "Inst_start_state" : "13", "Inst_end_state" : "14"}]}],
		"Loop" : [
			{"Name" : "CONV_EMIT_VITIS_LOOP_63_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "21", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_T", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "21", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_16_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fb_0_17_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.window_0_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.window_0_1_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.window_0_2_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2_fu_587", "Parent" : "0", "Child" : ["24"],
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
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2_fu_587.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2_fu_627", "Parent" : "0", "Child" : ["26"],
		"CDFG" : "conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "38", "EstimateLatencyMax" : "38",
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
			{"Name" : "fb_0_17", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_46_1_VITIS_LOOP_47_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2_fu_627.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652", "Parent" : "0", "Child" : ["28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"],
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
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.urem_32s_3ns_2_36_1_U45", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_11_3_8_1_1_U46", "Parent" : "27"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_11_3_8_1_1_U47", "Parent" : "27"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_11_3_8_1_1_U48", "Parent" : "27"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_7_2_8_1_1_U49", "Parent" : "27"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_13_3_8_1_1_U50", "Parent" : "27"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_13_3_8_1_1_U51", "Parent" : "27"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_13_3_8_1_1_U52", "Parent" : "27"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_7_2_8_1_1_U53", "Parent" : "27"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_11_3_8_1_1_U54", "Parent" : "27"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_11_3_8_1_1_U55", "Parent" : "27"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_11_3_8_1_1_U56", "Parent" : "27"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.sparsemux_7_2_8_1_1_U57", "Parent" : "27"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682", "Parent" : "0", "Child" : ["43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"],
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
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_0_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_1_U", "Parent" : "42"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_2_U", "Parent" : "42"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_3_U", "Parent" : "42"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_4_U", "Parent" : "42"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_5_U", "Parent" : "42"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_6_U", "Parent" : "42"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_7_U", "Parent" : "42"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_8_U", "Parent" : "42"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_9_U", "Parent" : "42"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_10_U", "Parent" : "42"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_11_U", "Parent" : "42"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_12_U", "Parent" : "42"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_13_U", "Parent" : "42"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_14_U", "Parent" : "42"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_15_U", "Parent" : "42"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_16_U", "Parent" : "42"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_17_U", "Parent" : "42"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_18_U", "Parent" : "42"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_19_U", "Parent" : "42"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_20_U", "Parent" : "42"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_21_U", "Parent" : "42"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_22_U", "Parent" : "42"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_23_U", "Parent" : "42"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_24_U", "Parent" : "42"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_25_U", "Parent" : "42"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.p_ZN18predecoder_weightsL13LAYER0_WEIGHTE_26_U", "Parent" : "42"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.predecoder_weights_LAYER0_BIAS_U", "Parent" : "42"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.layer0_mult_U", "Parent" : "42"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_76ns_57ns_132_5_1_U89", "Parent" : "42"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U90", "Parent" : "42"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U91", "Parent" : "42"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U92", "Parent" : "42"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U93", "Parent" : "42"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U94", "Parent" : "42"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U95", "Parent" : "42"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U96", "Parent" : "42"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U97", "Parent" : "42"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U98", "Parent" : "42"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mul_8s_8ns_16_1_1_U99", "Parent" : "42"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_16s_17_4_1_U100", "Parent" : "42"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8ns_6s_16s_17_4_1_U101", "Parent" : "42"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_16s_17_4_1_U102", "Parent" : "42"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8ns_7s_16s_17_4_1_U103", "Parent" : "42"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_17s_17_4_1_U104", "Parent" : "42"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8ns_7s_16s_17_4_1_U105", "Parent" : "42"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_16s_17_4_1_U106", "Parent" : "42"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_17s_17_4_1_U107", "Parent" : "42"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_16s_17_4_1_U108", "Parent" : "42"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_16s_17_4_1_U109", "Parent" : "42"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_17s_18_4_1_U110", "Parent" : "42"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_17s_18_4_1_U111", "Parent" : "42"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_17s_18_4_1_U112", "Parent" : "42"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8ns_7s_16s_17_4_1_U113", "Parent" : "42"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8ns_7s_9s_15_4_1_U114", "Parent" : "42"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_16s_17_4_1_U115", "Parent" : "42"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.mac_muladd_8s_8ns_20s_20_4_1_U116", "Parent" : "42"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682.flow_control_loop_pipe_sequential_init_U", "Parent" : "42"}]}


set ArgLastReadFirstWriteLatency {
	conv3d_hidden_layer_1_s {
		s0 {Type I LastRead 1 FirstWrite -1}
		s1 {Type O LastRead -1 FirstWrite 20}
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
		layer0_mult {Type I LastRead -1 FirstWrite -1}}
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
		fb_0_17 {Type O LastRead -1 FirstWrite 1}}
	conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2 {
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
		fb_0_17 {Type O LastRead -1 FirstWrite 1}
		s0 {Type I LastRead 1 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}}
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
		cmp9_i_i_2 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "133", "Max" : "23086"}
	, {"Name" : "Interval", "Min" : "133", "Max" : "23086"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s0 { ap_fifo {  { s0_dout fifo_data_in 0 96 }  { s0_num_data_valid fifo_status_num_data_valid 0 4 }  { s0_fifo_cap fifo_update 0 4 }  { s0_empty_n fifo_status 0 1 }  { s0_read fifo_port_we 1 1 } } }
	s1 { ap_fifo {  { s1_din fifo_data_in 1 96 }  { s1_num_data_valid fifo_status_num_data_valid 0 4 }  { s1_fifo_cap fifo_update 0 4 }  { s1_full_n fifo_status 0 1 }  { s1_write fifo_port_we 1 1 } } }
}
