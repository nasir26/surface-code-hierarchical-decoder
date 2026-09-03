// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xpredecoder_kernel.h"

extern XPredecoder_kernel_Config XPredecoder_kernel_ConfigTable[];

#ifdef SDT
XPredecoder_kernel_Config *XPredecoder_kernel_LookupConfig(UINTPTR BaseAddress) {
	XPredecoder_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XPredecoder_kernel_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XPredecoder_kernel_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XPredecoder_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPredecoder_kernel_Initialize(XPredecoder_kernel *InstancePtr, UINTPTR BaseAddress) {
	XPredecoder_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPredecoder_kernel_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPredecoder_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XPredecoder_kernel_Config *XPredecoder_kernel_LookupConfig(u16 DeviceId) {
	XPredecoder_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPREDECODER_KERNEL_NUM_INSTANCES; Index++) {
		if (XPredecoder_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPredecoder_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPredecoder_kernel_Initialize(XPredecoder_kernel *InstancePtr, u16 DeviceId) {
	XPredecoder_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPredecoder_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPredecoder_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

