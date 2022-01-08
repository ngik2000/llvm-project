; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @add(i32* nocapture readonly %a, i32* nocapture readonly %b, i32* nocapture %c) local_unnamed_addr #0 !dbg !8 {
entry:
  %scevgep = getelementptr i32, i32* %c, i64 999, !dbg !10
  %scevgep14 = getelementptr i32, i32* %a, i64 999, !dbg !10
  %scevgep17 = getelementptr i32, i32* %b, i64 999, !dbg !10
  %bound0 = icmp ugt i32* %scevgep14, %c, !dbg !10
  %bound1 = icmp ugt i32* %scevgep, %a, !dbg !10
  %found.conflict = and i1 %bound0, %bound1, !dbg !10
  %bound019 = icmp ugt i32* %scevgep17, %c, !dbg !10
  %bound120 = icmp ugt i32* %scevgep, %b, !dbg !10
  %found.conflict21 = and i1 %bound019, %bound120, !dbg !10
  %conflict.rdx = or i1 %found.conflict, %found.conflict21, !dbg !10
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.body, !dbg !10

for.body.preheader:                               ; preds = %vector.body, %entry
  %indvars.iv.ph = phi i64 [ 0, %entry ], [ 896, %vector.body ]
  br label %for.body, !dbg !10

vector.body:                                      ; preds = %entry, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %entry ], !dbg !11
  %0 = getelementptr inbounds i32, i32* %a, i64 %index, !dbg !11
  %1 = bitcast i32* %0 to <128 x i32>*, !dbg !12
  %wide.load = load <128 x i32>, <128 x i32>* %1, align 4, !dbg !12, !tbaa !13, !alias.scope !17
  %2 = getelementptr inbounds i32, i32* %b, i64 %index, !dbg !11
  %3 = bitcast i32* %2 to <128 x i32>*, !dbg !20
  %wide.load22 = load <128 x i32>, <128 x i32>* %3, align 4, !dbg !20, !tbaa !13, !alias.scope !21
  %4 = add nsw <128 x i32> %wide.load22, %wide.load, !dbg !23
  %5 = getelementptr inbounds i32, i32* %c, i64 %index, !dbg !11
  %6 = bitcast i32* %5 to <128 x i32>*, !dbg !24
  store <128 x i32> %4, <128 x i32>* %6, align 4, !dbg !24, !tbaa !13, !alias.scope !25, !noalias !27
  %index.next = add nuw i64 %index, 128, !dbg !11
  %7 = icmp eq i64 %index.next, 896, !dbg !11
  br i1 %7, label %for.body.preheader, label %vector.body, !dbg !11, !llvm.loop !28

for.cond.cleanup:                                 ; preds = %for.body
  ret void, !dbg !32

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv, !dbg !12
  %8 = load i32, i32* %arrayidx, align 4, !dbg !12, !tbaa !13
  %arrayidx2 = getelementptr inbounds i32, i32* %b, i64 %indvars.iv, !dbg !20
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !20, !tbaa !13
  %add = add nsw i32 %9, %8, !dbg !23
  %arrayidx4 = getelementptr inbounds i32, i32* %c, i64 %indvars.iv, !dbg !33
  store i32 %add, i32* %arrayidx4, align 4, !dbg !24, !tbaa !13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !11
  %exitcond.not = icmp eq i64 %indvars.iv.next, 999, !dbg !34
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !10, !llvm.loop !35
}

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,-save-restore" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (git@github.com:ngik2000/llvm-project.git c04ce614e1fb23da8fdcd8238a57c86c9ee44ed2)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/t2000/llvm-project/test")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"target-abi", !"lp64"}
!6 = !{i32 1, !"SmallDataLimit", i32 8}
!7 = !{!"clang version 13.0.0 (git@github.com:ngik2000/llvm-project.git c04ce614e1fb23da8fdcd8238a57c86c9ee44ed2)"}
!8 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 5, column: 2, scope: !8)
!11 = !DILocation(line: 5, column: 20, scope: !8)
!12 = !DILocation(line: 7, column: 10, scope: !8)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !DILocation(line: 7, column: 17, scope: !8)
!21 = !{!22}
!22 = distinct !{!22, !19}
!23 = !DILocation(line: 7, column: 15, scope: !8)
!24 = !DILocation(line: 7, column: 8, scope: !8)
!25 = !{!26}
!26 = distinct !{!26, !19}
!27 = !{!18, !22}
!28 = distinct !{!28, !10, !29, !30, !31}
!29 = !DILocation(line: 8, column: 2, scope: !8)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !{!"llvm.loop.isvectorized", i32 1}
!32 = !DILocation(line: 9, column: 1, scope: !8)
!33 = !DILocation(line: 7, column: 3, scope: !8)
!34 = !DILocation(line: 5, column: 16, scope: !8)
!35 = distinct !{!35, !10, !29, !30, !31}
