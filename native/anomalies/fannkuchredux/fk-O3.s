00000001000007e4 <_bench>:
1000007e4:     	sub	sp, sp, #0xe0
1000007e8:     	stp	x20, x19, [sp, #0xc0]
1000007ec:     	stp	x29, x30, [sp, #0xd0]
1000007f0:     	add	x29, sp, #0xd0
1000007f4:     	adrp	x8, 0x100004000 <_snprintf+0x100004000>
1000007f8:     	ldr	x8, [x8, #0x8]
1000007fc:     	ldr	x8, [x8]
100000800:     	stur	x8, [x29, #-0x18]
100000804:     	adrp	x8, 0x100008000 <__MergedGlobals>
100000808:     	add	x8, x8, #0x0
10000080c:     	mov	w19, #0x1               ; =1
100000810:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
100000814:     	ldr	q0, [x9, #0xdb0]
100000818:     	tbl.16b	v1, { v0 }, v0
10000081c:     	stp	x19, x19, [x8]
100000820:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
100000824:     	ldr	q2, [x9, #0xdc0]
100000828:     	tbl.16b	v2, { v1 }, v2
10000082c:     	stp	q1, q2, [x8, #0x90]
100000830:     	mov	w9, #0x2                ; =2
100000834:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
100000838:     	ldr	q1, [x10, #0xdd0]
10000083c:     	tbl.16b	v1, { v2 }, v1
100000840:     	mov	w10, #0x6               ; =6
100000844:     	stp	x9, x10, [x8, #0x10]
100000848:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
10000084c:     	ldr	q2, [x9, #0xde0]
100000850:     	tbl.16b	v2, { v1 }, v2
100000854:     	stp	q1, q2, [x8, #0xb0]
100000858:     	mov	w9, #0x18               ; =24
10000085c:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
100000860:     	ldr	q1, [x10, #0xdf0]
100000864:     	tbl.16b	v1, { v2 }, v1
100000868:     	mov	w10, #0x78              ; =120
10000086c:     	stp	x9, x10, [x8, #0x20]
100000870:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
100000874:     	ldr	q2, [x9, #0xe00]
100000878:     	tbl.16b	v2, { v1 }, v2
10000087c:     	stp	q1, q2, [x8, #0xd0]
100000880:     	mov	w9, #0x2d0              ; =720
100000884:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
100000888:     	ldr	q1, [x10, #0xe10]
10000088c:     	tbl.16b	v1, { v2 }, v1
100000890:     	mov	w10, #0x13b0            ; =5040
100000894:     	stp	x9, x10, [x8, #0x30]
100000898:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
10000089c:     	ldr	q2, [x9, #0xe20]
1000008a0:     	tbl.16b	v2, { v1 }, v2
1000008a4:     	stp	q1, q2, [x8, #0xf0]
1000008a8:     	mov	w9, #0x9d80             ; =40320
1000008ac:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
1000008b0:     	ldr	q1, [x10, #0xe30]
1000008b4:     	tbl.16b	v1, { v2 }, v1
1000008b8:     	mov	w10, #0x8980            ; =35200
1000008bc:     	movk	w10, #0x5, lsl #16
1000008c0:     	stp	x9, x10, [x8, #0x40]
1000008c4:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
1000008c8:     	ldr	q2, [x9, #0xe40]
1000008cc:     	tbl.16b	v2, { v1 }, v2
1000008d0:     	stp	q1, q2, [x8, #0x110]
1000008d4:     	mov	w9, #0x5f00             ; =24320
1000008d8:     	movk	w9, #0x37, lsl #16
1000008dc:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
1000008e0:     	ldr	q1, [x10, #0xe50]
1000008e4:     	tbl.16b	v1, { v2 }, v1
1000008e8:     	mov	w10, #0x1500            ; =5376
1000008ec:     	movk	w10, #0x261, lsl #16
1000008f0:     	stp	x9, x10, [x8, #0x50]
1000008f4:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
1000008f8:     	ldr	q2, [x9, #0xe60]
1000008fc:     	tbl.16b	v2, { v1 }, v2
100000900:     	stp	q1, q2, [x8, #0x130]
100000904:     	mov	w9, #0xfc00             ; =64512
100000908:     	movk	w9, #0x1c8c, lsl #16
10000090c:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
100000910:     	ldr	q1, [x10, #0xe70]
100000914:     	tbl.16b	v1, { v2 }, v1
100000918:     	mov	x10, #0xcc00            ; =52224
10000091c:     	movk	x10, #0x7328, lsl #16
100000920:     	movk	x10, #0x1, lsl #32
100000924:     	stp	x9, x10, [x8, #0x60]
100000928:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
10000092c:     	ldr	q2, [x9, #0xe80]
100000930:     	tbl.16b	v2, { v1 }, v2
100000934:     	stp	q1, q2, [x8, #0x150]
100000938:     	mov	x9, #0x2800             ; =10240
10000093c:     	movk	x9, #0x4c3b, lsl #16
100000940:     	movk	x9, #0x14, lsl #32
100000944:     	adrp	x10, 0x100000000 <_snprintf+0x100000000>
100000948:     	ldr	q1, [x10, #0xe90]
10000094c:     	tbl.16b	v1, { v2 }, v1
100000950:     	mov	x10, #0x5800            ; =22528
100000954:     	movk	x10, #0x7777, lsl #16
100000958:     	movk	x10, #0x130, lsl #32
10000095c:     	stp	x9, x10, [x8, #0x70]
100000960:     	adrp	x9, 0x100000000 <_snprintf+0x100000000>
100000964:     	ldr	q2, [x9, #0xea0]
100000968:     	tbl.16b	v2, { v1 }, v2
10000096c:     	stp	q1, q2, [x8, #0x170]
100000970:     	mov	x9, #0x8000             ; =32768
100000974:     	movk	x9, #0x7775, lsl #16
100000978:     	movk	x9, #0x1307, lsl #32
10000097c:     	str	x9, [x8, #0x80]
100000980:     	movi.2d	v1, #0000000000000000
100000984:     	stp	q1, q1, [sp, #0x30]
100000988:     	str	q1, [sp, #0x20]
10000098c:     	str	w0, [sp, #0x44]
100000990:     	sub	w9, w0, #0x11
100000994:     	cmn	w9, #0x10
100000998:     	b.lo	0x100000c54 <_bench+0x470>
10000099c:     	ldr	x11, [x8, w0, uxtw #3]
1000009a0:     	cmp	x11, #0x18
1000009a4:     	mov	w9, #0x18               ; =24
1000009a8:     	csinc	x9, x9, xzr, hi
1000009ac:     	udiv	x12, x11, x9
1000009b0:     	stp	x12, x11, [sp, #0x28]
1000009b4:     	add	x9, sp, #0x20
1000009b8:     	ldaddal	x12, x15, [x9]
1000009bc:     	cmp	x15, x11
1000009c0:     	b.hs	0x100000bc4 <_bench+0x3e0>
1000009c4:     	mov	x13, #0x0               ; =0
1000009c8:     	mov	w10, #0x0               ; =0
1000009cc:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
1000009d0:     	ldr	q1, [x14, #0xeb0]
1000009d4:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
1000009d8:     	ldr	q2, [x14, #0xec0]
1000009dc:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
1000009e0:     	ldr	q3, [x14, #0xed0]
1000009e4:     	adrp	x14, 0x100000000 <_snprintf+0x100000000>
1000009e8:     	ldr	q4, [x14, #0xee0]
1000009ec:     	mov	w14, w0
1000009f0:     	dup.16b	v5, w0
1000009f4:     	sub.16b	v5, v0, v5
1000009f8:     	lsl	x14, x14, #3
1000009fc:     	movi.2d	v6, #0000000000000000
100000a00:     	movi.16b	v7, #0x8f
100000a04:     	movi.16b	v16, #0x1
100000a08:     	movi.16b	v17, #0xf
100000a0c:     	mov	x16, x14
100000a10:     	mov.16b	v19, v0
100000a14:     	movi.2d	v18, #0000000000000000
100000a18:     	mov.16b	v20, v5
100000a1c:     	add	x17, x8, x16
100000a20:     	ldur	x17, [x17, #-0x8]
100000a24:     	udiv	x1, x15, x17
100000a28:     	msub	x15, x1, x17, x15
100000a2c:     	dup.16b	v21, w1
100000a30:     	ext.16b	v18, v21, v18, #0xf
100000a34:     	add.16b	v22, v21, v0
100000a38:     	add.16b	v21, v21, v20
100000a3c:     	cmlt.16b	v23, v21, #0
100000a40:     	and.16b	v22, v23, v22
100000a44:     	smax.16b	v21, v21, v6
100000a48:     	orr.16b	v21, v22, v21
100000a4c:     	and.16b	v21, v21, v7
100000a50:     	tbl.16b	v21, { v19 }, v21
100000a54:     	cmlt.16b	v22, v20, #0
100000a58:     	bit.16b	v19, v21, v22
100000a5c:     	add.16b	v20, v20, v16
100000a60:     	subs	x16, x16, #0x8
100000a64:     	b.ne	0x100000a1c <_bench+0x238>
100000a68:     	mov	x15, x12
100000a6c:     	fmov	w16, s19
100000a70:     	tst	w16, #0xff
100000a74:     	b.eq	0x100000ac4 <_bench+0x2e0>
100000a78:     	mov	w16, #0x0               ; =0
100000a7c:     	tbl.16b	v20, { v19 }, v6
100000a80:     	mov.16b	v21, v19
100000a84:     	add.16b	v22, v20, v1
100000a88:     	and.16b	v20, v20, v7
100000a8c:     	tbl.16b	v20, { v21 }, v20
100000a90:     	cmlt.16b	v23, v22, #0
100000a94:     	and.16b	v23, v23, v0
100000a98:     	smax.16b	v22, v22, v6
100000a9c:     	and.16b	v22, v22, v17
100000aa0:     	orr.16b	v22, v23, v22
100000aa4:     	tbl.16b	v21, { v21 }, v22
100000aa8:     	fmov	w17, s20
100000aac:     	add	w16, w16, #0x1
100000ab0:     	tst	w17, #0xff
100000ab4:     	b.ne	0x100000a84 <_bench+0x2a0>
100000ab8:     	add	x13, x13, w16, uxtw
100000abc:     	cmp	w16, w10
100000ac0:     	csel	w10, w16, w10, hi
100000ac4:     	cmp	x15, #0x1
100000ac8:     	b.eq	0x100000bb4 <_bench+0x3d0>
100000acc:     	add.16b	v20, v18, v1
100000ad0:     	cmlt.16b	v20, v20, #0
100000ad4:     	and.16b	v20, v20, v2
100000ad8:     	tbl.16b	v20, { v20 }, v3
100000adc:     	addv.8h	h20, v20
100000ae0:     	fmov	w16, s20
100000ae4:     	rbit	w16, w16
100000ae8:     	clz	w16, w16
100000aec:     	add	x17, x8, w16, uxtw #4
100000af0:     	ldr	q20, [x17, #0x90]
100000af4:     	and.16b	v20, v20, v7
100000af8:     	tbl.16b	v19, { v19 }, v20
100000afc:     	fmov	w17, s19
100000b00:     	tst	w17, #0xff
100000b04:     	b.eq	0x100000b54 <_bench+0x370>
100000b08:     	mov	w17, #0x0               ; =0
100000b0c:     	tbl.16b	v20, { v19 }, v6
100000b10:     	mov.16b	v21, v19
100000b14:     	add.16b	v22, v20, v1
100000b18:     	and.16b	v20, v20, v7
100000b1c:     	tbl.16b	v20, { v21 }, v20
100000b20:     	cmlt.16b	v23, v22, #0
100000b24:     	and.16b	v23, v23, v0
100000b28:     	smax.16b	v22, v22, v6
100000b2c:     	and.16b	v22, v22, v17
100000b30:     	orr.16b	v22, v23, v22
100000b34:     	tbl.16b	v21, { v21 }, v22
100000b38:     	fmov	w1, s20
100000b3c:     	add	w17, w17, #0x1
100000b40:     	tst	w1, #0xff
100000b44:     	b.ne	0x100000b14 <_bench+0x330>
100000b48:     	sub	x13, x13, w17, uxtw
100000b4c:     	cmp	w17, w10
100000b50:     	csel	w10, w17, w10, hi
100000b54:     	dup.16b	v20, w16
100000b58:     	cmhi.16b	v21, v4, v20
100000b5c:     	cmeq.16b	v20, v20, v0
100000b60:     	and.16b	v18, v21, v18
100000b64:     	sub.16b	v18, v18, v20
100000b68:     	add.16b	v20, v18, v1
100000b6c:     	cmlt.16b	v20, v20, #0
100000b70:     	and.16b	v20, v20, v2
100000b74:     	tbl.16b	v20, { v20 }, v3
100000b78:     	addv.8h	h20, v20
100000b7c:     	fmov	w16, s20
100000b80:     	rbit	w16, w16
100000b84:     	clz	w16, w16
100000b88:     	dup.16b	v20, w16
100000b8c:     	cmhi.16b	v21, v4, v20
100000b90:     	and.16b	v18, v21, v18
100000b94:     	cmeq.16b	v20, v20, v0
100000b98:     	sub.16b	v18, v18, v20
100000b9c:     	add	x16, x8, w16, uxtw #4
100000ba0:     	ldr	q20, [x16, #0x90]
100000ba4:     	and.16b	v20, v20, v7
100000ba8:     	tbl.16b	v19, { v19 }, v20
100000bac:     	subs	x15, x15, #0x2
100000bb0:     	b.ne	0x100000a6c <_bench+0x288>
100000bb4:     	ldaddal	x12, x15, [x9]
100000bb8:     	cmp	x15, x11
100000bbc:     	b.lo	0x100000a0c <_bench+0x228>
100000bc0:     	b	0x100000bcc <_bench+0x3e8>
100000bc4:     	mov	w10, #0x0               ; =0
100000bc8:     	mov	x13, #0x0               ; =0
100000bcc:     	add	x8, x9, #0x18
100000bd0:     	ldaddal	x13, x8, [x8]
100000bd4:     	mov	w8, #0x1                ; =1
100000bd8:     	add	x11, x9, #0x28
100000bdc:     	swpal	w8, w11, [x11]
100000be0:     	cbnz	w11, 0x100000bd8 <_bench+0x3f4>
100000be4:     	mov	w19, #0x9dc5            ; =40389
100000be8:     	movk	w19, #0x811c, lsl #16
100000bec:     	ldr	w8, [sp, #0x40]
100000bf0:     	cmp	w8, w10
100000bf4:     	csel	w8, w8, w10, hi
100000bf8:     	str	w8, [sp, #0x40]
100000bfc:     	add	x9, sp, #0x20
100000c00:     	add	x9, x9, #0x28
100000c04:     	stlr	wzr, [x9]
100000c08:     	ldr	x9, [sp, #0x38]
100000c0c:     	stp	x0, x8, [sp, #0x8]
100000c10:     	str	x9, [sp]
100000c14:     	adrp	x2, 0x100000000 <_snprintf+0x100000000>
100000c18:     	add	x2, x2, #0xd87
100000c1c:     	add	x0, sp, #0x58
100000c20:     	mov	w1, #0x60               ; =96
100000c24:     	bl	0x100000cf0 <_snprintf+0x100000cf0>
100000c28:     	cmp	w0, #0x1
100000c2c:     	b.lt	0x100000c54 <_bench+0x470>
100000c30:     	mov	w8, w0
100000c34:     	add	x9, sp, #0x58
100000c38:     	mov	w10, #0x193             ; =403
100000c3c:     	movk	w10, #0x100, lsl #16
100000c40:     	ldrb	w11, [x9], #0x1
100000c44:     	eor	w11, w19, w11
100000c48:     	mul	w19, w11, w10
100000c4c:     	subs	x8, x8, #0x1
100000c50:     	b.ne	0x100000c40 <_bench+0x45c>
100000c54:     	ldur	x8, [x29, #-0x18]
100000c58:     	adrp	x9, 0x100004000 <_snprintf+0x100004000>
100000c5c:     	ldr	x9, [x9, #0x8]
100000c60:     	ldr	x9, [x9]
100000c64:     	cmp	x9, x8
100000c68:     	b.ne	0x100000c80 <_bench+0x49c>
100000c6c:     	mov	x0, x19
100000c70:     	ldp	x29, x30, [sp, #0xd0]
100000c74:     	ldp	x20, x19, [sp, #0xc0]
100000c78:     	add	sp, sp, #0xe0
100000c7c:     	ret
100000c80:     	bl	0x100000c84 <_snprintf+0x100000c84>
