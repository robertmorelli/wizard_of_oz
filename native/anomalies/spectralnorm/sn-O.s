
swift-O/bench:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000005d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF>:
1000005d8:     	stp	x22, x21, [sp, #-0x30]!
1000005dc:     	stp	x20, x19, [sp, #0x10]
1000005e0:     	stp	x29, x30, [sp, #0x20]
1000005e4:     	add	x29, sp, #0x20
1000005e8:     	tbnz	x0, #0x3f, 0x1000006e8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x110>
1000005ec:     	mov	x19, x0
1000005f0:     	cbz	x0, 0x1000006b8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xe0>
1000005f4:     	mov	x22, x1
1000005f8:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000005fc:     	ldr	x1, [x1, #0xa0]
100000600:     	mov	x0, x19
100000604:     	bl	0x1000010e8 <_swift_bridgeObjectRetain+0x1000010e8>
100000608:     	mov	x20, x0
10000060c:     	str	x19, [x0, #0x10]
100000610:     	add	x21, x0, #0x20
100000614:     	lsl	x1, x19, #3
100000618:     	mov	x0, x21
10000061c:     	bl	0x100001124 <_swift_bridgeObjectRetain+0x100001124>
100000620:     	ldr	x8, [x22, #0x10]
100000624:     	cmp	x19, x8
100000628:     	b.hi	0x1000006ec <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x114>
10000062c:     	mov	x9, #0x0                ; =0
100000630:     	add	x8, x22, #0x20
100000634:     	mov	x10, #0x7fffffffffffffff ; =9223372036854775807
100000638:     	fmov	d0, #1.00000000
10000063c:     	mov	x12, #0x0               ; =0
100000640:     	add	x11, x9, #0x1
100000644:     	movi.2d	v1, #0000000000000000
100000648:     	adds	x13, x9, x12
10000064c:     	b.vs	0x1000006d4 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xfc>
100000650:     	cmp	x10, x12
100000654:     	b.eq	0x1000006d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x100>
100000658:     	add	x15, x13, #0x1
10000065c:     	mul	x14, x13, x15
100000660:     	smulh	x13, x13, x15
100000664:     	cmp	x13, x14, asr #63
100000668:     	b.ne	0x1000006dc <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x104>
10000066c:     	add	x13, x14, x14, lsr #63
100000670:     	adds	x13, x11, x13, asr #1
100000674:     	b.vs	0x1000006e0 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x108>
100000678:     	scvtf	d2, x13
10000067c:     	ldr	d3, [x8, x12, lsl #3]
100000680:     	add	x12, x12, #0x1
100000684:     	fdiv	d2, d0, d2
100000688:     	fmul	d2, d2, d3
10000068c:     	fadd	d1, d1, d2
100000690:     	cmp	x19, x12
100000694:     	b.ne	0x100000648 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x70>
100000698:     	cmp	x9, x19
10000069c:     	b.hs	0x1000006e4 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x10c>
1000006a0:     	str	d1, [x21, x9, lsl #3]
1000006a4:     	sub	x10, x10, #0x1
1000006a8:     	mov	x9, x11
1000006ac:     	cmp	x11, x19
1000006b0:     	b.ne	0x10000063c <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0x64>
1000006b4:     	b	0x1000006c0 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF+0xe8>
1000006b8:     	adrp	x20, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000006bc:     	ldr	x20, [x20, #0xc0]
1000006c0:     	mov	x0, x20
1000006c4:     	ldp	x29, x30, [sp, #0x20]
1000006c8:     	ldp	x20, x19, [sp, #0x10]
1000006cc:     	ldp	x22, x21, [sp], #0x30
1000006d0:     	ret
1000006d4:     	brk	#0x1
1000006d8:     	brk	#0x1
1000006dc:     	brk	#0x1
1000006e0:     	brk	#0x1
1000006e4:     	brk	#0x1
1000006e8:     	brk	#0x1
1000006ec:     	brk	#0x1

00000001000006f0 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF>:
1000006f0:     	stp	x22, x21, [sp, #-0x30]!
1000006f4:     	stp	x20, x19, [sp, #0x10]
1000006f8:     	stp	x29, x30, [sp, #0x20]
1000006fc:     	add	x29, sp, #0x20
100000700:     	tbnz	x0, #0x3f, 0x100000804 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x114>
100000704:     	mov	x19, x0
100000708:     	cbz	x0, 0x1000007d4 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xe4>
10000070c:     	mov	x22, x1
100000710:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000714:     	ldr	x1, [x1, #0xa0]
100000718:     	mov	x0, x19
10000071c:     	bl	0x1000010e8 <_swift_bridgeObjectRetain+0x1000010e8>
100000720:     	mov	x20, x0
100000724:     	str	x19, [x0, #0x10]
100000728:     	add	x21, x0, #0x20
10000072c:     	lsl	x1, x19, #3
100000730:     	mov	x0, x21
100000734:     	bl	0x100001124 <_swift_bridgeObjectRetain+0x100001124>
100000738:     	ldr	x8, [x22, #0x10]
10000073c:     	cmp	x19, x8
100000740:     	b.hi	0x100000808 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x118>
100000744:     	mov	x9, #0x0                ; =0
100000748:     	add	x8, x22, #0x20
10000074c:     	mov	x10, #0x7fffffffffffffff ; =9223372036854775807
100000750:     	fmov	d0, #1.00000000
100000754:     	mov	x12, #0x0               ; =0
100000758:     	add	x11, x9, #0x1
10000075c:     	movi.2d	v1, #0000000000000000
100000760:     	adds	x13, x12, x9
100000764:     	b.vs	0x1000007f0 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x100>
100000768:     	cmp	x10, x12
10000076c:     	b.eq	0x1000007f4 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x104>
100000770:     	add	x15, x13, #0x1
100000774:     	mul	x14, x13, x15
100000778:     	smulh	x13, x13, x15
10000077c:     	cmp	x13, x14, asr #63
100000780:     	b.ne	0x1000007f8 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x108>
100000784:     	add	x13, x12, #0x1
100000788:     	add	x14, x14, x14, lsr #63
10000078c:     	adds	x14, x13, x14, asr #1
100000790:     	b.vs	0x1000007fc <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x10c>
100000794:     	scvtf	d2, x14
100000798:     	fdiv	d2, d0, d2
10000079c:     	ldr	d3, [x8, x12, lsl #3]
1000007a0:     	fmul	d2, d2, d3
1000007a4:     	fadd	d1, d1, d2
1000007a8:     	mov	x12, x13
1000007ac:     	cmp	x19, x13
1000007b0:     	b.ne	0x100000760 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x70>
1000007b4:     	cmp	x9, x19
1000007b8:     	b.hs	0x100000800 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x110>
1000007bc:     	str	d1, [x21, x9, lsl #3]
1000007c0:     	sub	x10, x10, #0x1
1000007c4:     	mov	x9, x11
1000007c8:     	cmp	x11, x19
1000007cc:     	b.ne	0x100000754 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0x64>
1000007d0:     	b	0x1000007dc <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF+0xec>
1000007d4:     	adrp	x20, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000007d8:     	ldr	x20, [x20, #0xc0]
1000007dc:     	mov	x0, x20
1000007e0:     	ldp	x29, x30, [sp, #0x20]
1000007e4:     	ldp	x20, x19, [sp, #0x10]
1000007e8:     	ldp	x22, x21, [sp], #0x30
1000007ec:     	ret
1000007f0:     	brk	#0x1
1000007f4:     	brk	#0x1
1000007f8:     	brk	#0x1
1000007fc:     	brk	#0x1
100000800:     	brk	#0x1
100000804:     	brk	#0x1
100000808:     	brk	#0x1

000000010000080c <_$s12SpectralNorm11approximateySdSiF>:
10000080c:     	stp	d9, d8, [sp, #-0x50]!
100000810:     	stp	x24, x23, [sp, #0x10]
100000814:     	stp	x22, x21, [sp, #0x20]
100000818:     	stp	x20, x19, [sp, #0x30]
10000081c:     	stp	x29, x30, [sp, #0x40]
100000820:     	add	x29, sp, #0x40
100000824:     	tbnz	x0, #0x3f, 0x100000a50 <_$s12SpectralNorm11approximateySdSiF+0x244>
100000828:     	mov	x21, x0
10000082c:     	cbz	x0, 0x100000868 <_$s12SpectralNorm11approximateySdSiF+0x5c>
100000830:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000834:     	ldr	x1, [x1, #0xa0]
100000838:     	mov	x0, x21
10000083c:     	bl	0x1000010e8 <_swift_bridgeObjectRetain+0x1000010e8>
100000840:     	mov	x19, x0
100000844:     	mov	x8, #0x0                ; =0
100000848:     	str	x21, [x0, #0x10]
10000084c:     	mov	x9, #0x3ff0000000000000 ; =4607182418800017408
100000850:     	add	x10, x19, x8, lsl #3
100000854:     	str	x9, [x10, #0x20]
100000858:     	add	x8, x8, #0x1
10000085c:     	cmp	x8, x21
100000860:     	b.lo	0x100000850 <_$s12SpectralNorm11approximateySdSiF+0x44>
100000864:     	b	0x100000870 <_$s12SpectralNorm11approximateySdSiF+0x64>
100000868:     	adrp	x19, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
10000086c:     	ldr	x19, [x19, #0xc0]
100000870:     	adrp	x20, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000874:     	ldr	x20, [x20, #0xc0]
100000878:     	mov	w24, #0xa               ; =10
10000087c:     	mov	x22, x19
100000880:     	mov	x19, x20
100000884:     	mov	x0, x21
100000888:     	mov	x1, x22
10000088c:     	bl	0x1000005d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF>
100000890:     	mov	x23, x0
100000894:     	mov	x0, x21
100000898:     	mov	x1, x23
10000089c:     	bl	0x1000006f0 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF>
1000008a0:     	mov	x20, x0
1000008a4:     	mov	x0, x19
1000008a8:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
1000008ac:     	mov	x0, x23
1000008b0:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
1000008b4:     	mov	x0, x21
1000008b8:     	mov	x1, x20
1000008bc:     	bl	0x1000005d8 <_$s12SpectralNorm10multiplyAvySaySdGSi_ACtF>
1000008c0:     	mov	x23, x0
1000008c4:     	mov	x0, x21
1000008c8:     	mov	x1, x23
1000008cc:     	bl	0x1000006f0 <_$s12SpectralNorm11multiplyAtvySaySdGSi_ACtF>
1000008d0:     	mov	x19, x0
1000008d4:     	mov	x0, x22
1000008d8:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
1000008dc:     	mov	x0, x23
1000008e0:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
1000008e4:     	subs	x24, x24, #0x1
1000008e8:     	b.ne	0x10000087c <_$s12SpectralNorm11approximateySdSiF+0x70>
1000008ec:     	cbz	x21, 0x100000920 <_$s12SpectralNorm11approximateySdSiF+0x114>
1000008f0:     	ldr	x8, [x19, #0x10]
1000008f4:     	cmp	x21, x8
1000008f8:     	b.hi	0x100000a54 <_$s12SpectralNorm11approximateySdSiF+0x248>
1000008fc:     	ldr	x8, [x20, #0x10]
100000900:     	cmp	x21, x8
100000904:     	b.hi	0x100000a58 <_$s12SpectralNorm11approximateySdSiF+0x24c>
100000908:     	cmp	x21, #0x8
10000090c:     	b.hs	0x10000092c <_$s12SpectralNorm11approximateySdSiF+0x120>
100000910:     	mov	x8, #0x0                ; =0
100000914:     	movi.2d	v0, #0000000000000000
100000918:     	movi.2d	v1, #0000000000000000
10000091c:     	b	0x1000009ec <_$s12SpectralNorm11approximateySdSiF+0x1e0>
100000920:     	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
100000924:     	fmov	d8, x8
100000928:     	b	0x100000a24 <_$s12SpectralNorm11approximateySdSiF+0x218>
10000092c:     	and	x8, x21, #0x7ffffffffffffff8
100000930:     	add	x9, x19, #0x50
100000934:     	add	x10, x20, #0x30
100000938:     	movi.2d	v0, #0000000000000000
10000093c:     	mov	x11, x8
100000940:     	movi.2d	v1, #0000000000000000
100000944:     	ldp	q2, q3, [x9, #-0x30]
100000948:     	ldp	q4, q5, [x9, #-0x10]
10000094c:     	ldp	q6, q7, [x10, #-0x10]
100000950:     	ldp	q16, q17, [x10, #0x10]
100000954:     	fmul.2d	v2, v2, v6
100000958:     	mov	d18, v2[1]
10000095c:     	fmul.2d	v3, v3, v7
100000960:     	mov	d19, v3[1]
100000964:     	fmul.2d	v4, v4, v16
100000968:     	mov	d20, v4[1]
10000096c:     	fmul.2d	v5, v5, v17
100000970:     	mov	d21, v5[1]
100000974:     	fmul.2d	v6, v6, v6
100000978:     	mov	d22, v6[1]
10000097c:     	fmul.2d	v7, v7, v7
100000980:     	mov	d23, v7[1]
100000984:     	fmul.2d	v16, v16, v16
100000988:     	mov	d24, v16[1]
10000098c:     	fmul.2d	v17, v17, v17
100000990:     	mov	d25, v17[1]
100000994:     	fadd	d0, d0, d6
100000998:     	fadd	d0, d0, d22
10000099c:     	fadd	d0, d0, d7
1000009a0:     	fadd	d0, d0, d23
1000009a4:     	fadd	d0, d0, d16
1000009a8:     	fadd	d0, d0, d24
1000009ac:     	fadd	d0, d0, d17
1000009b0:     	fadd	d0, d0, d25
1000009b4:     	fadd	d1, d1, d2
1000009b8:     	fadd	d1, d1, d18
1000009bc:     	fadd	d1, d1, d3
1000009c0:     	fadd	d1, d1, d19
1000009c4:     	fadd	d1, d1, d4
1000009c8:     	fadd	d1, d1, d20
1000009cc:     	fadd	d1, d1, d5
1000009d0:     	fadd	d1, d1, d21
1000009d4:     	add	x9, x9, #0x40
1000009d8:     	add	x10, x10, #0x40
1000009dc:     	subs	x11, x11, #0x8
1000009e0:     	b.ne	0x100000944 <_$s12SpectralNorm11approximateySdSiF+0x138>
1000009e4:     	cmp	x21, x8
1000009e8:     	b.eq	0x100000a20 <_$s12SpectralNorm11approximateySdSiF+0x214>
1000009ec:     	sub	x9, x21, x8
1000009f0:     	lsl	x8, x8, #3
1000009f4:     	add	x10, x8, #0x20
1000009f8:     	add	x8, x20, x10
1000009fc:     	add	x10, x19, x10
100000a00:     	ldr	d2, [x10], #0x8
100000a04:     	ldr	d3, [x8], #0x8
100000a08:     	fmul	d2, d2, d3
100000a0c:     	fadd	d1, d1, d2
100000a10:     	fmul	d2, d3, d3
100000a14:     	fadd	d0, d0, d2
100000a18:     	subs	x9, x9, #0x1
100000a1c:     	b.ne	0x100000a00 <_$s12SpectralNorm11approximateySdSiF+0x1f4>
100000a20:     	fdiv	d8, d1, d0
100000a24:     	mov	x0, x20
100000a28:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
100000a2c:     	mov	x0, x19
100000a30:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
100000a34:     	fsqrt	d0, d8
100000a38:     	ldp	x29, x30, [sp, #0x40]
100000a3c:     	ldp	x20, x19, [sp, #0x30]
100000a40:     	ldp	x22, x21, [sp, #0x20]
100000a44:     	ldp	x24, x23, [sp, #0x10]
100000a48:     	ldp	d9, d8, [sp], #0x50
100000a4c:     	ret
100000a50:     	brk	#0x1
100000a54:     	brk	#0x1
100000a58:     	brk	#0x1

0000000100000a5c <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF>:
100000a5c:     	sub	sp, sp, #0x30
100000a60:     	stp	d9, d8, [sp, #0x10]
100000a64:     	stp	x29, x30, [sp, #0x20]
100000a68:     	add	x29, sp, #0x20
100000a6c:     	mov.16b	v8, v0
100000a70:     	scvtf	d0, x0
100000a74:     	bl	0x10000110c <_swift_bridgeObjectRetain+0x10000110c>
100000a78:     	fmul	d1, d8, d0
100000a7c:     	fmov	d2, #0.50000000
100000a80:     	fadd	d1, d1, d2
100000a84:     	fmov	x8, d1
100000a88:     	and	x8, x8, #0x7fffffffffffffff
100000a8c:     	mov	x9, #0x7fefffffffffffff ; =9218868437227405311
100000a90:     	cmp	x8, x9
100000a94:     	b.gt	0x100000afc <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF+0xa0>
100000a98:     	mov	x8, #0x1                ; =1
100000a9c:     	movk	x8, #0xc3e0, lsl #48
100000aa0:     	fmov	d2, x8
100000aa4:     	fcmp	d1, d2
100000aa8:     	b.le	0x100000b00 <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF+0xa4>
100000aac:     	mov	x8, #0x43e0000000000000 ; =4890909195324358656
100000ab0:     	fmov	d2, x8
100000ab4:     	fcmp	d1, d2
100000ab8:     	b.pl	0x100000b04 <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF+0xa8>
100000abc:     	fcvtzs	d1, d1
100000ac0:     	scvtf	d1, d1
100000ac4:     	mov	x8, #-0x2000000000000000 ; =-2305843009213693952
100000ac8:     	stp	xzr, x8, [sp]
100000acc:     	fdiv	d0, d1, d0
100000ad0:     	adrp	x1, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000ad4:     	ldr	x1, [x1, #0xb0]
100000ad8:     	adrp	x2, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000adc:     	ldr	x2, [x2, #0xb8]
100000ae0:     	mov	x0, sp
100000ae4:     	bl	0x1000010f4 <_swift_bridgeObjectRetain+0x1000010f4>
100000ae8:     	ldp	x0, x1, [sp]
100000aec:     	ldp	x29, x30, [sp, #0x20]
100000af0:     	ldp	d9, d8, [sp, #0x10]
100000af4:     	add	sp, sp, #0x30
100000af8:     	ret
100000afc:     	brk	#0x1
100000b00:     	brk	#0x1
100000b04:     	brk	#0x1

0000000100000b08 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF>:
100000b08:     	sub	sp, sp, #0x80
100000b0c:     	stp	x28, x27, [sp, #0x20]
100000b10:     	stp	x26, x25, [sp, #0x30]
100000b14:     	stp	x24, x23, [sp, #0x40]
100000b18:     	stp	x22, x21, [sp, #0x50]
100000b1c:     	stp	x20, x19, [sp, #0x60]
100000b20:     	stp	x29, x30, [sp, #0x70]
100000b24:     	add	x29, sp, #0x70
100000b28:     	mov	x19, x0
100000b2c:     	and	x8, x1, #0xffffffffffff
100000b30:     	ubfx	x9, x2, #56, #4
100000b34:     	tst	x2, #0x2000000000000000
100000b38:     	csel	x23, x8, x9, eq
100000b3c:     	cbz	x23, 0x100000c74 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x16c>
100000b40:     	mov	x20, x2
100000b44:     	mov	x21, x1
100000b48:     	lsl	x24, x23, #2
100000b4c:     	tst	x2, #0x1000000000000000
100000b50:     	ubfx	x8, x1, #59, #1
100000b54:     	csinc	w8, w8, wzr, ne
100000b58:     	mov	w9, #0x4                ; =4
100000b5c:     	lsl	x25, x9, x8
100000b60:     	and	x8, x2, #0xffffffffffffff
100000b64:     	str	x8, [sp, #0x8]
100000b68:     	and	x8, x2, #0xfffffffffffffff
100000b6c:     	add	x27, x8, #0x20
100000b70:     	mov	w0, #0xf                ; =15
100000b74:     	mov	w28, #0x193             ; =403
100000b78:     	movk	w28, #0x100, lsl #16
100000b7c:     	b	0x100000ba4 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x9c>
100000b80:     	and	x8, x0, #0xffffffffffff0000
100000b84:     	mov	w9, #0x4                ; =4
100000b88:     	movk	w9, #0x1, lsl #16
100000b8c:     	add	x0, x8, x9
100000b90:     	and	w8, w22, #0xff
100000b94:     	eor	w8, w19, w8
100000b98:     	mul	w19, w8, w28
100000b9c:     	cmp	x24, x0, lsr #14
100000ba0:     	b.eq	0x100000c74 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x16c>
100000ba4:     	and	x26, x0, #0xc
100000ba8:     	mov	x8, x0
100000bac:     	cmp	x26, x25
100000bb0:     	b.eq	0x100000c20 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x118>
100000bb4:     	lsr	x22, x8, #16
100000bb8:     	cmp	x22, x23
100000bbc:     	b.hs	0x100000c98 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x190>
100000bc0:     	tbnz	x20, #0x3c, 0x100000c3c <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x134>
100000bc4:     	tbnz	x20, #0x3d, 0x100000bec <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xe4>
100000bc8:     	mov	x8, x27
100000bcc:     	tbnz	x21, #0x3c, 0x100000bf8 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xf0>
100000bd0:     	str	x0, [sp]
100000bd4:     	mov	x0, x21
100000bd8:     	mov	x1, x20
100000bdc:     	bl	0x100001100 <_swift_bridgeObjectRetain+0x100001100>
100000be0:     	mov	x8, x0
100000be4:     	ldr	x0, [sp]
100000be8:     	b	0x100000bf8 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xf0>
100000bec:     	ldr	x8, [sp, #0x8]
100000bf0:     	stp	x21, x8, [sp, #0x10]
100000bf4:     	add	x8, sp, #0x10
100000bf8:     	ldrb	w22, [x8, x22]
100000bfc:     	cmp	x26, x25
100000c00:     	b.eq	0x100000c60 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x158>
100000c04:     	tbz	x20, #0x3c, 0x100000b80 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x78>
100000c08:     	cmp	x23, x0, lsr #16
100000c0c:     	b.ls	0x100000c9c <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x194>
100000c10:     	mov	x1, x21
100000c14:     	mov	x2, x20
100000c18:     	bl	0x1000010b8 <_swift_bridgeObjectRetain+0x1000010b8>
100000c1c:     	b	0x100000b90 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x88>
100000c20:     	mov	x22, x0
100000c24:     	mov	x1, x21
100000c28:     	mov	x2, x20
100000c2c:     	bl	0x100000d98 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF>
100000c30:     	mov	x8, x0
100000c34:     	mov	x0, x22
100000c38:     	b	0x100000bb4 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xac>
100000c3c:     	str	x0, [sp]
100000c40:     	mov	x0, x8
100000c44:     	mov	x1, x21
100000c48:     	mov	x2, x20
100000c4c:     	bl	0x1000010d0 <_swift_bridgeObjectRetain+0x1000010d0>
100000c50:     	mov	x22, x0
100000c54:     	ldr	x0, [sp]
100000c58:     	cmp	x26, x25
100000c5c:     	b.ne	0x100000c04 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0xfc>
100000c60:     	mov	x1, x21
100000c64:     	mov	x2, x20
100000c68:     	bl	0x100000d98 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF>
100000c6c:     	tbz	x20, #0x3c, 0x100000b80 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x78>
100000c70:     	b	0x100000c08 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF+0x100>
100000c74:     	mov	x0, x19
100000c78:     	ldp	x29, x30, [sp, #0x70]
100000c7c:     	ldp	x20, x19, [sp, #0x60]
100000c80:     	ldp	x22, x21, [sp, #0x50]
100000c84:     	ldp	x24, x23, [sp, #0x40]
100000c88:     	ldp	x26, x25, [sp, #0x30]
100000c8c:     	ldp	x28, x27, [sp, #0x20]
100000c90:     	add	sp, sp, #0x80
100000c94:     	ret
100000c98:     	brk	#0x1
100000c9c:     	brk	#0x1

0000000100000ca0 <_bench>:
100000ca0:     	sub	sp, sp, #0x30
100000ca4:     	stp	x20, x19, [sp, #0x10]
100000ca8:     	stp	x29, x30, [sp, #0x20]
100000cac:     	add	x29, sp, #0x20
100000cb0:     	sxtw	x0, w0
100000cb4:     	bl	0x10000080c <_$s12SpectralNorm11approximateySdSiF>
100000cb8:     	mov	w0, #0x9                ; =9
100000cbc:     	bl	0x100000a5c <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF>
100000cc0:     	mov	x19, x1
100000cc4:     	stp	x0, x1, [sp]
100000cc8:     	mov	x0, x1
100000ccc:     	bl	0x100001190 <_swift_bridgeObjectRetain+0x100001190>
100000cd0:     	mov	x20, sp
100000cd4:     	mov	w0, #0xa                ; =10
100000cd8:     	mov	x1, #-0x1f00000000000000 ; =-2233785415175766016
100000cdc:     	bl	0x1000010ac <_swift_bridgeObjectRetain+0x1000010ac>
100000ce0:     	mov	x0, x19
100000ce4:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
100000ce8:     	ldp	x1, x19, [sp]
100000cec:     	mov	w0, #0x9dc5             ; =40389
100000cf0:     	movk	w0, #0x811c, lsl #16
100000cf4:     	mov	x2, x19
100000cf8:     	bl	0x100000b08 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF>
100000cfc:     	mov	x20, x0
100000d00:     	mov	x0, x19
100000d04:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
100000d08:     	mov	x0, x20
100000d0c:     	ldp	x29, x30, [sp, #0x20]
100000d10:     	ldp	x20, x19, [sp, #0x10]
100000d14:     	add	sp, sp, #0x30
100000d18:     	ret

0000000100000d1c <_$s12SpectralNorm5benchys6UInt32Vs5Int32VF>:
100000d1c:     	sub	sp, sp, #0x30
100000d20:     	stp	x20, x19, [sp, #0x10]
100000d24:     	stp	x29, x30, [sp, #0x20]
100000d28:     	add	x29, sp, #0x20
100000d2c:     	sxtw	x0, w0
100000d30:     	bl	0x10000080c <_$s12SpectralNorm11approximateySdSiF>
100000d34:     	mov	w0, #0x9                ; =9
100000d38:     	bl	0x100000a5c <_$s12SpectralNorm11roundDouble_9precisionSSSd_SitF>
100000d3c:     	mov	x19, x1
100000d40:     	stp	x0, x1, [sp]
100000d44:     	mov	x0, x1
100000d48:     	bl	0x100001190 <_swift_bridgeObjectRetain+0x100001190>
100000d4c:     	mov	x20, sp
100000d50:     	mov	w0, #0xa                ; =10
100000d54:     	mov	x1, #-0x1f00000000000000 ; =-2233785415175766016
100000d58:     	bl	0x1000010ac <_swift_bridgeObjectRetain+0x1000010ac>
100000d5c:     	mov	x0, x19
100000d60:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
100000d64:     	ldp	x1, x19, [sp]
100000d68:     	mov	w0, #0x9dc5             ; =40389
100000d6c:     	movk	w0, #0x811c, lsl #16
100000d70:     	mov	x2, x19
100000d74:     	bl	0x100000b08 <_$s12SpectralNorm3fnvys6UInt32VAD_SStF>
100000d78:     	mov	x20, x0
100000d7c:     	mov	x0, x19
100000d80:     	bl	0x100001184 <_swift_bridgeObjectRetain+0x100001184>
100000d84:     	mov	x0, x20
100000d88:     	ldp	x29, x30, [sp, #0x20]
100000d8c:     	ldp	x20, x19, [sp, #0x10]
100000d90:     	add	sp, sp, #0x30
100000d94:     	ret

0000000100000d98 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF>:
100000d98:     	stp	x20, x19, [sp, #-0x20]!
100000d9c:     	stp	x29, x30, [sp, #0x10]
100000da0:     	add	x29, sp, #0x10
100000da4:     	mov	x3, x2
100000da8:     	mov	x2, x1
100000dac:     	mov	x19, x0
100000db0:     	lsr	x1, x0, #16
100000db4:     	ubfx	x20, x0, #14, #2
100000db8:     	tbz	x3, #0x3c, 0x100000de4 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF+0x4c>
100000dbc:     	tbnz	x2, #0x3b, 0x100000de4 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF+0x4c>
100000dc0:     	mov	w0, #0xf                ; =15
100000dc4:     	bl	0x1000010c4 <_swift_bridgeObjectRetain+0x1000010c4>
100000dc8:     	add	x8, x0, x20, lsl #16
100000dcc:     	and	x8, x8, #0xffffffffffff0000
100000dd0:     	bfxil	x0, x19, #0, #2
100000dd4:     	cmp	x20, #0x0
100000dd8:     	csel	x8, x8, x0, ne
100000ddc:     	orr	x0, x8, #0x8
100000de0:     	b	0x100000e04 <_$ss11_StringGutsV27_slowEnsureMatchingEncodingySS5IndexVAEF+0x6c>
100000de4:     	mov	w0, #0xf                ; =15
100000de8:     	bl	0x1000010dc <_swift_bridgeObjectRetain+0x1000010dc>
100000dec:     	add	x8, x0, x20, lsl #16
100000df0:     	and	x8, x8, #0xffffffffffff0000
100000df4:     	bfxil	x0, x19, #0, #2
100000df8:     	cmp	x20, #0x0
100000dfc:     	csel	x8, x8, x0, ne
100000e00:     	orr	x0, x8, #0x4
100000e04:     	ldp	x29, x30, [sp, #0x10]
100000e08:     	ldp	x20, x19, [sp], #0x20
100000e0c:     	ret

0000000100000e10 <_main>:
100000e10:     	sub	sp, sp, #0xb0
100000e14:     	stp	d11, d10, [sp, #0x30]
100000e18:     	stp	d9, d8, [sp, #0x40]
100000e1c:     	stp	x28, x27, [sp, #0x50]
100000e20:     	stp	x26, x25, [sp, #0x60]
100000e24:     	stp	x24, x23, [sp, #0x70]
100000e28:     	stp	x22, x21, [sp, #0x80]
100000e2c:     	stp	x20, x19, [sp, #0x90]
100000e30:     	stp	x29, x30, [sp, #0xa0]
100000e34:     	add	x29, sp, #0xa0
100000e38:     	cmp	w0, #0x3
100000e3c:     	b.gt	0x100000e68 <_main+0x58>
100000e40:     	adrp	x8, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100000e44:     	ldr	x8, [x8, #0x18]
100000e48:     	ldr	x3, [x8]
100000e4c:     	adrp	x0, 0x100001000 <_main+0x1f0>
100000e50:     	add	x0, x0, #0x19e
100000e54:     	mov	w1, #0x21               ; =33
100000e58:     	mov	w2, #0x1                ; =1
100000e5c:     	bl	0x10000113c <_swift_bridgeObjectRetain+0x10000113c>
100000e60:     	mov	w0, #0x2                ; =2
100000e64:     	b	0x10000106c <_main+0x25c>
100000e68:     	ldr	x0, [x1, #0x8]
100000e6c:     	mov	x20, x1
100000e70:     	bl	0x100001118 <_swift_bridgeObjectRetain+0x100001118>
100000e74:     	mov	x22, x0
100000e78:     	ldr	x0, [x20, #0x10]
100000e7c:     	bl	0x100001118 <_swift_bridgeObjectRetain+0x100001118>
100000e80:     	mov	x19, x0
100000e84:     	ldr	x0, [x20, #0x18]
100000e88:     	bl	0x100001118 <_swift_bridgeObjectRetain+0x100001118>
100000e8c:     	mov	x21, x0
100000e90:     	mov	x0, x22
100000e94:     	bl	0x100000ca0 <_bench>
100000e98:     	mov	x20, x0
100000e9c:     	cmp	w21, #0x1
100000ea0:     	b.lt	0x100000eb4 <_main+0xa4>
100000ea4:     	mov	x0, x22
100000ea8:     	bl	0x100000ca0 <_bench>
100000eac:     	subs	w21, w21, #0x1
100000eb0:     	b.ne	0x100000ea4 <_main+0x94>
100000eb4:     	sbfiz	x23, x19, #3, #32
100000eb8:     	mov	x0, x23
100000ebc:     	bl	0x100001148 <_swift_bridgeObjectRetain+0x100001148>
100000ec0:     	mov	x21, x0
100000ec4:     	mov	w25, w19
100000ec8:     	cmp	w19, #0x0
100000ecc:     	b.le	0x100000f78 <_main+0x168>
100000ed0:     	mov	x26, #0x0               ; =0
100000ed4:     	mov	x8, x19
100000ed8:     	ubfiz	x27, x8, #3, #32
100000edc:     	mov	x8, #0x848000000000     ; =145685290680320
100000ee0:     	movk	x8, #0x412e, lsl #48
100000ee4:     	fmov	d8, x8
100000ee8:     	mov	x8, #0x400000000000     ; =70368744177664
100000eec:     	movk	x8, #0x408f, lsl #48
100000ef0:     	fmov	d9, x8
100000ef4:     	add	x1, sp, #0x20
100000ef8:     	mov	w0, #0x6                ; =6
100000efc:     	bl	0x100001130 <_swift_bridgeObjectRetain+0x100001130>
100000f00:     	ldp	d0, d1, [sp, #0x20]
100000f04:     	scvtf	d0, d0
100000f08:     	scvtf	d1, d1
100000f0c:     	fdiv	d1, d1, d8
100000f10:     	fmadd	d10, d0, d9, d1
100000f14:     	mov	x0, x22
100000f18:     	bl	0x100000ca0 <_bench>
100000f1c:     	mov	x24, x0
100000f20:     	add	x1, sp, #0x20
100000f24:     	mov	w0, #0x6                ; =6
100000f28:     	bl	0x100001130 <_swift_bridgeObjectRetain+0x100001130>
100000f2c:     	ldp	d0, d1, [sp, #0x20]
100000f30:     	scvtf	d0, d0
100000f34:     	scvtf	d1, d1
100000f38:     	fdiv	d1, d1, d8
100000f3c:     	fmadd	d0, d0, d9, d1
100000f40:     	fsub	d0, d0, d10
100000f44:     	str	d0, [x21, x26]
100000f48:     	cmp	w24, w20
100000f4c:     	b.ne	0x100001058 <_main+0x248>
100000f50:     	add	x26, x26, #0x8
100000f54:     	cmp	x27, x26
100000f58:     	b.ne	0x100000ef4 <_main+0xe4>
100000f5c:     	mov	x0, x23
100000f60:     	bl	0x100001148 <_swift_bridgeObjectRetain+0x100001148>
100000f64:     	mov	x22, x0
100000f68:     	lsl	x2, x25, #3
100000f6c:     	mov	x1, x21
100000f70:     	bl	0x100001154 <_swift_bridgeObjectRetain+0x100001154>
100000f74:     	b	0x100000f84 <_main+0x174>
100000f78:     	mov	x0, x23
100000f7c:     	bl	0x100001148 <_swift_bridgeObjectRetain+0x100001148>
100000f80:     	mov	x22, x0
100000f84:     	sxtw	x1, w19
100000f88:     	adrp	x3, 0x100001000 <_main+0x1f0>
100000f8c:     	add	x3, x3, #0x94
100000f90:     	mov	x0, x22
100000f94:     	mov	w2, #0x8                ; =8
100000f98:     	bl	0x100001178 <_swift_bridgeObjectRetain+0x100001178>
100000f9c:     	tbnz	w19, #0x0, 0x100000fbc <_main+0x1ac>
100000fa0:     	asr	w8, w19, #1
100000fa4:     	add	x8, x22, w8, sxtw #3
100000fa8:     	ldp	d0, d1, [x8, #-0x8]
100000fac:     	fadd	d0, d0, d1
100000fb0:     	fmov	d1, #0.50000000
100000fb4:     	fmul	d0, d0, d1
100000fb8:     	b	0x100000fc8 <_main+0x1b8>
100000fbc:     	add	w8, w19, w19, lsr #31
100000fc0:     	asr	w8, w8, #1
100000fc4:     	ldr	d0, [x22, w8, sxtw #3]
100000fc8:     	ldr	d1, [x22]
100000fcc:     	stp	d0, d1, [sp, #0x8]
100000fd0:     	str	x20, [sp]
100000fd4:     	adrp	x0, 0x100001000 <_main+0x1f0>
100000fd8:     	add	x0, x0, #0x1e2
100000fdc:     	bl	0x100001160 <_swift_bridgeObjectRetain+0x100001160>
100000fe0:     	cmp	w19, #0x1
100000fe4:     	b.lt	0x100001044 <_main+0x234>
100000fe8:     	ldr	d0, [x21]
100000fec:     	str	d0, [sp, #0x8]
100000ff0:     	adrp	x8, 0x100001000 <_main+0x1f0>
100000ff4:     	add	x8, x8, #0x225
100000ff8:     	str	x8, [sp]
100000ffc:     	adrp	x0, 0x100001000 <_main+0x1f0>
100001000:     	add	x0, x0, #0x21c
100001004:     	bl	0x100001160 <_swift_bridgeObjectRetain+0x100001160>
100001008:     	cmp	w19, #0x1
10000100c:     	b.eq	0x100001044 <_main+0x234>
100001010:     	add	x20, x21, #0x8
100001014:     	sub	x21, x25, #0x1
100001018:     	adrp	x22, 0x100001000 <_main+0x1f0>
10000101c:     	add	x22, x22, #0x223
100001020:     	adrp	x19, 0x100001000 <_main+0x1f0>
100001024:     	add	x19, x19, #0x21c
100001028:     	ldr	d0, [x20], #0x8
10000102c:     	str	d0, [sp, #0x8]
100001030:     	str	x22, [sp]
100001034:     	mov	x0, x19
100001038:     	bl	0x100001160 <_swift_bridgeObjectRetain+0x100001160>
10000103c:     	subs	x21, x21, #0x1
100001040:     	b.ne	0x100001028 <_main+0x218>
100001044:     	adrp	x0, 0x100001000 <_main+0x1f0>
100001048:     	add	x0, x0, #0x226
10000104c:     	bl	0x10000116c <_swift_bridgeObjectRetain+0x10000116c>
100001050:     	mov	w0, #0x0                ; =0
100001054:     	b	0x10000106c <_main+0x25c>
100001058:     	stp	x24, x20, [sp]
10000105c:     	adrp	x0, 0x100001000 <_main+0x1f0>
100001060:     	add	x0, x0, #0x1c0
100001064:     	bl	0x100001160 <_swift_bridgeObjectRetain+0x100001160>
100001068:     	mov	w0, #0x3                ; =3
10000106c:     	ldp	x29, x30, [sp, #0xa0]
100001070:     	ldp	x20, x19, [sp, #0x90]
100001074:     	ldp	x22, x21, [sp, #0x80]
100001078:     	ldp	x24, x23, [sp, #0x70]
10000107c:     	ldp	x26, x25, [sp, #0x60]
100001080:     	ldp	x28, x27, [sp, #0x50]
100001084:     	ldp	d9, d8, [sp, #0x40]
100001088:     	ldp	d11, d10, [sp, #0x30]
10000108c:     	add	sp, sp, #0xb0
100001090:     	ret

0000000100001094 <_cmp>:
100001094:     	ldr	d0, [x0]
100001098:     	ldr	d1, [x1]
10000109c:     	fcmp	d0, d1
1000010a0:     	cset	w8, gt
1000010a4:     	csinv	w0, w8, wzr, pl
1000010a8:     	ret

Disassembly of section __TEXT,__stubs:

00000001000010ac <__stubs>:
1000010ac:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010b0:     	ldr	x16, [x16, #0x68]
1000010b4:     	br	x16
1000010b8:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010bc:     	ldr	x16, [x16, #0x70]
1000010c0:     	br	x16
1000010c4:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010c8:     	ldr	x16, [x16, #0x78]
1000010cc:     	br	x16
1000010d0:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010d4:     	ldr	x16, [x16, #0x80]
1000010d8:     	br	x16
1000010dc:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010e0:     	ldr	x16, [x16, #0x88]
1000010e4:     	br	x16
1000010e8:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010ec:     	ldr	x16, [x16, #0x90]
1000010f0:     	br	x16
1000010f4:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
1000010f8:     	ldr	x16, [x16, #0x98]
1000010fc:     	br	x16
100001100:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001104:     	ldr	x16, [x16, #0xa8]
100001108:     	br	x16
10000110c:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001110:     	ldr	x16, [x16, #0x10]
100001114:     	br	x16
100001118:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
10000111c:     	ldr	x16, [x16, #0x20]
100001120:     	br	x16
100001124:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001128:     	ldr	x16, [x16, #0x28]
10000112c:     	br	x16
100001130:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001134:     	ldr	x16, [x16, #0x30]
100001138:     	br	x16
10000113c:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001140:     	ldr	x16, [x16, #0x38]
100001144:     	br	x16
100001148:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
10000114c:     	ldr	x16, [x16, #0x40]
100001150:     	br	x16
100001154:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001158:     	ldr	x16, [x16, #0x48]
10000115c:     	br	x16
100001160:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001164:     	ldr	x16, [x16, #0x50]
100001168:     	br	x16
10000116c:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001170:     	ldr	x16, [x16, #0x58]
100001174:     	br	x16
100001178:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
10000117c:     	ldr	x16, [x16, #0x60]
100001180:     	br	x16
100001184:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001188:     	ldr	x16, [x16, #0xc8]
10000118c:     	br	x16
100001190:     	adrp	x16, 0x100004000 <__swift_FORCE_LOAD_$_swift_Builtin_float_$_SpectralNorm>
100001194:     	ldr	x16, [x16, #0xd0]
100001198:     	br	x16
