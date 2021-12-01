; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @add(i32* nocapture readonly %a, i32* nocapture %b, i32* nocapture %c) local_unnamed_addr #0 !dbg !8 {
entry:
  %scevgep = getelementptr i32, i32* %c, i64 100000, !dbg !10
  %scevgep18 = getelementptr i32, i32* %b, i64 100000, !dbg !10
  %scevgep21 = getelementptr i32, i32* %a, i64 100000, !dbg !10
  %bound0 = icmp ugt i32* %scevgep18, %c, !dbg !10
  %bound1 = icmp ugt i32* %scevgep, %b, !dbg !10
  %found.conflict = and i1 %bound0, %bound1, !dbg !10
  %bound023 = icmp ugt i32* %scevgep21, %c, !dbg !10
  %bound124 = icmp ugt i32* %scevgep, %a, !dbg !10
  %found.conflict25 = and i1 %bound023, %bound124, !dbg !10
  %conflict.rdx = or i1 %found.conflict, %found.conflict25, !dbg !10
  %bound026 = icmp ugt i32* %scevgep21, %b, !dbg !10
  %bound127 = icmp ugt i32* %scevgep18, %a, !dbg !10
  %found.conflict28 = and i1 %bound026, %bound127, !dbg !10
  %conflict.rdx29 = or i1 %conflict.rdx, %found.conflict28, !dbg !10
  br i1 %conflict.rdx29, label %for.body.preheader, label %vector.body, !dbg !10

for.body.preheader:                               ; preds = %vector.body, %entry
  %indvars.iv.ph = phi i64 [ 0, %entry ], [ 99968, %vector.body ]
  br label %for.body, !dbg !10

vector.body:                                      ; preds = %entry, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %entry ], !dbg !11
  %0 = getelementptr inbounds i32, i32* %a, i64 %index, !dbg !11
  %1 = bitcast i32* %0 to <128 x i32>*, !dbg !12
  %wide.load = load <128 x i32>, <128 x i32>* %1, align 4, !dbg !12, !tbaa !13, !alias.scope !17
  %2 = add nsw <128 x i32> %wide.load, <i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9, i32 -9>, !dbg !20
  %3 = getelementptr inbounds i32, i32* %c, i64 %index, !dbg !11
  %4 = bitcast i32* %3 to <128 x i32>*, !dbg !21
  store <128 x i32> %2, <128 x i32>* %4, align 4, !dbg !21, !tbaa !13, !alias.scope !22, !noalias !24
  %5 = or <128 x i32> %wide.load, <i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9, i32 9>, !dbg !26
  %6 = getelementptr inbounds i32, i32* %b, i64 %index, !dbg !11
  %7 = bitcast i32* %6 to <128 x i32>*, !dbg !27
  store <128 x i32> %5, <128 x i32>* %7, align 4, !dbg !27, !tbaa !13, !alias.scope !28, !noalias !17
  %index.next = add nuw i64 %index, 128, !dbg !11
  %8 = icmp eq i64 %index.next, 99968, !dbg !11
  br i1 %8, label %for.body.preheader, label %vector.body, !dbg !11, !llvm.loop !29

for.cond.cleanup:                                 ; preds = %for.body
  ret void, !dbg !33

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv, !dbg !12
  %9 = load i32, i32* %arrayidx, align 4, !dbg !12, !tbaa !13
  %sub = add nsw i32 %9, -9, !dbg !20
  %arrayidx2 = getelementptr inbounds i32, i32* %c, i64 %indvars.iv, !dbg !34
  store i32 %sub, i32* %arrayidx2, align 4, !dbg !21, !tbaa !13
  %10 = load i32, i32* %arrayidx, align 4, !dbg !35, !tbaa !13
  %or = or i32 %10, 9, !dbg !26
  %arrayidx6 = getelementptr inbounds i32, i32* %b, i64 %indvars.iv, !dbg !36
  store i32 %or, i32* %arrayidx6, align 4, !dbg !27, !tbaa !13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !11
  %exitcond.not = icmp eq i64 %indvars.iv.next, 100000, !dbg !37
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !10, !llvm.loop !38
}

; Function Attrs: nofree nosync nounwind readnone
define dso_local signext i32 @main() local_unnamed_addr #1 !dbg !39 {
entry:
  ret i32 0, !dbg !40
}

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,-save-restore" }
attributes #1 = { nofree nosync nounwind readnone "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,-save-restore" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/ngik2000/llvm-project bc6a8e38f3c2d3df7c82431f238b21c52f22488e)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/t2000/llvm-project/test")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"target-abi", !"lp64"}
!6 = !{i32 1, !"SmallDataLimit", i32 8}
!7 = !{!"clang version 13.0.0 (https://github.com/ngik2000/llvm-project bc6a8e38f3c2d3df7c82431f238b21c52f22488e)"}
!8 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 5, column: 2, scope: !8)
!11 = !DILocation(line: 5, column: 25, scope: !8)
!12 = !DILocation(line: 7, column: 10, scope: !8)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !DILocation(line: 7, column: 15, scope: !8)
!21 = !DILocation(line: 7, column: 8, scope: !8)
!22 = !{!23}
!23 = distinct !{!23, !19}
!24 = !{!25, !18}
!25 = distinct !{!25, !19}
!26 = !DILocation(line: 8, column: 15, scope: !8)
!27 = !DILocation(line: 8, column: 8, scope: !8)
!28 = !{!25}
!29 = distinct !{!29, !10, !30, !31, !32}
!30 = !DILocation(line: 9, column: 2, scope: !8)
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!"llvm.loop.isvectorized", i32 1}
!33 = !DILocation(line: 10, column: 1, scope: !8)
!34 = !DILocation(line: 7, column: 3, scope: !8)
!35 = !DILocation(line: 8, column: 10, scope: !8)
!36 = !DILocation(line: 8, column: 3, scope: !8)
!37 = !DILocation(line: 5, column: 16, scope: !8)
!38 = distinct !{!38, !10, !30, !31, !32}
!39 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 23, column: 2, scope: !39)
