	.global main
main:
	push	{lr}

	ldr	r0, =message
	mov	r1, #1
	bl	printf

	mov	r0, #0
	pop	{pc}

message:
	.align	2
	.asciz 	"Output is %d\012\000"
