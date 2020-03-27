@ Copyright (c) 2020 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@ int main()
@ {
@     printf("Output is %d\n", 1);
@     return 0;
@ }

	.global main
main:
	push	{lr}		@ temporarily store the link register value into the stack

				@ Your ALU codes start here

				@ Your codes must NOT update the special registers (SP, LR, PC).
				@ Your codes must put the output into r1, to be printed by the printf()

				@ Your ALU codes end here

	ldr	r0, =message	@ the message string is the first argument of the printf()
	mov	r1, #1		@ value of 1 is the second argument of the printf()
	bl	printf		@ invoke the printf()

	mov	r0, #0		@ this is the return value (0) of this main function
	pop	{pc}		@ pop the saved link register value to update the PC to return

message:			@ data part
	.align	2		@ data are aligned to 2 bytes (16 bits)
	.asciz 	"Output is %d\012\000"
