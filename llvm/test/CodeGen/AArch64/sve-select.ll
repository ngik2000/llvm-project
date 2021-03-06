; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve -verify-machineinstrs < %s | FileCheck %s

define <vscale x  16 x i8> @select_nxv16i8(i1 %cond, <vscale x  16 x i8> %a, <vscale x  16 x i8> %b) {
; CHECK-LABEL: select_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.b, xzr, x8
; CHECK-NEXT:    sel z0.b, p0, z0.b, z1.b
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  16 x i8> %a, <vscale x  16 x i8> %b
  ret <vscale x  16 x i8> %res
}

define <vscale x  8 x i16> @select_nxv8i16(i1 %cond, <vscale x  8 x i16> %a, <vscale x  8 x i16> %b) {
; CHECK-LABEL: select_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.h, xzr, x8
; CHECK-NEXT:    sel z0.h, p0, z0.h, z1.h
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  8 x i16> %a, <vscale x  8 x i16> %b
  ret <vscale x  8 x i16> %res
}

define <vscale x  4 x i32> @select_nxv4i32(i1 %cond, <vscale x  4 x i32> %a, <vscale x  4 x i32> %b) {
; CHECK-LABEL: select_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.s, xzr, x8
; CHECK-NEXT:    sel z0.s, p0, z0.s, z1.s
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  4 x i32> %a, <vscale x  4 x i32> %b
  ret <vscale x  4 x i32> %res
}

define <vscale x  2 x i64> @select_nxv2i64(i1 %cond, <vscale x  2 x i64> %a, <vscale x  2 x i64> %b) {
; CHECK-LABEL: select_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.d, xzr, x8
; CHECK-NEXT:    sel z0.d, p0, z0.d, z1.d
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  2 x i64> %a, <vscale x  2 x i64> %b
  ret <vscale x  2 x i64> %res
}

define <vscale x  8 x half> @select_nxv8f16(i1 %cond, <vscale x  8 x half> %a, <vscale x  8 x half> %b) {
; CHECK-LABEL: select_nxv8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.h, xzr, x8
; CHECK-NEXT:    sel z0.h, p0, z0.h, z1.h
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  8 x half> %a, <vscale x  8 x half> %b
  ret <vscale x  8 x half> %res
}

define <vscale x  4 x float> @select_nxv4f32(i1 %cond, <vscale x  4 x float> %a, <vscale x  4 x float> %b) {
; CHECK-LABEL: select_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.s, xzr, x8
; CHECK-NEXT:    sel z0.s, p0, z0.s, z1.s
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  4 x float> %a, <vscale x  4 x float> %b
  ret <vscale x  4 x float> %res
}

define <vscale x  2 x double> @select_nxv2f64(i1 %cond, <vscale x  2 x double> %a, <vscale x  2 x double> %b) {
; CHECK-LABEL: select_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p0.d, xzr, x8
; CHECK-NEXT:    sel z0.d, p0, z0.d, z1.d
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  2 x double> %a, <vscale x  2 x double> %b
  ret <vscale x  2 x double> %res
}

define <vscale x  16 x i1> @select_nxv16i1(i1 %cond, <vscale x  16 x i1> %a, <vscale x  16 x i1> %b) {
; CHECK-LABEL: select_nxv16i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p2.b, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  16 x i1> %a, <vscale x  16 x i1> %b
  ret <vscale x  16 x i1> %res
}

define <vscale x  8 x i1> @select_nxv8i1(i1 %cond, <vscale x  8 x i1> %a, <vscale x  8 x i1> %b) {
; CHECK-LABEL: select_nxv8i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p2.h, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  8 x i1> %a, <vscale x  8 x i1> %b
  ret <vscale x  8 x i1> %res
}

define <vscale x  4 x i1> @select_nxv4i1(i1 %cond, <vscale x  4 x i1> %a, <vscale x  4 x i1> %b) {
; CHECK-LABEL: select_nxv4i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p2.s, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  4 x i1> %a, <vscale x  4 x i1> %b
  ret <vscale x  4 x i1> %res
}

