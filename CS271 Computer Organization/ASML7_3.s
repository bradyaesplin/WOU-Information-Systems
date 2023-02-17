/* ASML7_3.s */



.text		@ code section
.balign 4	@ align code to 4 bytes
.global _start	@ declare entry point
_start:		@ label for the entry point


main:		@ label to start funtion main

	ldr r4,=trinput		@ load r4 with trinput memory address
	ldr r0,=trinumber	@ load r0 with trinumber memory address
	ldr r1, [r4]		@ r1 now loaded with value n=12 (trinput)
	mov r2, #0		@ sets up r2 as a counter, initialized at 0
	mov r3, #0		@ sets up r3 to hold values, initialized at 0
	bl trifunct		@ branch to trifunct and put the next line into link register

	str r3, [r0]	@ store r3 into trinumber variable
	b end		@ branch to end


end:

        mov r7, #1      @ setup system call to exit
        swi 0           @ system call to exit


trifunct:	@ label to start triangle function


	generate:	@ label to start generating n number of stored trinums

		cmp r2, r1		@ compare counter in r2 to n=12 in r1
		beq adding		@ if equal, branch to adding
		add r2, r2, #1		@ in r2, add r2 and 1, incrementing counter
		str r2, [r0], #4	@ store r2 into trinumber address, shift to next word
		b generate		@ branch back to beginning of function generate


	adding: 	@ label to start summing stored trinums

		ldr r5, [r4], #4	@ loads r5 with the value in trinumber address and shifts to next word
		add r3, r3, r5		@ in r3 add r3 and value in r5
		subs r2, r2, #1		@ in r2, subtract 1 from r2, decrementing counter, and checking if equal to zero
		bne adding		@ if not equal, branch back to beginning of function adding
		bx lr			@ if equal, branch to link register


.data		@ data section
.balign 4	@ align to 4 bytes

trinput: .word 12	@ assigns memory space to variable trinput and enters 12 as the value (=n)
trinumber: .word	@ assigns memory space to variable trinumber
