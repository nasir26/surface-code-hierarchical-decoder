; ModuleID = '/home/cdac/Music/surface-code-hierarchical-decoder/hw/hls/predecoder_csynth_proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }

; Function Attrs: noinline
define void @apatb_predecoder_kernel_ir(%"struct.ap_uint<512>"* noalias nocapture nonnull readonly "maxi" %syndrome_hbm, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %correction_hbm) local_unnamed_addr #0 {
entry:
  %syndrome_hbm_copy = alloca [1 x i512], align 512
  %correction_hbm_copy = alloca [1 x i512], align 512
  %0 = bitcast %"struct.ap_uint<512>"* %syndrome_hbm to [1 x %"struct.ap_uint<512>"]*
  %1 = bitcast %"struct.ap_uint<512>"* %correction_hbm to [1 x %"struct.ap_uint<512>"]*
  call fastcc void @copy_in([1 x %"struct.ap_uint<512>"]* nonnull %0, [1 x i512]* nonnull align 512 %syndrome_hbm_copy, [1 x %"struct.ap_uint<512>"]* nonnull %1, [1 x i512]* nonnull align 512 %correction_hbm_copy)
  %2 = getelementptr [1 x i512], [1 x i512]* %syndrome_hbm_copy, i64 0, i64 0
  %3 = getelementptr [1 x i512], [1 x i512]* %correction_hbm_copy, i64 0, i64 0
  call void @apatb_predecoder_kernel_hw(i512* %2, i512* %3)
  call void @copy_back([1 x %"struct.ap_uint<512>"]* %0, [1 x i512]* %syndrome_hbm_copy, [1 x %"struct.ap_uint<512>"]* %1, [1 x i512]* %correction_hbm_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="0", [1 x i512]* noalias nocapture align 512 "unpacked"="1.0", [1 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="2", [1 x i512]* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>.46"([1 x i512]* align 512 %1, [1 x %"struct.ap_uint<512>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>.46"([1 x i512]* align 512 %3, [1 x %"struct.ap_uint<512>"]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a1struct.ap_uint<512>"([1 x %"struct.ap_uint<512>"]* %dst, [1 x %"struct.ap_uint<512>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x %"struct.ap_uint<512>"]* %src, null
  %1 = icmp eq [1 x %"struct.ap_uint<512>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [1 x %"struct.ap_uint<512>"], [1 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [1 x %"struct.ap_uint<512>"], [1 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %3, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([1 x %"struct.ap_uint<512>"]* noalias "unpacked"="0", [1 x i512]* noalias nocapture readonly align 512 "unpacked"="1.0", [1 x %"struct.ap_uint<512>"]* noalias "unpacked"="2", [1 x i512]* noalias nocapture readonly align 512 "unpacked"="3.0") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>"([1 x %"struct.ap_uint<512>"]* %0, [1 x i512]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>"([1 x %"struct.ap_uint<512>"]* %2, [1 x i512]* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>"([1 x %"struct.ap_uint<512>"]* noalias "unpacked"="0" %dst, [1 x i512]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq [1 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a1struct.ap_uint<512>.42"([1 x %"struct.ap_uint<512>"]* nonnull %dst, [1 x i512]* %src, i64 1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a1struct.ap_uint<512>.42"([1 x %"struct.ap_uint<512>"]* "unpacked"="0" %dst, [1 x i512]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [1 x i512], [1 x i512]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [1 x %"struct.ap_uint<512>"], [1 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>.46"([1 x i512]* noalias nocapture align 512 "unpacked"="0.0" %dst, [1 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq [1 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a1struct.ap_uint<512>.49"([1 x i512]* %dst, [1 x %"struct.ap_uint<512>"]* nonnull %src, i64 1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a1struct.ap_uint<512>.49"([1 x i512]* nocapture "unpacked"="0.0" %dst, [1 x %"struct.ap_uint<512>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [1 x %"struct.ap_uint<512>"], [1 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [1 x i512], [1 x i512]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_predecoder_kernel_hw(i512*, i512*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1 x %"struct.ap_uint<512>"]* noalias "unpacked"="0", [1 x i512]* noalias nocapture readonly align 512 "unpacked"="1.0", [1 x %"struct.ap_uint<512>"]* noalias "unpacked"="2", [1 x i512]* noalias nocapture readonly align 512 "unpacked"="3.0") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_uint<512>"([1 x %"struct.ap_uint<512>"]* %2, [1 x i512]* align 512 %3)
  ret void
}

define void @predecoder_kernel_hw_stub_wrapper(i512*, i512*) #5 {
entry:
  %2 = alloca [1 x %"struct.ap_uint<512>"]
  %3 = alloca [1 x %"struct.ap_uint<512>"]
  %4 = bitcast i512* %0 to [1 x i512]*
  %5 = bitcast i512* %1 to [1 x i512]*
  call void @copy_out([1 x %"struct.ap_uint<512>"]* %2, [1 x i512]* %4, [1 x %"struct.ap_uint<512>"]* %3, [1 x i512]* %5)
  %6 = bitcast [1 x %"struct.ap_uint<512>"]* %2 to %"struct.ap_uint<512>"*
  %7 = bitcast [1 x %"struct.ap_uint<512>"]* %3 to %"struct.ap_uint<512>"*
  call void @predecoder_kernel_hw_stub(%"struct.ap_uint<512>"* %6, %"struct.ap_uint<512>"* %7)
  call void @copy_in([1 x %"struct.ap_uint<512>"]* %2, [1 x i512]* %4, [1 x %"struct.ap_uint<512>"]* %3, [1 x i512]* %5)
  ret void
}

declare void @predecoder_kernel_hw_stub(%"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
