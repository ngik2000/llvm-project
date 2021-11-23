	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_v0p10"
	.file	"test.c"
	.globl	add                             # -- Begin function add
	.p2align	1
	.type	add,@function
add:                                    # @add
# %bb.0:                                # %entry
	addi	sp, sp, -16
	csrr	a3, vlenb
	addi	a4, zero, 40
	mul	a3, a3, a4
	sub	sp, sp, a3
	lui	a3, 195
	addiw	a3, a3, 1280
	add	a4, a2, a3
	add	a5, a0, a3
	add	a6, a1, a3
	sltu	a5, a2, a5
	sltu	a3, a0, a4
	and	a3, a3, a5
	sltu	a5, a2, a6
	sltu	a4, a1, a4
	and	a4, a4, a5
	or	a3, a3, a4
	mv	a6, zero
	bnez	a3, .LBB0_3
# %bb.1:                                # %vector.body.preheader
	lui	a3, 24
	addiw	a6, a3, 1664
	addi	a7, zero, 32
	mv	t1, a0
	mv	a3, a1
	mv	a4, a2
	mv	t0, a6
.LBB0_2:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a7, e64, m8, ta, mu
	addi	a5, t1, 512
	vle64.v	v8, (a5)
	csrr	a5, vlenb
	slli	a5, a5, 5
	add	a5, a5, sp
	addi	a5, a5, 16
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	addi	a5, t1, 768
	vle64.v	v8, (a5)
	csrr	a5, vlenb
	addi	t2, zero, 24
	mul	a5, a5, t2
	add	a5, a5, sp
	addi	a5, a5, 16
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	addi	a5, t1, 256
	vle64.v	v8, (a5)
	csrr	a5, vlenb
	slli	a5, a5, 4
	add	a5, a5, sp
	addi	a5, a5, 16
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	addi	t2, a3, 512
	addi	a5, a3, 768
	vle64.v	v8, (a5)
	csrr	a5, vlenb
	slli	a5, a5, 3
	add	a5, a5, sp
	addi	a5, a5, 16
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	addi	a5, a3, 256
	vle64.v	v8, (a5)
	vle64.v	v16, (t1)
	addi	a5, sp, 16
	vs8r.v	v16, (a5)                       # Unknown-size Folded Spill
	vle64.v	v16, (t2)
	vle64.v	v24, (a3)
	csrr	a5, vlenb
	slli	a5, a5, 4
	add	a5, a5, sp
	addi	a5, a5, 16
	vl8re8.v	v0, (a5)                        # Unknown-size Folded Reload
	vadd.vv	v8, v8, v0
	csrr	a5, vlenb
	slli	a5, a5, 4
	add	a5, a5, sp
	addi	a5, a5, 16
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	csrr	a5, vlenb
	addi	t2, zero, 24
	mul	a5, a5, t2
	add	a5, a5, sp
	addi	a5, a5, 16
	vl8re8.v	v8, (a5)                        # Unknown-size Folded Reload
	csrr	a5, vlenb
	slli	a5, a5, 3
	add	a5, a5, sp
	addi	a5, a5, 16
	vl8re8.v	v0, (a5)                        # Unknown-size Folded Reload
	vadd.vv	v8, v0, v8
	csrr	a5, vlenb
	addi	t2, zero, 24
	mul	a5, a5, t2
	add	a5, a5, sp
	addi	a5, a5, 16
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	csrr	a5, vlenb
	slli	a5, a5, 5
	add	a5, a5, sp
	addi	a5, a5, 16
	vl8re8.v	v8, (a5)                        # Unknown-size Folded Reload
	vadd.vv	v16, v16, v8
	addi	a5, sp, 16
	vl8re8.v	v8, (a5)                        # Unknown-size Folded Reload
	vadd.vv	v24, v24, v8
	vse64.v	v24, (a4)
	addi	a5, a4, 512
	vse64.v	v16, (a5)
	addi	a5, a4, 768
	csrr	t2, vlenb
	addi	t3, zero, 24
	mul	t2, t2, t3
	add	t2, t2, sp
	addi	t2, t2, 16
	vl8re8.v	v8, (t2)                        # Unknown-size Folded Reload
	vse64.v	v8, (a5)
	addi	a5, a4, 256
	csrr	t2, vlenb
	slli	t2, t2, 4
	add	t2, t2, sp
	addi	t2, t2, 16
	vl8re8.v	v8, (t2)                        # Unknown-size Folded Reload
	vse64.v	v8, (a5)
	addi	t0, t0, -128
	addi	a4, a4, 1024
	addi	a3, a3, 1024
	addi	t1, t1, 1024
	bnez	t0, .LBB0_2
.LBB0_3:                                # %for.body.preheader
	lui	a3, 1048552
	addiw	a3, a3, -1696
	add	a3, a3, a6
	slli	a4, a6, 3
	add	a2, a2, a4
	add	a1, a1, a4
	add	a0, a0, a4
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a6, 0(a0)
	ld	a5, 0(a1)
	mv	a4, a3
	add	a3, a5, a6
	sd	a3, 0(a2)
	addi	a3, a4, 1
	addi	a2, a2, 8
	addi	a1, a1, 8
	addi	a0, a0, 8
	bgeu	a3, a4, .LBB0_4
# %bb.5:                                # %for.cond.cleanup
	csrr	a0, vlenb
	addi	a1, zero, 40
	mul	a0, a0, a1
	add	sp, sp, a0
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	add, .Lfunc_end0-add
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	mv	a0, zero
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.ident	"clang version 13.0.0 (https://github.com/ngik2000/llvm-project 2b290128e446bfb4e761d3f92554a014fa10b107)"
	.section	".note.GNU-stack","",@progbits
