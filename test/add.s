	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"add.ll"
	.globl	test                            # -- Begin function test
	.p2align	2
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:
	add	a0, a0, a1
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
