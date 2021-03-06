; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple riscv64 -mattr=+m,+experimental-v < %s \
; RUN:    | FileCheck %s -check-prefix=RV64
; RUN: llc -mtriple riscv32 -mattr=+m,+experimental-v < %s \
; RUN:    | FileCheck %s -check-prefix=RV32


define i64 @vscale_zero() nounwind {
; RV64-LABEL: vscale_zero:
; RV64:       # %bb.0: # %entry
; RV64-NEXT:    mv a0, zero
; RV64-NEXT:    ret
;
; RV32-LABEL: vscale_zero:
; RV32:       # %bb.0: # %entry
; RV32-NEXT:    mv a0, zero
; RV32-NEXT:    mv a1, zero
; RV32-NEXT:    ret
entry:
  %0 = call i64 @llvm.vscale.i64()
  %1 = mul i64 %0, 0
  ret i64 %1
}

define i64 @vscale_one() nounwind {
; RV64-LABEL: vscale_one:
; RV64:       # %bb.0: # %entry
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    srli a0, a0, 3
; RV64-NEXT:    ret
;
; RV32-LABEL: vscale_one:
; RV32:       # %bb.0: # %entry
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    srli a0, a0, 3
; RV32-NEXT:    mv a1, zero
; RV32-NEXT:    ret
entry:
  %0 = call i64 @llvm.vscale.i64()
  %1 = mul i64 %0, 1
  ret i64 %1
}

define i64 @vscale_uimmpow2xlen() nounwind {
; RV64-LABEL: vscale_uimmpow2xlen:
; RV64:       # %bb.0: # %entry
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    slli a0, a0, 3
; RV64-NEXT:    ret
;
; RV32-LABEL: vscale_uimmpow2xlen:
; RV32:       # %bb.0: # %entry
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    slli a0, a0, 3
; RV32-NEXT:    mv a1, zero
; RV32-NEXT:    ret
entry:
  %0 = call i64 @llvm.vscale.i64()
  %1 = mul i64 %0, 64
  ret i64 %1
}

define i64 @vscale_non_pow2() nounwind {
; RV64-LABEL: vscale_non_pow2:
; RV64:       # %bb.0: # %entry
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    slli a1, a0, 1
; RV64-NEXT:    add a0, a1, a0
; RV64-NEXT:    ret
;
; RV32-LABEL: vscale_non_pow2:
; RV32:       # %bb.0: # %entry
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    slli a1, a0, 1
; RV32-NEXT:    add a0, a1, a0
; RV32-NEXT:    mv a1, zero
; RV32-NEXT:    ret
entry:
  %0 = call i64 @llvm.vscale.i64()
  %1 = mul i64 %0, 24
  ret i64 %1
}

; vscale will always be a positive number, but we don't know that until after op
; legalization. The and will be considered a NOP and replaced with its input,
; but not until after the select becomes RISCVISD::SELECT_CC. Make sure we
; simplify this and don't leave behind any code for calculating the select
; condition.
define i64 @vscale_select(i32 %x, i32 %y) {
; RV64-LABEL: vscale_select:
; RV64:       # %bb.0:
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    srli a0, a0, 3
; RV64-NEXT:    ret
;
; RV32-LABEL: vscale_select:
; RV32:       # %bb.0:
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    srli a0, a0, 3
; RV32-NEXT:    mv a1, zero
; RV32-NEXT:    ret
  %a = call i64 @llvm.vscale.i64()
  %b = and i64 %a, 4294967295
  %c = icmp eq i32 %x, %y
  %d = select i1 %c, i64 %a, i64 %b
  ret i64 %d
}

declare i64 @llvm.vscale.i64()
