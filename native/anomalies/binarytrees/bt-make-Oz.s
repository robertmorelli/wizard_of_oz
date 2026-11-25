100000784:     	sub	sp, sp, #0x30
100000788:     	stp	x20, x19, [sp, #0x10]
10000078c:     	stp	x29, x30, [sp, #0x20]
100000790:     	add	x29, sp, #0x20
100000794:     	mov	x19, x1
100000798:     	cbz	w0, 0x1000007d0 <+0x4c>
10000079c:     	sub	w20, w0, #0x1
1000007a0:     	bl	0x100000fd8 <_OUTLINED_FUNCTION_4>
1000007a4:     	str	x0, [sp, #0x8]
1000007a8:     	bl	0x100000fd8 <_OUTLINED_FUNCTION_4>
1000007ac:     	str	x0, [sp]
1000007b0:     	add	x1, sp, #0x8
1000007b4:     	mov	x2, sp
1000007b8:     	mov	x0, x19
1000007bc:     	bl	0x100000800 <__ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEE9constructIPS1_S5_EES5_RKT_RKT0_>
1000007c0:     	ldp	x29, x30, [sp, #0x20]
1000007c4:     	ldp	x20, x19, [sp, #0x10]
1000007c8:     	add	sp, sp, #0x30
1000007cc:     	ret
1000007d0:     	mov	x0, x19
1000007d4:     	ldp	x29, x30, [sp, #0x20]
1000007d8:     	ldp	x20, x19, [sp, #0x10]
1000007dc:     	add	sp, sp, #0x30
1000007e0:     	b	0x1000007e4 <__ZN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEE9constructEv>
