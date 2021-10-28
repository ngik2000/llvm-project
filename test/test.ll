; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown-elf"

; Function Attrs: nofree nosync nounwind readnone
define dso_local signext i32 @main() local_unnamed_addr #0 !dbg !8 {
entry:
  %sum = alloca [100000 x i32], align 4
  %0 = bitcast [100000 x i32]* %sum to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 400000, i8* nonnull %0) #4, !dbg !10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(400000) %0, i8 0, i64 400000, i1 false), !dbg !11
  %1 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 1, !dbg !11
  store i32 2, i32* %1, align 4, !dbg !11
  %2 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 2, !dbg !11
  store i32 3, i32* %2, align 4, !dbg !11
  %3 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 3, !dbg !11
  store i32 4, i32* %3, align 4, !dbg !11
  br label %vector.body, !dbg !12

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.phi = phi <8 x i32> [ <i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, %entry ], [ %6, %vector.body ]
  %offset.idx = or i64 %index, 1
  %4 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 %offset.idx
  %5 = bitcast i32* %4 to <8 x i32>*, !dbg !13
  %wide.load = load <8 x i32>, <8 x i32>* %5, align 4, !dbg !13, !tbaa !14
  %6 = add <8 x i32> %wide.load, %vec.phi, !dbg !18
  %index.next = add nuw i64 %index, 8
  %7 = icmp eq i64 %index.next, 99992
  br i1 %7, label %for.body.for.body_crit_edge, label %vector.body, !llvm.loop !19

for.body.for.body_crit_edge:                      ; preds = %vector.body
  %8 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %6), !dbg !12
  %arrayidx.phi.trans.insert = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 99993
  %.pre = load i32, i32* %arrayidx.phi.trans.insert, align 4, !dbg !13, !tbaa !14
  %add = add nsw i32 %.pre, %8, !dbg !18
  %arrayidx.phi.trans.insert.1 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 99994
  %.pre.1 = load i32, i32* %arrayidx.phi.trans.insert.1, align 4, !dbg !13, !tbaa !14
  %add.1 = add nsw i32 %.pre.1, %add, !dbg !18
  %arrayidx.phi.trans.insert.2 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 99995
  %.pre.2 = load i32, i32* %arrayidx.phi.trans.insert.2, align 4, !dbg !13, !tbaa !14
  %add.2 = add nsw i32 %.pre.2, %add.1, !dbg !18
  %arrayidx.phi.trans.insert.3 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 99996
  %.pre.3 = load i32, i32* %arrayidx.phi.trans.insert.3, align 4, !dbg !13, !tbaa !14
  %add.3 = add nsw i32 %.pre.3, %add.2, !dbg !18
  %arrayidx.phi.trans.insert.4 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 99997
  %.pre.4 = load i32, i32* %arrayidx.phi.trans.insert.4, align 4, !dbg !13, !tbaa !14
  %add.4 = add nsw i32 %.pre.4, %add.3, !dbg !18
  %arrayidx.phi.trans.insert.5 = getelementptr inbounds [100000 x i32], [100000 x i32]* %sum, i64 0, i64 99998
  %.pre.5 = load i32, i32* %arrayidx.phi.trans.insert.5, align 4, !dbg !13, !tbaa !14
  %add.5 = add nsw i32 %.pre.5, %add.4, !dbg !18
  call void @llvm.lifetime.end.p0i8(i64 400000, i8* nonnull %0) #4, !dbg !23
  ret i32 %add.5, !dbg !24
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #3

attributes #0 = { nofree nosync nounwind readnone "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,-save-restore" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree nosync nounwind readnone willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/ngik2000/llvm-project d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/t2000/llvm-project/test")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"target-abi", !"lp64"}
!6 = !{i32 1, !"SmallDataLimit", i32 8}
!7 = !{!"clang version 13.0.0 (https://github.com/ngik2000/llvm-project d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !9, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 4, column: 2, scope: !8)
!11 = !DILocation(line: 4, column: 6, scope: !8)
!12 = !DILocation(line: 7, column: 2, scope: !8)
!13 = !DILocation(line: 9, column: 8, scope: !8)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 9, column: 6, scope: !8)
!19 = distinct !{!19, !12, !20, !21, !22}
!20 = !DILocation(line: 10, column: 2, scope: !8)
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!"llvm.loop.isvectorized", i32 1}
!23 = !DILocation(line: 14, column: 1, scope: !8)
!24 = !DILocation(line: 13, column: 2, scope: !8)
