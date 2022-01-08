	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_v0p10"
	.file	"test_addarray.c"
	.globl	add                             # -- Begin function add
	.p2align	2
	.type	add,@function
add:                                    # @add
# %bb.0:                                # %entry
	lui	a3, 1
	addi	a3, a3, -100
	add	a4, a2, a3
	add	a5, a0, a3
	add	a6, a1, a3
	sltu	a5, a2, a5
	sltu	a3, a0, a4
	and	a3, a5, a3
	sltu	a5, a2, a6
	sltu	a4, a1, a4
	and	a4, a5, a4
	or	a3, a3, a4
	mv	a6, zero
	bnez	a3, .LBB0_3
# %bb.1:                                # %vector.body.preheader
	addi	a6, zero, 996
	mv	a7, a0
	mv	a5, a1
	mv	a3, a2
	addi	a4, zero, 996
.LBB0_2:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetivli	zero, 4, e32, m1, ta, mu
	vle32.v	v25, (a7)
	vle32.v	v26, (a5)
	vadd.w	v25, v26, v25
	vse32.v	v25, (a3)
	addi	a4, a4, -4
	addi	a3, a3, 16
	addi	a5, a5, 16
	addi	a7, a7, 16
	bnez	a4, .LBB0_2
.LBB0_3:                                # %for.body.preheader
	addi	a4, a6, -999
	slli	a3, a6, 2
	add	a2, a2, a3
	add	a1, a1, a3
	add	a0, a0, a3
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a6, 0(a0)
	lw	a5, 0(a1)
	mv	a3, a4
	add	a4, a5, a6
	sw	a4, 0(a2)
	addi	a4, a3, 1
	addi	a2, a2, 4
	addi	a1, a1, 4
	addi	a0, a0, 4
	bgeu	a4, a3, .LBB0_4
# %bb.5:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	add, .Lfunc_end0-add
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	mv	a0, zero
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.ident	"clang version 13.0.0 (git@github.com:ngik2000/llvm-project.git c04ce614e1fb23da8fdcd8238a57c86c9ee44ed2)"
	.section	".note.GNU-stack","",@progbits
