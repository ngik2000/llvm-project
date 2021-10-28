	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0"
	.file	"add.c"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 32
	sw	zero, -20(s0)
	addi	a0, zero, 1
	sw	a0, -24(s0)
	addi	a0, zero, 2
	sw	a0, -28(s0)
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	add	a0, a0, a1
	sw	a0, -32(s0)
	mv	a0, zero
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 13.0.0 (https://github.com/ngik2000/llvm-project d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.section	".note.GNU-stack","",@progbits
