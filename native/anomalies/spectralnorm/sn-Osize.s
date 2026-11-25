
swift-Osize/bench:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000005d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF>:
1000005d8:     	stp	x22, x21, [sp, #-0x30]!
1000005dc:     	stp	x20, x19, [sp, #0x10]
1000005e0:     	stp	x29, x30, [sp, #0x20]
1000005e4:     	add	x29, sp, #0x20
1000005e8:     	tbnz	x0, #0x3f, 0x1000006a4 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xcc>
1000005ec:     	mov	x19, x0
1000005f0:     	cbz	x0, 0x10000067c <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xa4>
1000005f4:     	bl	0x100000c2c <_OUTLINED_FUNCTION_1>
1000005f8:     	bl	0x100000c14 <_OUTLINED_FUNCTION_0>
1000005fc:     	ldr	x8, [x22, #0x10]
100000600:     	cmp	x19, x8
100000604:     	b.hi	0x1000006a8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xd0>
100000608:     	bl	0x100000c60 <_OUTLINED_FUNCTION_4>
10000060c:     	mov	x13, #0x0               ; =0
100000610:     	add	x12, x9, #0x1
100000614:     	movi.2d	v1, #0000000000000000
100000618:     	adds	x14, x9, x13
10000061c:     	b.vs	0x100000690 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xb8>
100000620:     	cmp	x10, x13
100000624:     	b.eq	0x100000694 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xbc>
100000628:     	add	x16, x14, #0x1
10000062c:     	mul	x15, x14, x16
100000630:     	smulh	x14, x14, x16
100000634:     	cmp	x14, x15, asr #63
100000638:     	b.ne	0x100000698 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xc0>
10000063c:     	sdiv	x14, x15, x11
100000640:     	adds	x14, x14, x12
100000644:     	b.vs	0x10000069c <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xc4>
100000648:     	scvtf	d2, x14
10000064c:     	ldr	d3, [x8, x13, lsl #3]
100000650:     	add	x13, x13, #0x1
100000654:     	fdiv	d2, d0, d2
100000658:     	fmul	d2, d2, d3
10000065c:     	fadd	d1, d1, d2
100000660:     	cmp	x19, x13
100000664:     	b.ne	0x100000618 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x40>
100000668:     	cmp	x9, x19
10000066c:     	b.hs	0x1000006a0 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xc8>
100000670:     	bl	0x100000c84 <_OUTLINED_FUNCTION_6>
100000674:     	b.ne	0x10000060c <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x34>
100000678:     	b	0x100000684 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xac>
10000067c:     	adrp	x20, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000680:     	ldr	x20, [x20, #0xc0]
100000684:     	mov	x0, x20
100000688:     	ldp	x29, x30, [sp, #0x20]
10000068c:     	b	0x100000c78 <_OUTLINED_FUNCTION_5>
100000690:     	brk	#0x1
100000694:     	brk	#0x1
100000698:     	brk	#0x1
10000069c:     	brk	#0x1
1000006a0:     	brk	#0x1
1000006a4:     	brk	#0x1
1000006a8:     	brk	#0x1

00000001000006ac <_$sSa9repeating5countSayxGx_SitcfCSd_Tt1g5>:
1000006ac:     	tbnz	x0, #0x3f, 0x100000710 <_$sSa9repeating5countSayxGx_SitcfCSd_Tt1g5+0x64>
1000006b0:     	stp	d9, d8, [sp, #-0x30]!
1000006b4:     	stp	x20, x19, [sp, #0x10]
1000006b8:     	stp	x29, x30, [sp, #0x20]
1000006bc:     	add	x29, sp, #0x20
1000006c0:     	mov	x19, x0
1000006c4:     	cbz	x0, 0x1000006f8 <_$sSa9repeating5countSayxGx_SitcfCSd_Tt1g5+0x4c>
1000006c8:     	mov.16b	v8, v0
1000006cc:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000006d0:     	ldr	x1, [x1, #0xa0]
1000006d4:     	mov	x0, x19
1000006d8:     	bl	0x100000f70 <_swift_bridgeObjectRetain+0x100000f70>
1000006dc:     	str	x19, [x0, #0x10]
1000006e0:     	mov	w8, #0x20               ; =32
1000006e4:     	str	d8, [x0, x8]
1000006e8:     	add	x8, x8, #0x8
1000006ec:     	subs	x19, x19, #0x1
1000006f0:     	b.ne	0x1000006e4 <_$sSa9repeating5countSayxGx_SitcfCSd_Tt1g5+0x38>
1000006f4:     	b	0x100000700 <_$sSa9repeating5countSayxGx_SitcfCSd_Tt1g5+0x54>
1000006f8:     	adrp	x0, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000006fc:     	ldr	x0, [x0, #0xc0]
100000700:     	ldp	x29, x30, [sp, #0x20]
100000704:     	ldp	x20, x19, [sp, #0x10]
100000708:     	ldp	d9, d8, [sp], #0x30
10000070c:     	ret
100000710:     	brk	#0x1

0000000100000714 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF>:
100000714:     	stp	x22, x21, [sp, #-0x30]!
100000718:     	stp	x20, x19, [sp, #0x10]
10000071c:     	stp	x29, x30, [sp, #0x20]
100000720:     	add	x29, sp, #0x20
100000724:     	tbnz	x0, #0x3f, 0x1000007e4 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xd0>
100000728:     	mov	x19, x0
10000072c:     	cbz	x0, 0x1000007bc <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xa8>
100000730:     	bl	0x100000c2c <_OUTLINED_FUNCTION_1>
100000734:     	bl	0x100000c14 <_OUTLINED_FUNCTION_0>
100000738:     	ldr	x8, [x22, #0x10]
10000073c:     	cmp	x19, x8
100000740:     	b.hi	0x1000007e8 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xd4>
100000744:     	bl	0x100000c60 <_OUTLINED_FUNCTION_4>
100000748:     	mov	x13, #0x0               ; =0
10000074c:     	add	x12, x9, #0x1
100000750:     	movi.2d	v1, #0000000000000000
100000754:     	adds	x14, x13, x9
100000758:     	b.vs	0x1000007d0 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xbc>
10000075c:     	cmp	x10, x13
100000760:     	b.eq	0x1000007d4 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xc0>
100000764:     	add	x16, x14, #0x1
100000768:     	mul	x15, x14, x16
10000076c:     	smulh	x14, x14, x16
100000770:     	cmp	x14, x15, asr #63
100000774:     	b.ne	0x1000007d8 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xc4>
100000778:     	add	x14, x13, #0x1
10000077c:     	sdiv	x15, x15, x11
100000780:     	adds	x15, x15, x14
100000784:     	b.vs	0x1000007dc <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xc8>
100000788:     	scvtf	d2, x15
10000078c:     	fdiv	d2, d0, d2
100000790:     	ldr	d3, [x8, x13, lsl #3]
100000794:     	fmul	d2, d2, d3
100000798:     	fadd	d1, d1, d2
10000079c:     	mov	x13, x14
1000007a0:     	cmp	x19, x14
1000007a4:     	b.ne	0x100000754 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x40>
1000007a8:     	cmp	x9, x19
1000007ac:     	b.hs	0x1000007e0 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xcc>
1000007b0:     	bl	0x100000c84 <_OUTLINED_FUNCTION_6>
1000007b4:     	b.ne	0x100000748 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x34>
1000007b8:     	b	0x1000007c4 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xb0>
1000007bc:     	adrp	x20, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000007c0:     	ldr	x20, [x20, #0xc0]
1000007c4:     	mov	x0, x20
1000007c8:     	ldp	x29, x30, [sp, #0x20]
1000007cc:     	b	0x100000c78 <_OUTLINED_FUNCTION_5>
1000007d0:     	brk	#0x1
1000007d4:     	brk	#0x1
1000007d8:     	brk	#0x1
1000007dc:     	brk	#0x1
1000007e0:     	brk	#0x1
1000007e4:     	brk	#0x1
1000007e8:     	brk	#0x1

00000001000007ec <_$s12SpectralNorm11approximateySdSiF>:
1000007ec:     	stp	d9, d8, [sp, #-0x50]!
1000007f0:     	stp	x24, x23, [sp, #0x10]
1000007f4:     	stp	x22, x21, [sp, #0x20]
1000007f8:     	stp	x20, x19, [sp, #0x30]
1000007fc:     	stp	x29, x30, [sp, #0x40]
100000800:     	add	x29, sp, #0x40
100000804:     	mov	x19, x0
100000808:     	fmov	d0, #1.00000000
10000080c:     	bl	0x1000006ac <_$sSa9repeating5countSayxGx_SitcfCSd_Tt1g5>
100000810:     	mov	x21, x0
100000814:     	adrp	x20, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000818:     	ldr	x20, [x20, #0xc0]
10000081c:     	mov	w24, #0xa               ; =10
100000820:     	mov	x22, x21
100000824:     	mov	x21, x20
100000828:     	mov	x0, x19
10000082c:     	mov	x1, x22
100000830:     	bl	0x1000005d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF>
100000834:     	bl	0x100000c50 <_OUTLINED_FUNCTION_3>
100000838:     	mov	x20, x0
10000083c:     	mov	x0, x21
100000840:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
100000844:     	mov	x0, x23
100000848:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
10000084c:     	mov	x0, x19
100000850:     	mov	x1, x20
100000854:     	bl	0x1000005d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF>
100000858:     	bl	0x100000c50 <_OUTLINED_FUNCTION_3>
10000085c:     	mov	x21, x0
100000860:     	mov	x0, x22
100000864:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
100000868:     	mov	x0, x23
10000086c:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
100000870:     	subs	x24, x24, #0x1
100000874:     	b.ne	0x100000820 <_$s12SpectralNorm11approximateySdSiF+0x34>
100000878:     	tbnz	x19, #0x3f, 0x100000904 <_$s12SpectralNorm11approximateySdSiF+0x118>
10000087c:     	cbz	x19, 0x1000008d0 <_$s12SpectralNorm11approximateySdSiF+0xe4>
100000880:     	ldr	x8, [x21, #0x10]
100000884:     	cmp	x19, x8
100000888:     	b.hi	0x100000908 <_$s12SpectralNorm11approximateySdSiF+0x11c>
10000088c:     	ldr	x8, [x20, #0x10]
100000890:     	cmp	x19, x8
100000894:     	b.hi	0x10000090c <_$s12SpectralNorm11approximateySdSiF+0x120>
100000898:     	add	x8, x21, #0x20
10000089c:     	add	x9, x20, #0x20
1000008a0:     	movi.2d	v0, #0000000000000000
1000008a4:     	movi.2d	v1, #0000000000000000
1000008a8:     	ldr	d2, [x8], #0x8
1000008ac:     	ldr	d3, [x9], #0x8
1000008b0:     	fmul	d2, d2, d3
1000008b4:     	fadd	d1, d1, d2
1000008b8:     	fmul	d2, d3, d3
1000008bc:     	fadd	d0, d0, d2
1000008c0:     	subs	x19, x19, #0x1
1000008c4:     	b.ne	0x1000008a8 <_$s12SpectralNorm11approximateySdSiF+0xbc>
1000008c8:     	fdiv	d8, d1, d0
1000008cc:     	b	0x1000008d8 <_$s12SpectralNorm11approximateySdSiF+0xec>
1000008d0:     	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
1000008d4:     	fmov	d8, x8
1000008d8:     	mov	x0, x20
1000008dc:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
1000008e0:     	mov	x0, x21
1000008e4:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
1000008e8:     	fsqrt	d0, d8
1000008ec:     	ldp	x29, x30, [sp, #0x40]
1000008f0:     	ldp	x20, x19, [sp, #0x30]
1000008f4:     	ldp	x22, x21, [sp, #0x20]
1000008f8:     	ldp	x24, x23, [sp, #0x10]
1000008fc:     	ldp	d9, d8, [sp], #0x50
100000900:     	ret
100000904:     	brk	#0x1
100000908:     	brk	#0x1
10000090c:     	brk	#0x1

0000000100000910 <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF>:
100000910:     	sub	sp, sp, #0x30
100000914:     	stp	d9, d8, [sp, #0x10]
100000918:     	stp	x29, x30, [sp, #0x20]
10000091c:     	add	x29, sp, #0x20
100000920:     	mov.16b	v8, v0
100000924:     	scvtf	d0, x0
100000928:     	bl	0x100000f94 <_swift_bridgeObjectRetain+0x100000f94>
10000092c:     	fmul	d1, d8, d0
100000930:     	fmov	d2, #0.50000000
100000934:     	fadd	d1, d1, d2
100000938:     	fmov	x8, d1
10000093c:     	and	x8, x8, #0x7fffffffffffffff
100000940:     	mov	x9, #0x7fefffffffffffff ; =9218868437227405311
100000944:     	cmp	x8, x9
100000948:     	b.gt	0x1000009ac <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF+0x9c>
10000094c:     	adrp	x8, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000950:     	ldr	d2, [x8, #0x28]
100000954:     	fcmp	d1, d2
100000958:     	b.le	0x1000009b0 <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF+0xa0>
10000095c:     	mov	x8, #0x43e0000000000000 ; =4890909195324358656
100000960:     	fmov	d2, x8
100000964:     	fcmp	d1, d2
100000968:     	b.pl	0x1000009b4 <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF+0xa4>
10000096c:     	fcvtzs	d1, d1
100000970:     	scvtf	d1, d1
100000974:     	mov	x8, #-0x2000000000000000 ; =-2305843009213693952
100000978:     	stp	xzr, x8, [sp]
10000097c:     	fdiv	d0, d1, d0
100000980:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000984:     	ldr	x1, [x1, #0xb0]
100000988:     	adrp	x2, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
10000098c:     	ldr	x2, [x2, #0xb8]
100000990:     	mov	x0, sp
100000994:     	bl	0x100000f7c <_swift_bridgeObjectRetain+0x100000f7c>
100000998:     	ldp	x0, x1, [sp]
10000099c:     	ldp	x29, x30, [sp, #0x20]
1000009a0:     	ldp	d9, d8, [sp, #0x10]
1000009a4:     	add	sp, sp, #0x30
1000009a8:     	ret
1000009ac:     	brk	#0x1
1000009b0:     	brk	#0x1
1000009b4:     	brk	#0x1

00000001000009b8 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF>:
1000009b8:     	sub	sp, sp, #0x80
1000009bc:     	stp	x28, x27, [sp, #0x20]
1000009c0:     	stp	x26, x25, [sp, #0x30]
1000009c4:     	stp	x24, x23, [sp, #0x40]
1000009c8:     	stp	x22, x21, [sp, #0x50]
1000009cc:     	stp	x20, x19, [sp, #0x60]
1000009d0:     	stp	x29, x30, [sp, #0x70]
1000009d4:     	add	x29, sp, #0x70
1000009d8:     	mov	x19, x2
1000009dc:     	mov	x20, x1
1000009e0:     	mov	x21, x0
1000009e4:     	and	x8, x1, #0xffffffffffff
1000009e8:     	ubfx	x9, x2, #56, #4
1000009ec:     	tst	x2, #0x2000000000000000
1000009f0:     	csel	x24, x8, x9, eq
1000009f4:     	tst	x2, #0x1000000000000000
1000009f8:     	lsl	x25, x24, #2
1000009fc:     	ubfx	x8, x1, #59, #1
100000a00:     	csinc	w8, w8, wzr, ne
100000a04:     	mov	w9, #0x4                ; =4
100000a08:     	lsl	x26, x9, x8
100000a0c:     	and	x9, x2, #0xffffffffffffff
100000a10:     	and	x8, x2, #0xfffffffffffffff
100000a14:     	add	x8, x8, #0x20
100000a18:     	stp	x8, x9, [sp]
100000a1c:     	mov	w22, #0xf               ; =15
100000a20:     	mov	w27, #0x193             ; =403
100000a24:     	movk	w27, #0x100, lsl #16
100000a28:     	cmp	x25, x22, lsr #14
100000a2c:     	b.eq	0x100000af0 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x138>
100000a30:     	and	x28, x22, #0xc
100000a34:     	mov	x0, x22
100000a38:     	cmp	x28, x26
100000a3c:     	b.ne	0x100000a44 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x8c>
100000a40:     	bl	0x100000c40 <_OUTLINED_FUNCTION_2>
100000a44:     	lsr	x23, x0, #16
100000a48:     	cmp	x23, x24
100000a4c:     	b.hs	0x100000b14 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x15c>
100000a50:     	tbnz	x19, #0x3c, 0x100000aa4 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xec>
100000a54:     	tbnz	x19, #0x3d, 0x100000a74 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xbc>
100000a58:     	ldr	x0, [sp]
100000a5c:     	tbnz	x20, #0x3c, 0x100000a6c <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xb4>
100000a60:     	mov	x0, x20
100000a64:     	mov	x1, x19
100000a68:     	bl	0x100000f88 <_swift_bridgeObjectRetain+0x100000f88>
100000a6c:     	ldrb	w23, [x0, x23]
100000a70:     	b	0x100000a84 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xcc>
100000a74:     	ldr	x8, [sp, #0x8]
100000a78:     	stp	x20, x8, [sp, #0x10]
100000a7c:     	add	x8, sp, #0x10
100000a80:     	ldrb	w23, [x8, x23]
100000a84:     	cmp	x28, x26
100000a88:     	b.eq	0x100000ab8 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x100>
100000a8c:     	tbnz	x19, #0x3c, 0x100000ac4 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x10c>
100000a90:     	and	x8, x22, #0xffffffffffff0000
100000a94:     	mov	w9, #0x4                ; =4
100000a98:     	movk	w9, #0x1, lsl #16
100000a9c:     	add	x22, x8, x9
100000aa0:     	b	0x100000ae0 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x128>
100000aa4:     	mov	x1, x20
100000aa8:     	mov	x2, x19
100000aac:     	bl	0x100000f58 <_swift_bridgeObjectRetain+0x100000f58>
100000ab0:     	mov	x23, x0
100000ab4:     	b	0x100000a84 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xcc>
100000ab8:     	bl	0x100000c40 <_OUTLINED_FUNCTION_2>
100000abc:     	mov	x22, x0
100000ac0:     	tbz	x19, #0x3c, 0x100000a90 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xd8>
100000ac4:     	cmp	x24, x22, lsr #16
100000ac8:     	b.ls	0x100000b18 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x160>
100000acc:     	mov	x0, x22
100000ad0:     	mov	x1, x20
100000ad4:     	mov	x2, x19
100000ad8:     	bl	0x100000f40 <_swift_bridgeObjectRetain+0x100000f40>
100000adc:     	mov	x22, x0
100000ae0:     	and	w8, w23, #0xff
100000ae4:     	eor	w8, w21, w8
100000ae8:     	mul	w21, w8, w27
100000aec:     	b	0x100000a28 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x70>
100000af0:     	mov	x0, x21
100000af4:     	ldp	x29, x30, [sp, #0x70]
100000af8:     	ldp	x20, x19, [sp, #0x60]
100000afc:     	ldp	x22, x21, [sp, #0x50]
100000b00:     	ldp	x24, x23, [sp, #0x40]
100000b04:     	ldp	x26, x25, [sp, #0x30]
100000b08:     	ldp	x28, x27, [sp, #0x20]
100000b0c:     	add	sp, sp, #0x80
100000b10:     	ret
100000b14:     	brk	#0x1
100000b18:     	brk	#0x1

0000000100000b1c <_bench>:
100000b1c:     	b	0x100000b20 <_$s12SpectralNorm5benchys6UInt32Vs5Int32VF>

0000000100000b20 <_$s12SpectralNorm5benchys6UInt32Vs5Int32VF>:
100000b20:     	sub	sp, sp, #0x30
100000b24:     	stp	x20, x19, [sp, #0x10]
100000b28:     	stp	x29, x30, [sp, #0x20]
100000b2c:     	add	x29, sp, #0x20
100000b30:     	sxtw	x0, w0
100000b34:     	bl	0x1000007ec <_$s12SpectralNorm11approximateySdSiF>
100000b38:     	mov	w0, #0x9                ; =9
100000b3c:     	bl	0x100000910 <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF>
100000b40:     	mov	x19, x1
100000b44:     	stp	x0, x1, [sp]
100000b48:     	mov	x0, x1
100000b4c:     	bl	0x100001018 <_swift_bridgeObjectRetain+0x100001018>
100000b50:     	mov	x20, sp
100000b54:     	mov	w0, #0xa                ; =10
100000b58:     	mov	x1, #-0x1f00000000000000 ; =-2233785415175766016
100000b5c:     	bl	0x100000f34 <_swift_bridgeObjectRetain+0x100000f34>
100000b60:     	mov	x0, x19
100000b64:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
100000b68:     	ldp	x1, x19, [sp]
100000b6c:     	mov	w0, #0x9dc5             ; =40389
100000b70:     	movk	w0, #0x811c, lsl #16
100000b74:     	mov	x2, x19
100000b78:     	bl	0x1000009b8 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF>
100000b7c:     	mov	x20, x0
100000b80:     	mov	x0, x19
100000b84:     	bl	0x10000100c <_swift_bridgeObjectRetain+0x10000100c>
100000b88:     	mov	x0, x20
100000b8c:     	ldp	x29, x30, [sp, #0x20]
100000b90:     	ldp	x20, x19, [sp, #0x10]
100000b94:     	add	sp, sp, #0x30
100000b98:     	ret

0000000100000b9c <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF>:
100000b9c:     	stp	x20, x19, [sp, #-0x20]!
100000ba0:     	stp	x29, x30, [sp, #0x10]
100000ba4:     	add	x29, sp, #0x10
100000ba8:     	mov	x3, x2
100000bac:     	mov	x2, x1
100000bb0:     	mov	x19, x0
100000bb4:     	lsr	x1, x0, #16
100000bb8:     	ubfx	x20, x0, #14, #2
100000bbc:     	tbz	x3, #0x3c, 0x100000be8 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF+0x4c>
100000bc0:     	tbnz	x2, #0x3b, 0x100000be8 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF+0x4c>
100000bc4:     	mov	w0, #0xf                ; =15
100000bc8:     	bl	0x100000f4c <_swift_bridgeObjectRetain+0x100000f4c>
100000bcc:     	add	x8, x0, x20, lsl #16
100000bd0:     	and	x8, x8, #0xffffffffffff0000
100000bd4:     	bfxil	x0, x19, #0, #2
100000bd8:     	cmp	x20, #0x0
100000bdc:     	csel	x8, x8, x0, ne
100000be0:     	orr	x0, x8, #0x8
100000be4:     	b	0x100000c08 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF+0x6c>
100000be8:     	mov	w0, #0xf                ; =15
100000bec:     	bl	0x100000f64 <_swift_bridgeObjectRetain+0x100000f64>
100000bf0:     	add	x8, x0, x20, lsl #16
100000bf4:     	and	x8, x8, #0xffffffffffff0000
100000bf8:     	bfxil	x0, x19, #0, #2
100000bfc:     	cmp	x20, #0x0
100000c00:     	csel	x8, x8, x0, ne
100000c04:     	orr	x0, x8, #0x4
100000c08:     	ldp	x29, x30, [sp, #0x10]
100000c0c:     	ldp	x20, x19, [sp], #0x20
100000c10:     	ret

0000000100000c14 <_OUTLINED_FUNCTION_0>:
100000c14:     	mov	x20, x0
100000c18:     	str	x19, [x0, #0x10]
100000c1c:     	add	x21, x0, #0x20
100000c20:     	lsl	x1, x19, #3
100000c24:     	mov	x0, x21
100000c28:     	b	0x100000fac <_swift_bridgeObjectRetain+0x100000fac>

0000000100000c2c <_OUTLINED_FUNCTION_1>:
100000c2c:     	mov	x22, x1
100000c30:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000c34:     	ldr	x1, [x1, #0xa0]
100000c38:     	mov	x0, x19
100000c3c:     	b	0x100000f70 <_swift_bridgeObjectRetain+0x100000f70>

0000000100000c40 <_OUTLINED_FUNCTION_2>:
100000c40:     	mov	x0, x22
100000c44:     	mov	x1, x20
100000c48:     	mov	x2, x19
100000c4c:     	b	0x100000b9c <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF>

0000000100000c50 <_OUTLINED_FUNCTION_3>:
100000c50:     	mov	x23, x0
100000c54:     	mov	x0, x19
100000c58:     	mov	x1, x23
100000c5c:     	b	0x100000714 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF>

0000000100000c60 <_OUTLINED_FUNCTION_4>:
100000c60:     	mov	x9, #0x0                ; =0
100000c64:     	add	x8, x22, #0x20
100000c68:     	mov	x10, #0x7fffffffffffffff ; =9223372036854775807
100000c6c:     	mov	w11, #0x2               ; =2
100000c70:     	fmov	d0, #1.00000000
100000c74:     	ret

0000000100000c78 <_OUTLINED_FUNCTION_5>:
100000c78:     	ldp	x20, x19, [sp, #0x10]
100000c7c:     	ldp	x22, x21, [sp], #0x30
100000c80:     	ret

0000000100000c84 <_OUTLINED_FUNCTION_6>:
100000c84:     	str	d1, [x21, x9, lsl #3]
100000c88:     	sub	x10, x10, #0x1
100000c8c:     	mov	x9, x12
100000c90:     	cmp	x12, x19
100000c94:     	ret

0000000100000c98 <_main>:
100000c98:     	sub	sp, sp, #0xb0
100000c9c:     	stp	d11, d10, [sp, #0x30]
100000ca0:     	stp	d9, d8, [sp, #0x40]
100000ca4:     	stp	x28, x27, [sp, #0x50]
100000ca8:     	stp	x26, x25, [sp, #0x60]
100000cac:     	stp	x24, x23, [sp, #0x70]
100000cb0:     	stp	x22, x21, [sp, #0x80]
100000cb4:     	stp	x20, x19, [sp, #0x90]
100000cb8:     	stp	x29, x30, [sp, #0xa0]
100000cbc:     	add	x29, sp, #0xa0
100000cc0:     	cmp	w0, #0x3
100000cc4:     	b.gt	0x100000cf0 <_main+0x58>
100000cc8:     	adrp	x8, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000ccc:     	ldr	x8, [x8, #0x18]
100000cd0:     	ldr	x3, [x8]
100000cd4:     	adrp	x0, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000cd8:     	add	x0, x0, #0x32
100000cdc:     	mov	w1, #0x21               ; =33
100000ce0:     	mov	w2, #0x1                ; =1
100000ce4:     	bl	0x100000fc4 <_swift_bridgeObjectRetain+0x100000fc4>
100000ce8:     	mov	w0, #0x2                ; =2
100000cec:     	b	0x100000ef4 <_main+0x25c>
100000cf0:     	ldr	x0, [x1, #0x8]
100000cf4:     	mov	x20, x1
100000cf8:     	bl	0x100000fa0 <_swift_bridgeObjectRetain+0x100000fa0>
100000cfc:     	mov	x22, x0
100000d00:     	ldr	x0, [x20, #0x10]
100000d04:     	bl	0x100000fa0 <_swift_bridgeObjectRetain+0x100000fa0>
100000d08:     	mov	x19, x0
100000d0c:     	ldr	x0, [x20, #0x18]
100000d10:     	bl	0x100000fa0 <_swift_bridgeObjectRetain+0x100000fa0>
100000d14:     	mov	x21, x0
100000d18:     	mov	x0, x22
100000d1c:     	bl	0x100000b1c <_bench>
100000d20:     	mov	x20, x0
100000d24:     	cmp	w21, #0x1
100000d28:     	b.lt	0x100000d3c <_main+0xa4>
100000d2c:     	mov	x0, x22
100000d30:     	bl	0x100000b1c <_bench>
100000d34:     	subs	w21, w21, #0x1
100000d38:     	b.ne	0x100000d2c <_main+0x94>
100000d3c:     	sbfiz	x23, x19, #3, #32
100000d40:     	mov	x0, x23
100000d44:     	bl	0x100000fd0 <_swift_bridgeObjectRetain+0x100000fd0>
100000d48:     	mov	x21, x0
100000d4c:     	mov	w25, w19
100000d50:     	cmp	w19, #0x0
100000d54:     	b.le	0x100000e00 <_main+0x168>
100000d58:     	mov	x26, #0x0               ; =0
100000d5c:     	mov	x8, x19
100000d60:     	ubfiz	x27, x8, #3, #32
100000d64:     	mov	x8, #0x848000000000     ; =145685290680320
100000d68:     	movk	x8, #0x412e, lsl #48
100000d6c:     	fmov	d8, x8
100000d70:     	mov	x8, #0x400000000000     ; =70368744177664
100000d74:     	movk	x8, #0x408f, lsl #48
100000d78:     	fmov	d9, x8
100000d7c:     	add	x1, sp, #0x20
100000d80:     	mov	w0, #0x6                ; =6
100000d84:     	bl	0x100000fb8 <_swift_bridgeObjectRetain+0x100000fb8>
100000d88:     	ldp	d0, d1, [sp, #0x20]
100000d8c:     	scvtf	d0, d0
100000d90:     	scvtf	d1, d1
100000d94:     	fdiv	d1, d1, d8
100000d98:     	fmadd	d10, d0, d9, d1
100000d9c:     	mov	x0, x22
100000da0:     	bl	0x100000b1c <_bench>
100000da4:     	mov	x24, x0
100000da8:     	add	x1, sp, #0x20
100000dac:     	mov	w0, #0x6                ; =6
100000db0:     	bl	0x100000fb8 <_swift_bridgeObjectRetain+0x100000fb8>
100000db4:     	ldp	d0, d1, [sp, #0x20]
100000db8:     	scvtf	d0, d0
100000dbc:     	scvtf	d1, d1
100000dc0:     	fdiv	d1, d1, d8
100000dc4:     	fmadd	d0, d0, d9, d1
100000dc8:     	fsub	d0, d0, d10
100000dcc:     	str	d0, [x21, x26]
100000dd0:     	cmp	w24, w20
100000dd4:     	b.ne	0x100000ee0 <_main+0x248>
100000dd8:     	add	x26, x26, #0x8
100000ddc:     	cmp	x27, x26
100000de0:     	b.ne	0x100000d7c <_main+0xe4>
100000de4:     	mov	x0, x23
100000de8:     	bl	0x100000fd0 <_swift_bridgeObjectRetain+0x100000fd0>
100000dec:     	mov	x22, x0
100000df0:     	lsl	x2, x25, #3
100000df4:     	mov	x1, x21
100000df8:     	bl	0x100000fdc <_swift_bridgeObjectRetain+0x100000fdc>
100000dfc:     	b	0x100000e0c <_main+0x174>
100000e00:     	mov	x0, x23
100000e04:     	bl	0x100000fd0 <_swift_bridgeObjectRetain+0x100000fd0>
100000e08:     	mov	x22, x0
100000e0c:     	sxtw	x1, w19
100000e10:     	adrp	x3, 0x100000000 <_swift_bridgeObjectRetain+0x100000000>
100000e14:     	add	x3, x3, #0xf1c
100000e18:     	mov	x0, x22
100000e1c:     	mov	w2, #0x8                ; =8
100000e20:     	bl	0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000e24:     	tbnz	w19, #0x0, 0x100000e44 <_main+0x1ac>
100000e28:     	asr	w8, w19, #1
100000e2c:     	add	x8, x22, w8, sxtw #3
100000e30:     	ldp	d0, d1, [x8, #-0x8]
100000e34:     	fadd	d0, d0, d1
100000e38:     	fmov	d1, #0.50000000
100000e3c:     	fmul	d0, d0, d1
100000e40:     	b	0x100000e50 <_main+0x1b8>
100000e44:     	add	w8, w19, w19, lsr #31
100000e48:     	asr	w8, w8, #1
100000e4c:     	ldr	d0, [x22, w8, sxtw #3]
100000e50:     	ldr	d1, [x22]
100000e54:     	stp	d0, d1, [sp, #0x8]
100000e58:     	str	x20, [sp]
100000e5c:     	adrp	x0, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000e60:     	add	x0, x0, #0x76
100000e64:     	bl	0x100000fe8 <_swift_bridgeObjectRetain+0x100000fe8>
100000e68:     	cmp	w19, #0x1
100000e6c:     	b.lt	0x100000ecc <_main+0x234>
100000e70:     	ldr	d0, [x21]
100000e74:     	str	d0, [sp, #0x8]
100000e78:     	adrp	x8, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000e7c:     	add	x8, x8, #0xb9
100000e80:     	str	x8, [sp]
100000e84:     	adrp	x0, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000e88:     	add	x0, x0, #0xb0
100000e8c:     	bl	0x100000fe8 <_swift_bridgeObjectRetain+0x100000fe8>
100000e90:     	cmp	w19, #0x1
100000e94:     	b.eq	0x100000ecc <_main+0x234>
100000e98:     	add	x20, x21, #0x8
100000e9c:     	sub	x21, x25, #0x1
100000ea0:     	adrp	x22, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000ea4:     	add	x22, x22, #0xb7
100000ea8:     	adrp	x19, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000eac:     	add	x19, x19, #0xb0
100000eb0:     	ldr	d0, [x20], #0x8
100000eb4:     	str	d0, [sp, #0x8]
100000eb8:     	str	x22, [sp]
100000ebc:     	mov	x0, x19
100000ec0:     	bl	0x100000fe8 <_swift_bridgeObjectRetain+0x100000fe8>
100000ec4:     	subs	x21, x21, #0x1
100000ec8:     	b.ne	0x100000eb0 <_main+0x218>
100000ecc:     	adrp	x0, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000ed0:     	add	x0, x0, #0xba
100000ed4:     	bl	0x100000ff4 <_swift_bridgeObjectRetain+0x100000ff4>
100000ed8:     	mov	w0, #0x0                ; =0
100000edc:     	b	0x100000ef4 <_main+0x25c>
100000ee0:     	stp	x24, x20, [sp]
100000ee4:     	adrp	x0, 0x100001000 <_swift_bridgeObjectRetain+0x100001000>
100000ee8:     	add	x0, x0, #0x54
100000eec:     	bl	0x100000fe8 <_swift_bridgeObjectRetain+0x100000fe8>
100000ef0:     	mov	w0, #0x3                ; =3
100000ef4:     	ldp	x29, x30, [sp, #0xa0]
100000ef8:     	ldp	x20, x19, [sp, #0x90]
100000efc:     	ldp	x22, x21, [sp, #0x80]
100000f00:     	ldp	x24, x23, [sp, #0x70]
100000f04:     	ldp	x26, x25, [sp, #0x60]
100000f08:     	ldp	x28, x27, [sp, #0x50]
100000f0c:     	ldp	d9, d8, [sp, #0x40]
100000f10:     	ldp	d11, d10, [sp, #0x30]
100000f14:     	add	sp, sp, #0xb0
100000f18:     	ret

0000000100000f1c <_cmp>:
100000f1c:     	ldr	d0, [x0]
100000f20:     	ldr	d1, [x1]
100000f24:     	fcmp	d0, d1
100000f28:     	cset	w8, gt
100000f2c:     	csinv	w0, w8, wzr, pl
100000f30:     	ret

Disassembly of section __TEXT,__stubs:

0000000100000f34 <__stubs>:
100000f34:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f38:     	ldr	x16, [x16, #0x68]
100000f3c:     	br	x16
100000f40:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f44:     	ldr	x16, [x16, #0x70]
100000f48:     	br	x16
100000f4c:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f50:     	ldr	x16, [x16, #0x78]
100000f54:     	br	x16
100000f58:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f5c:     	ldr	x16, [x16, #0x80]
100000f60:     	br	x16
100000f64:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f68:     	ldr	x16, [x16, #0x88]
100000f6c:     	br	x16
100000f70:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f74:     	ldr	x16, [x16, #0x90]
100000f78:     	br	x16
100000f7c:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f80:     	ldr	x16, [x16, #0x98]
100000f84:     	br	x16
100000f88:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f8c:     	ldr	x16, [x16, #0xa8]
100000f90:     	br	x16
100000f94:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000f98:     	ldr	x16, [x16, #0x10]
100000f9c:     	br	x16
100000fa0:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fa4:     	ldr	x16, [x16, #0x20]
100000fa8:     	br	x16
100000fac:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fb0:     	ldr	x16, [x16, #0x28]
100000fb4:     	br	x16
100000fb8:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fbc:     	ldr	x16, [x16, #0x30]
100000fc0:     	br	x16
100000fc4:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fc8:     	ldr	x16, [x16, #0x38]
100000fcc:     	br	x16
100000fd0:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fd4:     	ldr	x16, [x16, #0x40]
100000fd8:     	br	x16
100000fdc:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fe0:     	ldr	x16, [x16, #0x48]
100000fe4:     	br	x16
100000fe8:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000fec:     	ldr	x16, [x16, #0x50]
100000ff0:     	br	x16
100000ff4:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000ff8:     	ldr	x16, [x16, #0x58]
100000ffc:     	br	x16
100001000:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001004:     	ldr	x16, [x16, #0x60]
100001008:     	br	x16
10000100c:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001010:     	ldr	x16, [x16, #0xc8]
100001014:     	br	x16
100001018:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
10000101c:     	ldr	x16, [x16, #0xd0]
100001020:     	br	x16