define <vscale x  2 x i1> @select_nxv2i1(i1 %cond, <vscale x  2 x i1> %a, <vscale x  2 x i1> %b) {
; CHECK-LABEL: select_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sbfx x8, x0, #0, #1
; CHECK-NEXT:    whilelo p2.d, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
  %res = select i1 %cond, <vscale x  2 x i1> %a, <vscale x  2 x i1> %b
  ret <vscale x  2 x i1> %res
}

; Integer vector select

define <vscale x 16 x i8> @sel_nxv16i8(<vscale x 16 x i1> %p, <vscale x 16 x i8> %dst, <vscale x 16 x i8> %a) {
; CHECK-LABEL: sel_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.b, p0/m, z1.b
; CHECK-NEXT:    ret
  %sel = select <vscale x 16 x i1> %p, <vscale x 16 x i8> %a, <vscale x 16 x i8> %dst
  ret <vscale x 16 x i8> %sel
}

define <vscale x 8 x i16> @sel_nxv8i16(<vscale x 8 x i1> %p, <vscale x 8 x i16> %dst, <vscale x 8 x i16> %a) {
; CHECK-LABEL: sel_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %sel = select <vscale x 8 x i1> %p, <vscale x 8 x i16> %a, <vscale x 8 x i16> %dst
  ret <vscale x 8 x i16> %sel
}

define <vscale x 4 x i32> @sel_nxv4i32(<vscale x 4 x i1> %p, <vscale x 4 x i32> %dst, <vscale x 4 x i32> %a) {
; CHECK-LABEL: sel_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %sel = select <vscale x 4 x i1> %p, <vscale x 4 x i32> %a, <vscale x 4 x i32> %dst
  ret <vscale x 4 x i32> %sel
}

define <vscale x 2 x i64> @sel_nxv2i64(<vscale x 2 x i1> %p, <vscale x 2 x i64> %dst, <vscale x 2 x i64> %a) {
; CHECK-LABEL: sel_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %sel = select <vscale x 2 x i1> %p, <vscale x 2 x i64> %a, <vscale x 2 x i64> %dst
  ret <vscale x 2 x i64> %sel
}

; Floating point vector select

define <vscale x 8 x half> @sel_nxv8f16(<vscale x 8 x i1> %p, <vscale x 8 x half> %dst, <vscale x 8 x half> %a) {
; CHECK-LABEL: sel_nxv8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %sel = select <vscale x 8 x i1> %p, <vscale x 8 x half> %a, <vscale x 8 x half> %dst
  ret <vscale x 8 x half> %sel
}

define <vscale x 4 x float> @sel_nxv4f32(<vscale x 4 x i1> %p, <vscale x 4 x float> %dst, <vscale x 4 x float> %a) {
; CHECK-LABEL: sel_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %sel = select <vscale x 4 x i1> %p, <vscale x 4 x float> %a, <vscale x 4 x float> %dst
  ret <vscale x 4 x float> %sel
}

define <vscale x 2 x float> @sel_nxv2f32(<vscale x 2 x i1> %p, <vscale x 2 x float> %dst, <vscale x 2 x float> %a) {
; CHECK-LABEL: sel_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %sel = select <vscale x 2 x i1> %p, <vscale x 2 x float> %a, <vscale x 2 x float> %dst
  ret <vscale x 2 x float> %sel
}

define <vscale x 2 x double> @sel_nxv8f64(<vscale x 2 x i1> %p, <vscale x 2 x double> %dst, <vscale x 2 x double> %a) {
; CHECK-LABEL: sel_nxv8f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %sel = select <vscale x 2 x i1> %p, <vscale x 2 x double> %a, <vscale x 2 x double> %dst
  ret <vscale x 2 x double> %sel
}

; Check icmp+select

define <vscale x 2 x half> @icmp_select_nxv2f16(<vscale x 2 x half> %a, <vscale x 2 x half> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.d, xzr, x8
; CHECK-NEXT:    sel z0.d, p0, z0.d, z1.d
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 2 x half> %a, <vscale x 2 x half> %b
  ret <vscale x 2 x half> %sel
}

define <vscale x 2 x float> @icmp_select_nxv2f32(<vscale x 2 x float> %a, <vscale x 2 x float> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.d, xzr, x8
; CHECK-NEXT:    sel z0.d, p0, z0.d, z1.d
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 2 x float> %a, <vscale x 2 x float> %b
  ret <vscale x 2 x float> %sel
}

