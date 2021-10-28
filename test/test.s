	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0"
	.file	"test.c"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	addi	sp, sp, -2032
	sd	ra, 2024(sp)                    # 8-byte Folded Spill
	sd	s0, 2016(sp)                    # 8-byte Folded Spill
	sd	s1, 2008(sp)                    # 8-byte Folded Spill
	sd	s2, 2000(sp)                    # 8-byte Folded Spill
	sd	s3, 1992(sp)                    # 8-byte Folded Spill
	lui	a0, 97
	addiw	a0, a0, 704
	sub	sp, sp, a0
	lui	a0, 98
	addiw	a1, a0, -1436
	addi	a2, sp, 8
	add	s2, a2, a1
	addiw	a2, a0, -1408
	addi	a0, sp, 8
	mv	a1, zero
	call	memset@plt
	mv	a6, zero
	mv	a2, zero
	mv	a7, zero
	mv	a5, zero
	mv	a3, zero
	mv	s0, zero
	mv	a4, zero
	addi	s1, sp, 12
	addi	a0, zero, 2
	sw	a0, 12(sp)
	addi	a0, zero, 3
	sw	a0, 16(sp)
	addi	a0, zero, 4
	sw	a0, 20(sp)
	addi	a0, zero, 1
	lui	a1, 24
	addiw	a1, a1, 1688
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	lw	t0, 28(s1)
	lw	t1, 24(s1)
	lw	t2, 20(s1)
	lw	t3, 16(s1)
	lw	t4, 4(s1)
	lw	t5, 0(s1)
	lw	t6, 8(s1)
	lw	s3, 12(s1)
	addw	a6, t4, a6
	addw	a0, t5, a0
	addw	a2, t6, a2
	addw	a7, s3, a7
	addw	a5, t3, a5
	addw	a3, t2, a3
	addw	s0, t1, s0
	addw	a4, t0, a4
	addi	a1, a1, -8
	addi	s1, s1, 32
	bnez	a1, .LBB0_1
# %bb.2:                                # %for.body.for.body_crit_edge
	add	a0, a0, a5
	add	a1, a2, s0
	add	a0, a0, a1
	add	a1, a6, a3
	add	a2, a7, a4
	lw	a3, 0(s2)
	lw	a4, 4(s2)
	add	a1, a1, a2
	add	a0, a0, a1
	addw	a0, a0, a3
	add	a0, a0, a4
	lw	a1, 8(s2)
	lw	a2, 12(s2)
	lw	a3, 16(s2)
	lw	a4, 20(s2)
	add	a0, a0, a1
	add	a0, a0, a2
	add	a0, a0, a3
	addw	a0, a0, a4
	lui	a1, 97
	addiw	a1, a1, 704
	add	sp, sp, a1
	ld	s3, 1992(sp)                    # 8-byte Folded Reload
	ld	s2, 2000(sp)                    # 8-byte Folded Reload
	ld	s1, 2008(sp)                    # 8-byte Folded Reload
	ld	s0, 2016(sp)                    # 8-byte Folded Reload
	ld	ra, 2024(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 2032
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 13.0.0 (https://github.com/ngik2000/llvm-project d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.section	".note.GNU-stack","",@progbits
