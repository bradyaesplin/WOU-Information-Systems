/* --ASML6_2.s */
/* Program will calculate the 25th Fibonacci numbers by following the Fibonacci Sequence. Program will
store each value of the sequence in sequential memory locations. */

.text			@ code section

.balign 4		@ ensures code is 4-byte aligned

.global _start
_start:

	mov r0, #0		@ initialize answer space of 0
	mov r1, #1		@ initialize r1 with the first number of the Fibonacci Sequence
	mov r2, #1		@ intialize r2 with the second number of the Fibonacci Sequence
	mov r3, #25		@ initialize the counter for the first 25 numbers of the Fibonacci Sequence
	ldr r4,=fss		@ I think that this will load into r4 the memory address specified by fss
				@ variable
	str r1, [r4], #4	@ I think this will store into the first fss word the number that is in r1
				@ and move r4 to the next word
	str r2, [r4], #4	@ I think this will do the same thing as the previous for r2

operation:

	add r0, r1, r2		@ in r0, add r1 and r2
	mov r1, r2		@ move to r1 the value in r2
	mov r2, r0		@ move to r2 the value in r0
	str r2, [r4], #4	@ I think this will store in to the next fss word the number in r2,
				@ and move r4 to the next word
	subs r3, r3, #1		@ subtract 1 from the counter in r0 and test to see if the result is 0
	bne operation		@ if the previous operation is not 0, return to operation label

end:

	mov r7, #1		@ setup exit
	swi 0			@ exit

.data				@ data section

.balign 4

fss:				@ assigns memory spaces to variable fss
	.skip 100		@ sets 25 spaces in memory aside and initializes them to 0
