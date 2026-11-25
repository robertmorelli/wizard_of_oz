1000007d4:     	stp	x22, x21, [sp, #-0x30]!
1000007d8:     	stp	x20, x19, [sp, #0x10]
1000007dc:     	stp	x29, x30, [sp, #0x20]
1000007e0:     	add	x29, sp, #0x20
1000007e4:     	mov	x19, x1
1000007e8:     	cbz	w0, 0x100000824 <+0x50>
1000007ec:     	sub	w21, w0, #0x1
1000007f0:     	mov	x0, x21
1000007f4:     	mov	x1, x19
1000007f8:     	bl	0x1000007d4 <__Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE>
1000007fc:     	mov	x20, x0
100000800:     	mov	x0, x21
100000804:     	mov	x1, x19
100000808:     	bl	0x1000007d4 <__Z4makeiRN5boost11object_poolI4NodeNS_33default_user_allocator_new_deleteEEE>
10000080c:     	mov	x21, x0
100000810:     	ldr	x0, [x19]
100000814:     	cbz	x0, 0x100000848 <+0x74>
100000818:     	ldr	x8, [x0]
10000081c:     	str	x8, [x19]
100000820:     	b	0x100000854 <+0x80>
100000824:     	ldr	x0, [x19]
100000828:     	cbz	x0, 0x100000868 <+0x94>
10000082c:     	ldr	x8, [x0]
100000830:     	str	x8, [x19]
100000834:     	stp	xzr, xzr, [x0]
100000838:     	ldp	x29, x30, [sp, #0x20]
10000083c:     	ldp	x20, x19, [sp, #0x10]
100000840:     	ldp	x22, x21, [sp], #0x30
100000844:     	ret
100000848:     	mov	x0, x19
10000084c:     	bl	0x100000e80 <__ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv>
100000850:     	cbz	x0, 0x100000858 <+0x84>
100000854:     	stp	x20, x21, [x0]
100000858:     	ldp	x29, x30, [sp, #0x20]
10000085c:     	ldp	x20, x19, [sp, #0x10]
100000860:     	ldp	x22, x21, [sp], #0x30
100000864:     	ret
100000868:     	mov	x0, x19
10000086c:     	bl	0x100000e80 <__ZN5boost4poolINS_33default_user_allocator_new_deleteEE26ordered_malloc_need_resizeEv>
100000870:     	cbz	x0, 0x100000858 <+0x84>
100000874:     	stp	xzr, xzr, [x0]
100000878:     	ldp	x29, x30, [sp, #0x20]
10000087c:     	ldp	x20, x19, [sp, #0x10]
100000880:     	ldp	x22, x21, [sp], #0x30
100000884:     	ret
