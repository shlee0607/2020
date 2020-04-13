@ Copyright (c) 2020 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int main()
@ {
@     int result = factorial(10);
@     printf("Output is %d\n", result);
@     return 0;
@ }
@
@ int factorial(int n)
@ {
@     if (n==1)
@     {
@	 return n;
@     }
@     else
@     {
@       return n * factorial(n-1);
@     }
@ }

	.global main
main:
	PUSH	{lr}		@ temporarily store the link register value into the stack

	MOV	r0, #10		@ r0 is the register to store the first argument for a function call
	BL 	factorial	@ invokes factorial with r0 as its argument : factorial(10)

	MOV	r1, r0		@ The factorial result is saved in r0
				@ move the return value to r1, which is the second argument of printf

	LDR	r0, =message	@ the message string is the first argument of the printf()
	BL	printf		@ invoke the printf()

	MOV	r0, #0		@ this is the return value (0) of this main function
	POP	{pc}		@ pop the saved link register value to update the PC to return

@ Your codes for factorial starts
factorial:

@ Your codes for factorial ends

message:			@ literal part
	.align	2		@ message is aligned to 2 bytes (16 bits)
	.asciz 	"Output is %d\012\000"
	.align	4		@ vector are aligned to 4 bytes (32 bits)
