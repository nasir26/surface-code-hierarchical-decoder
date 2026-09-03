set ModuleHierarchy {[{
"Name" : "predecoder_kernel","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "entry_proc_U0","ID" : "1","Type" : "sequential"},
	{"Name" : "in_beat_channel_U","ID" : "2","Type" : "sequential"},
	{"Name" : "unpack_input_U0","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "UNPACK_VITIS_LOOP_19_1_VITIS_LOOP_20_2","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "conv3d_hidden_layer_1_U0","ID" : "5","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_conv3d_hidden_layer_1_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2_fu_587","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2","ID" : "7","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "CONV_T","ID" : "8","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2_fu_627","ID" : "9","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_46_1_VITIS_LOOP_47_2","ID" : "10","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "CONV_EMIT_VITIS_LOOP_63_4","ID" : "11","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_conv3d_hidden_layer_1_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_652","ID" : "12","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_89_1_VITIS_LOOP_90_2","ID" : "13","Type" : "pipeline"},]},
			{"Name" : "grp_conv3d_hidden_layer_1_Pipeline_OC_LOOP_fu_682","ID" : "14","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "OC_LOOP","ID" : "15","Type" : "pipeline"},]},]},]},]},
	{"Name" : "conv3d_hidden_layer_12_U0","ID" : "16","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_conv3d_hidden_layer_Pipeline_RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2_VITIS_LOOP_42_fu_3952","ID" : "17","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RESET_VITIS_LOOP_40_1_VITIS_LOOP_41_2_VITIS_LOOP_42_3","ID" : "18","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "CONV_T","ID" : "19","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_conv3d_hidden_layer_12_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_47_2_fu_4388","ID" : "20","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_46_1_VITIS_LOOP_47_2","ID" : "21","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "CONV_EMIT_VITIS_LOOP_63_4","ID" : "22","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_conv3d_hidden_layer_12_Pipeline_VITIS_LOOP_89_1_VITIS_LOOP_90_2_fu_4611","ID" : "23","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_89_1_VITIS_LOOP_90_2","ID" : "24","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "OC_LOOP","ID" : "25","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_conv3d_hidden_layer_12_Pipeline_IC_LOOP_fu_5484","ID" : "26","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "IC_LOOP","ID" : "27","Type" : "pipeline"},]},
				{"Name" : "grp_conv3d_hidden_layer_12_Pipeline_SUM_PARTIAL_VITIS_LOOP_109_9_fu_5894","ID" : "28","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "SUM_PARTIAL_VITIS_LOOP_109_9","ID" : "29","Type" : "pipeline"},]},]},]},]},]},
	{"Name" : "conv1x1_output_layer_U0","ID" : "30","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "OUT_LOOP","ID" : "31","Type" : "pipeline"},]},
	{"Name" : "out_beat_U","ID" : "32","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_edge_correction_Pipeline_INIT_VITIS_LOOP_167_1_VITIS_LOOP_168_2_fu_354","ID" : "33","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "INIT_VITIS_LOOP_167_1_VITIS_LOOP_168_2","ID" : "34","Type" : "pipeline"},]},
		{"Name" : "grp_edge_correction_Pipeline_EC_LOOP_VITIS_LOOP_174_3_VITIS_LOOP_175_4_fu_502","ID" : "35","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "EC_LOOP_VITIS_LOOP_174_3_VITIS_LOOP_175_4","ID" : "36","Type" : "pipeline"},]},
		{"Name" : "grp_edge_correction_Pipeline_VITIS_LOOP_213_5_VITIS_LOOP_214_6_VITIS_LOOP_215_7_fu_613","ID" : "37","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_213_5_VITIS_LOOP_214_6_VITIS_LOOP_215_7","ID" : "38","Type" : "pipeline"},]},]},
	{"Name" : "Block_entry17_proc_U0","ID" : "39","Type" : "sequential"},]
}]}