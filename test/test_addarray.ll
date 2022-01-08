; ModuleID = 'test_addarray.c'
source_filename = "test_addarray.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @add(i32* nocapture readonly %a, i32* nocapture readonly %b, i32* nocapture %c) local_unnamed_addr #0 !dbg !8 {
entry:
  %scevgep = getelementptr i32, i32* %c, i32 999, !dbg !10
  %scevgep12 = getelementptr i32, i32* %a, i32 999, !dbg !10
  %scevgep15 = getelementptr i32, i32* %b, i32 999, !dbg !10
  %bound0 = icmp ugt i32* %scevgep12, %c, !dbg !10
  %bound1 = icmp ugt i32* %scevgep, %a, !dbg !10
  %found.conflict = and i1 %bound0, %bound1, !dbg !10
  %bound017 = icmp ugt i32* %scevgep15, %c, !dbg !10
  %bound118 = icmp ugt i32* %scevgep, %b, !dbg !10
  %found.conflict19 = and i1 %bound017, %bound118, !dbg !10
  %conflict.rdx = or i1 %found.conflict, %found.conflict19, !dbg !10
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.body, !dbg !10

for.body.preheader:                               ; preds = %vector.body, %entry
  %i.08.ph = phi i32 [ 0, %entry ], [ 996, %vector.body ]
  br label %for.body, !dbg !10

vector.body:                                      ; preds = %entry, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %entry ], !dbg !11
  %0 = getelementptr inbounds i32, i32* %a, i32 %index, !dbg !11
  %1 = bitcast i32* %0 to <4 x i32>*, !dbg !12
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !dbg !12, !tbaa !13, !alias.scope !17
  %2 = getelementptr inbounds i32, i32* %b, i32 %index, !dbg !11
  %3 = bitcast i32* %2 to <4 x i32>*, !dbg !20
  %wide.load20 = load <4 x i32>, <4 x i32>* %3, align 4, !dbg !20, !tbaa !13, !alias.scope !21
  %4 = add nsw <4 x i32> %wide.load20, %wide.load, !dbg !23
  %5 = getelementptr inbounds i32, i32* %c, i32 %index, !dbg !11
  %6 = bitcast i32* %5 to <4 x i32>*, !dbg !24
  store <4 x i32> %4, <4 x i32>* %6, align 4, !dbg !24, !tbaa !13, !alias.scope !25, !noalias !27
  %index.next = add nuw i32 %index, 4, !dbg !11
  %7 = icmp eq i32 %index.next, 996, !dbg !11
  br i1 %7, label %for.body.preheader, label %vector.body, !dbg !11, !llvm.loop !28

for.cond.cleanup:                                 ; preds = %for.body
  ret void, !dbg !32

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.08 = phi i32 [ %inc, %for.body ], [ %i.08.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i32 %i.08, !dbg !12
  %8 = load i32, i32* %arrayidx, align 4, !dbg !12, !tbaa !13
  %arrayidx1 = getelementptr inbounds i32, i32* %b, i32 %i.08, !dbg !20
  %9 = load i32, i32* %arrayidx1, align 4, !dbg !20, !tbaa !13
  %add = add nsw i32 %9, %8, !dbg !23
  %arrayidx2 = getelementptr inbounds i32, i32* %c, i32 %i.08, !dbg !33
  store i32 %add, i32* %arrayidx2, align 4, !dbg !24, !tbaa !13
  %inc = add nuw nsw i32 %i.08, 1, !dbg !11
  %exitcond.not = icmp eq i32 %inc, 999, !dbg !34
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !10, !llvm.loop !35
}

; Function Attrs: nofree nosync nounwind readnone
define dso_local i32 @main() local_unnamed_addr #1 !dbg !36 {
entry:
  ret i32 0, !dbg !37
}

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+relax,-save-restore" }
attributes #1 = { nofree nosync nounwind readnone "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+relax,-save-restore" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (git@github.com:ngik2000/llvm-project.git c04ce614e1fb23da8fdcd8238a57c86c9ee44ed2)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test_addarray.c", directory: "/home/t2000/llvm-project/test")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"target-abi", !"ilp32"}
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
!36 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !9, scopeLine: 11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 22, column: 2, scope: !36)
