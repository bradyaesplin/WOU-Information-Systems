/* -- sum-to-16.s */

.global _start

_start:

	mov r0, #0      	@ set r0 to 0
	mov r1, #16     	@ set r1 to 16

again:

	tst r1, #1		@ testing if number in r1 is even 
	addeq r0, r0, r1	@ if the last operation was even, add r0 and r1 in r0
	subs r1, r1, #1 	@ subtract 1 from r1 and test if r1 is equal to 0
	bne again       	@ loop again if we haven't hit zero

end:

	mov r7, #1      @ setup system call to exit
	swi 0           @ system call to exit