define <vscale x 2 x double> @icmp_select_nxv2f64(<vscale x 2 x double> %a, <vscale x 2 x double> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.d, xzr, x8
; CHECK-NEXT:    sel z0.d, p0, z0.d, z1.d
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 2 x double> %a, <vscale x 2 x double> %b
  ret <vscale x 2 x double> %sel
}

define <vscale x 4 x half> @icmp_select_nxv4f16(<vscale x 4 x half> %a, <vscale x 4 x half> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.s, xzr, x8
; CHECK-NEXT:    sel z0.s, p0, z0.s, z1.s
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 4 x half> %a, <vscale x 4 x half> %b
  ret <vscale x 4 x half> %sel
}

define <vscale x 4 x float> @icmp_select_nxv4f32(<vscale x 4 x float> %a, <vscale x 4 x float> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.s, xzr, x8
; CHECK-NEXT:    sel z0.s, p0, z0.s, z1.s
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 4 x float> %a, <vscale x 4 x float> %b
  ret <vscale x 4 x float> %sel
}

define <vscale x 8 x half> @icmp_select_nxv8f16(<vscale x 8 x half> %a, <vscale x 8 x half> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.h, xzr, x8
; CHECK-NEXT:    sel z0.h, p0, z0.h, z1.h
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 8 x half> %a, <vscale x 8 x half> %b
  ret <vscale x 8 x half> %sel
}

define <vscale x 2 x i64> @icmp_select_nxv2i64(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.d, xzr, x8
; CHECK-NEXT:    sel z0.d, p0, z0.d, z1.d
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b
  ret <vscale x 2 x i64> %sel
}

define <vscale x 4 x i32> @icmp_select_nxv4i32(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.s, xzr, x8
; CHECK-NEXT:    sel z0.s, p0, z0.s, z1.s
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b
  ret <vscale x 4 x i32> %sel
}

define <vscale x 8 x i16> @icmp_select_nxv8i16(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.h, xzr, x8
; CHECK-NEXT:    sel z0.h, p0, z0.h, z1.h
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b
  ret <vscale x 8 x i16> %sel
}

define  <vscale x 16 x i8> @icmp_select_nxv16i8(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p0.b, xzr, x8
; CHECK-NEXT:    sel z0.b, p0, z0.b, z1.b
; CHECK-NEXT:    ret
  %mask = icmp eq i64 %x0, 0
  %sel = select i1 %mask, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b
  ret <vscale x 16 x i8> %sel
}

define <vscale x 2 x i1> @icmp_select_nxv2i1(<vscale x 2 x i1> %a, <vscale x 2 x i1> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p2.d, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
    %mask = icmp eq i64 %x0, 0
    %sel = select i1 %mask, <vscale x 2 x i1> %a, <vscale x 2 x i1> %b
    ret <vscale x 2 x i1> %sel
}
define <vscale x 4 x i1> @icmp_select_nxv4i1(<vscale x 4 x i1> %a, <vscale x 4 x i1> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv4i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p2.s, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
    %mask = icmp eq i64 %x0, 0
    %sel = select i1 %mask, <vscale x 4 x i1> %a, <vscale x 4 x i1> %b
    ret <vscale x 4 x i1> %sel
}
define <vscale x 8 x i1> @icmp_select_nxv8i1(<vscale x 8 x i1> %a, <vscale x 8 x i1> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv8i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p2.h, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
    %mask = icmp eq i64 %x0, 0
    %sel = select i1 %mask, <vscale x 8 x i1> %a, <vscale x 8 x i1> %b
    ret <vscale x 8 x i1> %sel
}
define <vscale x 16 x i1> @icmp_select_nxv16i1(<vscale x 16 x i1> %a, <vscale x 16 x i1> %b, i64 %x0) {
; CHECK-LABEL: icmp_select_nxv16i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, #0
; CHECK-NEXT:    cset w8, eq
; CHECK-NEXT:    sbfx x8, x8, #0, #1
; CHECK-NEXT:    whilelo p2.b, xzr, x8
; CHECK-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-NEXT:    ret
    %mask = icmp eq i64 %x0, 0
    %sel = select i1 %mask, <vscale x 16 x i1> %a, <vscale x 16 x i1> %b
    ret <vscale x 16 x i1> %sel
}
