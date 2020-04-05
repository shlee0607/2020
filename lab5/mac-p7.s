@ Copyright (c) 2020 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
@ int B[] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32};
@
@ int main()
@ {
@     int sum = 0;
@     for (int i=0; i<16; i+=4)
@	  sum += A[i]*B[i] + A[i+1]*B[i+1] + A[i+2]*B[i+2] + A[i+3]B[i+3];
@     printf("Output is %d\n", sum);
@     return 0;
@ }

	.global main
main:
	push	{lr}		@ temporarily store the link register value into the stack

@ Your codes for part 7 (vector multiplication using auto-update address) starts
				@ Reset r1, which will serve as a storage of sum, to 0
	MOV	r1, #0

				@ Use a LDR pseudo instruction to set r2 to vectorA address
	LDR	r2, =vectorA
				@ Use a LDR pseudo instruction to set r3 to vectorB address
	LDR	r3, =vectorB

				@ Part 1: Intialize i to 0 before entering the loop
loop_label:
				@ Part 2: Loop comparison
				@ in this part, you need to compare i with 16 and branch to done_label, if the loop ended

				@ Part 3: Memory load using LDM
				@ in this part you need to load 4 elements of A and B, each, to 8 registers

				@ Part 4: Multiply-accumulate
				@ in this part, you will use 4 MLA instructions to do the vector multiplication

				@ Part 5: Index update
				@ in this part, you need to update i and branch back to the loop_label

@ Your codes for part 7 (vector multiplication using auto-update address) ends
done_label:

	ldr	r0, =message	@ the message string is the first argument of the printf()
	bl	printf		@ invoke the printf()

	mov	r0, #0		@ this is the return value (0) of this main function
	pop	{pc}		@ pop the saved link register value to update the PC to return

message:			@ literal part
	.align	2		@ message is aligned to 2 bytes (16 bits)
	.asciz 	"Output is %d\012\000"
	.align	4		@ vector are aligned to 4 bytes (32 bits)
vectorA:
	.word	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
				@ Vector A = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}
vectorB:
	.word	2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32
				@ Vector B = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32}
