// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XPREDECODER_KERNEL_H
#define XPREDECODER_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpredecoder_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XPredecoder_kernel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XPredecoder_kernel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPredecoder_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPredecoder_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPredecoder_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPredecoder_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XPredecoder_kernel_Initialize(XPredecoder_kernel *InstancePtr, UINTPTR BaseAddress);
XPredecoder_kernel_Config* XPredecoder_kernel_LookupConfig(UINTPTR BaseAddress);
#else
int XPredecoder_kernel_Initialize(XPredecoder_kernel *InstancePtr, u16 DeviceId);
XPredecoder_kernel_Config* XPredecoder_kernel_LookupConfig(u16 DeviceId);
#endif
int XPredecoder_kernel_CfgInitialize(XPredecoder_kernel *InstancePtr, XPredecoder_kernel_Config *ConfigPtr);
#else
int XPredecoder_kernel_Initialize(XPredecoder_kernel *InstancePtr, const char* InstanceName);
int XPredecoder_kernel_Release(XPredecoder_kernel *InstancePtr);
#endif

void XPredecoder_kernel_Start(XPredecoder_kernel *InstancePtr);
u32 XPredecoder_kernel_IsDone(XPredecoder_kernel *InstancePtr);
u32 XPredecoder_kernel_IsIdle(XPredecoder_kernel *InstancePtr);
u32 XPredecoder_kernel_IsReady(XPredecoder_kernel *InstancePtr);
void XPredecoder_kernel_Continue(XPredecoder_kernel *InstancePtr);
void XPredecoder_kernel_EnableAutoRestart(XPredecoder_kernel *InstancePtr);
void XPredecoder_kernel_DisableAutoRestart(XPredecoder_kernel *InstancePtr);

void XPredecoder_kernel_Set_syndrome_hbm(XPredecoder_kernel *InstancePtr, u64 Data);
u64 XPredecoder_kernel_Get_syndrome_hbm(XPredecoder_kernel *InstancePtr);
void XPredecoder_kernel_Set_correction_hbm(XPredecoder_kernel *InstancePtr, u64 Data);
u64 XPredecoder_kernel_Get_correction_hbm(XPredecoder_kernel *InstancePtr);

void XPredecoder_kernel_InterruptGlobalEnable(XPredecoder_kernel *InstancePtr);
void XPredecoder_kernel_InterruptGlobalDisable(XPredecoder_kernel *InstancePtr);
void XPredecoder_kernel_InterruptEnable(XPredecoder_kernel *InstancePtr, u32 Mask);
void XPredecoder_kernel_InterruptDisable(XPredecoder_kernel *InstancePtr, u32 Mask);
void XPredecoder_kernel_InterruptClear(XPredecoder_kernel *InstancePtr, u32 Mask);
u32 XPredecoder_kernel_InterruptGetEnabled(XPredecoder_kernel *InstancePtr);
u32 XPredecoder_kernel_InterruptGetStatus(XPredecoder_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
