	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_v0p10"
	.file	"test.c"
	.globl	add                             # -- Begin function add
	.p2align	1
	.type	add,@function
add:                                    # @add
# %bb.0:                                # %entry
	lui	a3, 1
	addiw	a3, a3, -100
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
	addi	a6, zero, 896
	addi	a7, zero, 64
	mv	t1, a0
	mv	a3, a1
	mv	a4, a2
	addi	t0, zero, 896
.LBB0_2:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a7, e32, m8, ta, mu
	vle32.v	v8, (t1)
	addi	a5, t1, 256
	vle32.v	v16, (a5)
	addi	a5, a3, 256
	vle32.v	v24, (a5)
	vle32.v	v0, (a3)
	vadd.w	v16, v24, v16
	vadd.w	v8, v0, v8
	vse32.v	v8, (a4)
	addi	a5, a4, 256
	vse32.v	v16, (a5)
	addi	t0, t0, -128
	addi	a4, a4, 512
	addi	a3, a3, 512
	addi	t1, t1, 512
	bnez	t0, .LBB0_2
.LBB0_3:                                # %for.body.preheader
	addi	a3, a6, -999
	slli	a4, a6, 2
	add	a2, a2, a4
	add	a1, a1, a4
	add	a0, a0, a4
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a6, 0(a0)
	lw	a5, 0(a1)
	mv	a4, a3
	add	a3, a5, a6
	sw	a3, 0(a2)
	addi	a3, a4, 1
	addi	a2, a2, 4
	addi	a1, a1, 4
	addi	a0, a0, 4
	bgeu	a3, a4, .LBB0_4
# %bb.5:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	add, .Lfunc_end0-add
                                        # -- End function
	.ident	"clang version 13.0.0 (git@github.com:ngik2000/llvm-project.git c04ce614e1fb23da8fdcd8238a57c86c9ee44ed2)"
	.section	".note.GNU-stack","",@progbits
