@ Copyright (c) 2020 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4};
@ int B[] = {2, 4, 6, 8};
@
@ int main()
@ {
@     int sum = 0;
@     for (int i=0; i<4; i++)
@         sum += A[i]*B[i];
@     printf("Output is %d\n", sum);
@     return 0;
@ }

	.global main
main:
	push	{lr}		@ temporarily store the link register value into the stack

@ Your codes for part 6 (vector multiplication using auto-update address) starts
				@ Reset r1, which will serve as a storage of sum, to 0

				@ Use a LDR pseudo instruction to set r2 to vectorA address

				@ Use a LDR pseudo instruction to set r3 to vectorB address

				@ Reset r0, which will serve as an index, to 0
				@ (this is the initialization part of the for loop, int i=0)

loop_label:
				@ Compare r0 with 4
				@ (this is the comparison part of the for loop, i < 4)

				@ Branch to done_label, if the comparison failed

				@ Calculate A's element address by adding r0*4 to r2, save it to r4

				@ Calculate B's element address by adding r0*4 to r3, save it to r5

				@ Load A's element to r6

				@ Load B's element to r7

				@ Use Multiply-accumulate instruction to update r1 with r6*r7

				@ Increment r0 by 1
				@ (this is the increment part of the for loop, i++)

				@ Branch back to loop_label

@ Your codes for part 6 (vector multiplication using auto-update address) ends
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
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
