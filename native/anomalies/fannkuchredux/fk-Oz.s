00000001000007e4 <_bench>:
1000007e4:     	sub	sp, sp, #0xe0
1000007e8:     	stp	x20, x19, [sp, #0xc0]
1000007ec:     	stp	x29, x30, [sp, #0xd0]
1000007f0:     	add	x29, sp, #0xd0
1000007f4:     	mov	x8, #0x0                ; =0
1000007f8:     	adrp	x9, 0x100004000 <_snprintf+0x100004000>
1000007fc:     	ldr	x9, [x9, #0x8]
100000800:     	ldr	x9, [x9]
100000804:     	stur	x9, [x29, #-0x18]
100000808:     	mov	w9, #0x1                ; =1
10000080c:     	adrp	x10, 0x100008000 <__MergedGlobals>
100000810:     	str	x9, [x10]
100000814:     	adrp	x13, 0x100000000 <_snprintf+0x100000000>
100000818:     	ldr	q0, [x13, #0xcb0]
10000081c:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
100000820:     	ldr	q1, [x14, #0xcc0]
100000824:     	movi.2d	v2, #0000000000000000
100000828:     	movi.2d	v3, #0xffffffffffffffff
10000082c:     	movi.16b	v4, #0xf
100000830:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
100000834:     	ldr	q5, [x10, #0xcd0]
100000838:     	adrp	x10, 0x100008000 <__MergedGlobals>
10000083c:     	add	x10, x10, #0x90
100000840:     	movi.16b	v6, #0x1
100000844:     	mov.16b	v7, v0
100000848:     	cmp	x8, #0x10
10000084c:     	b.eq	0x100000890 <_bench+0xac>
100000850:     	cmlt.16b	v16, v1, #0
100000854:     	and.16b	v16, v16, v0
100000858:     	smax.16b	v17, v1, v2
10000085c:     	add.16b	v18, v1, v3
100000860:     	cmlt.16b	v18, v18, #0
100000864:     	and.16b	v17, v17, v4
100000868:     	orr.16b	v16, v16, v17
10000086c:     	bif.16b	v16, v5, v18
100000870:     	tbl.16b	v7, { v7 }, v16
100000874:     	str	q7, [x10, x8, lsl #4]
100000878:     	add	x11, x10, x8, lsl #3
10000087c:     	add	x8, x8, #0x1
100000880:     	mul	x9, x9, x8
100000884:     	stur	x9, [x11, #-0x88]
100000888:     	add.16b	v1, v1, v6
10000088c:     	b	0x100000848 <_bench+0x64>
100000890:     	movi.2d	v0, #0000000000000000
100000894:     	stp	q0, q0, [sp, #0x30]
100000898:     	str	q0, [sp, #0x20]
10000089c:     	str	w0, [sp, #0x44]
1000008a0:     	sub	w8, w0, #0x11
1000008a4:     	cmn	w8, #0x10
1000008a8:     	b.hs	0x1000008d8 <_bench+0xf4>
1000008ac:     	mov	w0, #0x1                ; =1
1000008b0:     	ldur	x8, [x29, #-0x18]
1000008b4:     	adrp	x9, 0x100004000 <_snprintf+0x100004000>
1000008b8:     	ldr	x9, [x9, #0x8]
1000008bc:     	ldr	x9, [x9]
1000008c0:     	cmp	x9, x8
1000008c4:     	b.ne	0x100000b8c <_bench+0x3a8>
1000008c8:     	ldp	x29, x30, [sp, #0xd0]
1000008cc:     	ldp	x20, x19, [sp, #0xc0]
1000008d0:     	add	sp, sp, #0xe0
1000008d4:     	ret
1000008d8:     	mov	w8, #0x0                ; =0
1000008dc:     	mov	x9, #0x0                ; =0
1000008e0:     	adrp	x10, 0x100008000 <__MergedGlobals>
1000008e4:     	add	x10, x10, #0x0
1000008e8:     	ubfiz	x11, x0, #3, #32
1000008ec:     	ldr	x12, [x10, w0, uxtw #3]
1000008f0:     	cmp	x12, #0x18
1000008f4:     	ldr	q1, [x13, #0xcb0]
1000008f8:     	mov	w13, #0x18              ; =24
1000008fc:     	csinc	x13, x13, xzr, hi
100000900:     	udiv	x13, x12, x13
100000904:     	stp	x13, x12, [sp, #0x28]
100000908:     	dup.16b	v2, w0
10000090c:     	sub.16b	v2, v1, v2
100000910:     	ldr	q3, [x14, #0xcc0]
100000914:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
100000918:     	ldr	q4, [x14, #0xce0]
10000091c:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
100000920:     	ldr	q5, [x14, #0xcf0]
100000924:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
100000928:     	ldr	q6, [x14, #0xd00]
10000092c:     	add	x14, sp, #0x20
100000930:     	movi.16b	v7, #0x8f
100000934:     	movi.16b	v16, #0xf
100000938:     	movi.16b	v17, #0x1
10000093c:     	ldaddal	x13, x15, [x14]
100000940:     	cmp	x15, x12
100000944:     	b.hs	0x100000afc <_bench+0x318>
100000948:     	movi.2d	v18, #0000000000000000
10000094c:     	mov	x16, x11
100000950:     	mov.16b	v20, v2
100000954:     	mov.16b	v19, v1
100000958:     	cbz	x16, 0x1000009a8 <_bench+0x1c4>
10000095c:     	add	x17, x10, x16
100000960:     	ldur	x17, [x17, #-0x8]
100000964:     	udiv	x1, x15, x17
100000968:     	msub	x15, x1, x17, x15
10000096c:     	dup.16b	v21, w1
100000970:     	ext.16b	v18, v21, v18, #0xf
100000974:     	add.16b	v22, v21, v1
100000978:     	add.16b	v21, v21, v20
10000097c:     	cmlt.16b	v23, v21, #0
100000980:     	and.16b	v22, v23, v22
100000984:     	smax.16b	v21, v21, v0
100000988:     	orr.16b	v21, v22, v21
10000098c:     	and.16b	v21, v21, v7
100000990:     	tbl.16b	v21, { v19 }, v21
100000994:     	cmlt.16b	v22, v20, #0
100000998:     	bit.16b	v19, v21, v22
10000099c:     	add.16b	v20, v20, v17
1000009a0:     	sub	x16, x16, #0x8
1000009a4:     	cbnz	x16, 0x10000095c <_bench+0x178>
1000009a8:     	mov	x15, x13
1000009ac:     	fmov	w16, s19
1000009b0:     	tst	w16, #0xff
1000009b4:     	b.eq	0x100000a04 <_bench+0x220>
1000009b8:     	mov	w16, #0x0               ; =0
1000009bc:     	tbl.16b	v20, { v19 }, v0
1000009c0:     	mov.16b	v21, v19
1000009c4:     	add.16b	v22, v20, v3
1000009c8:     	and.16b	v20, v20, v7
1000009cc:     	tbl.16b	v20, { v21 }, v20
1000009d0:     	cmlt.16b	v23, v22, #0
1000009d4:     	and.16b	v23, v23, v1
1000009d8:     	smax.16b	v22, v22, v0
1000009dc:     	and.16b	v22, v22, v16
1000009e0:     	orr.16b	v22, v23, v22
1000009e4:     	tbl.16b	v21, { v21 }, v22
1000009e8:     	fmov	w17, s20
1000009ec:     	add	w16, w16, #0x1
1000009f0:     	tst	w17, #0xff
1000009f4:     	b.ne	0x1000009c4 <_bench+0x1e0>
1000009f8:     	add	x9, x9, w16, uxtw
1000009fc:     	cmp	w16, w8
100000a00:     	csel	w8, w16, w8, hi
100000a04:     	add.16b	v20, v18, v3
100000a08:     	cmlt.16b	v20, v20, #0
100000a0c:     	and.16b	v20, v20, v4
100000a10:     	tbl.16b	v20, { v20 }, v5
100000a14:     	addv.8h	h20, v20
100000a18:     	fmov	w16, s20
100000a1c:     	rbit	w16, w16
100000a20:     	clz	w16, w16
100000a24:     	dup.16b	v20, w16
100000a28:     	cmhi.16b	v21, v6, v20
100000a2c:     	cmeq.16b	v20, v20, v1
100000a30:     	and.16b	v18, v21, v18
100000a34:     	sub.16b	v18, v18, v20
100000a38:     	add	x16, x10, w16, uxtw #4
100000a3c:     	ldr	q20, [x16, #0x90]
100000a40:     	and.16b	v20, v20, v7
100000a44:     	tbl.16b	v19, { v19 }, v20
100000a48:     	subs	x16, x15, #0x1
100000a4c:     	b.eq	0x10000093c <_bench+0x158>
100000a50:     	fmov	w17, s19
100000a54:     	tst	w17, #0xff
100000a58:     	b.eq	0x100000aa8 <_bench+0x2c4>
100000a5c:     	mov	w17, #0x0               ; =0
100000a60:     	tbl.16b	v20, { v19 }, v0
100000a64:     	mov.16b	v21, v19
100000a68:     	add.16b	v22, v20, v3
100000a6c:     	and.16b	v20, v20, v7
100000a70:     	tbl.16b	v20, { v21 }, v20
100000a74:     	cmlt.16b	v23, v22, #0
100000a78:     	and.16b	v23, v23, v1
100000a7c:     	smax.16b	v22, v22, v0
100000a80:     	and.16b	v22, v22, v16
100000a84:     	orr.16b	v22, v23, v22
100000a88:     	tbl.16b	v21, { v21 }, v22
100000a8c:     	fmov	w1, s20
100000a90:     	add	w17, w17, #0x1
100000a94:     	tst	w1, #0xff
100000a98:     	b.ne	0x100000a68 <_bench+0x284>
100000a9c:     	sub	x9, x9, w17, uxtw
100000aa0:     	cmp	w17, w8
100000aa4:     	csel	w8, w17, w8, hi
100000aa8:     	add.16b	v20, v18, v3
100000aac:     	cmlt.16b	v20, v20, #0
100000ab0:     	and.16b	v20, v20, v4
100000ab4:     	tbl.16b	v20, { v20 }, v5
100000ab8:     	addv.8h	h20, v20
100000abc:     	fmov	w17, s20
100000ac0:     	rbit	w17, w17
100000ac4:     	clz	w17, w17
100000ac8:     	dup.16b	v20, w17
100000acc:     	cmhi.16b	v21, v6, v20
100000ad0:     	and.16b	v18, v21, v18
100000ad4:     	cmeq.16b	v20, v20, v1
100000ad8:     	sub.16b	v18, v18, v20
100000adc:     	add	x17, x10, w17, uxtw #4
100000ae0:     	ldr	q20, [x17, #0x90]
100000ae4:     	and.16b	v20, v20, v7
100000ae8:     	tbl.16b	v19, { v19 }, v20
100000aec:     	sub	x15, x15, #0x2
100000af0:     	cmp	x16, #0x2
100000af4:     	b.lo	0x10000093c <_bench+0x158>
100000af8:     	b	0x1000009ac <_bench+0x1c8>
100000afc:     	add	x10, sp, #0x20
100000b00:     	add	x11, x10, #0x18
100000b04:     	ldaddal	x9, x9, [x11]
100000b08:     	mov	w9, #0x1                ; =1
100000b0c:     	add	x11, x10, #0x28
100000b10:     	swpal	w9, w11, [x11]
100000b14:     	cbnz	w11, 0x100000b0c <_bench+0x328>
100000b18:     	ldr	w9, [sp, #0x40]
100000b1c:     	cmp	w9, w8
100000b20:     	csel	w8, w9, w8, hi
100000b24:     	str	w8, [sp, #0x40]
100000b28:     	add	x9, sp, #0x20
100000b2c:     	add	x9, x9, #0x28
100000b30:     	stlr	wzr, [x9]
100000b34:     	ldr	x9, [sp, #0x38]
100000b38:     	stp	x0, x8, [sp, #0x8]
100000b3c:     	str	x9, [sp]
100000b40:     	adrp	x2, 0x100000000 <_snprintf+0x100000000>
100000b44:     	add	x2, x2, #0xc93
100000b48:     	add	x19, sp, #0x58
100000b4c:     	add	x0, sp, #0x58
100000b50:     	mov	w1, #0x60               ; =96
100000b54:     	bl	0x100000bfc <_snprintf+0x100000bfc>
100000b58:     	mov	x8, #0x0                ; =0
100000b5c:     	bic	w9, w0, w0, asr #31
100000b60:     	mov	w0, #0x9dc5             ; =40389
100000b64:     	movk	w0, #0x811c, lsl #16
100000b68:     	mov	w10, #0x193             ; =403
100000b6c:     	movk	w10, #0x100, lsl #16
100000b70:     	cmp	x9, x8
100000b74:     	b.eq	0x1000008b0 <_bench+0xcc>
100000b78:     	ldrb	w11, [x19, x8]
100000b7c:     	eor	w11, w0, w11
100000b80:     	mul	w0, w11, w10
100000b84:     	add	x8, x8, #0x1
100000b88:     	b	0x100000b70 <_bench+0x38c>
100000b8c:     	bl	0x100000b90 <_snprintf+0x100000b90>
