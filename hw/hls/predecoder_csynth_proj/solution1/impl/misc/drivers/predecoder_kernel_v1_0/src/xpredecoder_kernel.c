// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xpredecoder_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPredecoder_kernel_CfgInitialize(XPredecoder_kernel *InstancePtr, XPredecoder_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPredecoder_kernel_Start(XPredecoder_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XPredecoder_kernel_IsDone(XPredecoder_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XPredecoder_kernel_IsIdle(XPredecoder_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XPredecoder_kernel_IsReady(XPredecoder_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XPredecoder_kernel_Continue(XPredecoder_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XPredecoder_kernel_EnableAutoRestart(XPredecoder_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XPredecoder_kernel_DisableAutoRestart(XPredecoder_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XPredecoder_kernel_Set_syndrome_hbm(XPredecoder_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_SYNDROME_HBM_DATA, (u32)(Data));
    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_SYNDROME_HBM_DATA + 4, (u32)(Data >> 32));
}

u64 XPredecoder_kernel_Get_syndrome_hbm(XPredecoder_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_SYNDROME_HBM_DATA);
    Data += (u64)XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_SYNDROME_HBM_DATA + 4) << 32;
    return Data;
}

void XPredecoder_kernel_Set_correction_hbm(XPredecoder_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_CORRECTION_HBM_DATA, (u32)(Data));
    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_CORRECTION_HBM_DATA + 4, (u32)(Data >> 32));
}

u64 XPredecoder_kernel_Get_correction_hbm(XPredecoder_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_CORRECTION_HBM_DATA);
    Data += (u64)XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_CORRECTION_HBM_DATA + 4) << 32;
    return Data;
}

void XPredecoder_kernel_InterruptGlobalEnable(XPredecoder_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XPredecoder_kernel_InterruptGlobalDisable(XPredecoder_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XPredecoder_kernel_InterruptEnable(XPredecoder_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_IER);
    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XPredecoder_kernel_InterruptDisable(XPredecoder_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_IER);
    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XPredecoder_kernel_InterruptClear(XPredecoder_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredecoder_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XPredecoder_kernel_InterruptGetEnabled(XPredecoder_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_IER);
}

u32 XPredecoder_kernel_InterruptGetStatus(XPredecoder_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPredecoder_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPREDECODER_KERNEL_CONTROL_ADDR_ISR);
}

