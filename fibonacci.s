/* --fibonacci.s */
/* Program will calculate the 25th Fibonacci numbers by following the Fibonacci Sequence */

.global _start
_start:

	mov r0, #11	@ initialize the counter for following the Fibonacci Sequence 22 times
	mov r1, #1	@ initialize r1 with the first number of the Fibonacci Sequence
	mov r2, #1	@ intialize r2 with the second number of the Fibonacci Sequence

operation:

	add r1, r1, r2	@ in r1, add r1 and r2
	add r2, r1, r2	@ in r2, add r1 and r2
	subs r0, r0, #1	@ subtract 1 from the counter in r0 and test to see if the result is 0
	bne operation	@ if the previous operation is not 0, return to operation: label

end:

	add r0, r1, r2	@ in r0, add r1 and r2
	mov r7, #1	@ setup exit
	swi 0		@ exit
