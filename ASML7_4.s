/* --ASML4_7.s */
/* Program will use recursion to calculate the 16th Fibonacci value by following the Fibonacci Sequence.
Program will store each value of the sequence in sequential memory locations. */

.text				@ data section

.balign 4			@ aligns code to 4 bytes


.global _start
_start:

	ldr r0,=fibinput	@ load into r0 memory address of variable fibinput
	ldr r0, [r0]		@ load into r0 the contents of memory address at r0
	bl operation		@ branch to operation, saving the link register
	b end			@ branch to end


operation:

	stmdb sp!, {r4, r5, r6, lr} 	@ store multiple decrement before- at stack pointer,
					@ store r4-r6 and lr
	mov r4, r0			@ copy value in r0 to r4
	cmp r0, #2			@ compare r0 with 2
	mov r0, #1			@ move 1 into r0
	ble operationstop		@ if less than or equal to, branch to operationstop
	sub r0, r4, #2			@ in r0 subtract 2 from r4
	bl operation			@ branch into operation, saving the link register
	mov r5, r0			@ into r5 write the value in r0
	sub r0, r4, #1			@ in r0, subtract 1 from r4
	bl operation			@ branch to operation, saving the link register
	add r0, r0, r5			@ in r0, add value in r5 to value in r0


operationstop:

	ldmia sp!, {r4, r5, r6, pc}	@ load multiple increment after- at stack pointer,
					@ load r4-r6 and program counter


end:

	ldr r7, =fibnumber	@ in r7 load memory address of fibnumber
	str r0, [r7]		@ store in memory space of fibnumber, the end result of the program
	mov r7, #1		@ setup exit
	swi 0			@ exit


.data				@ data section

.balign 4			@ aligns code to 4 bytes

fss:				@ assigns memory spaces to variable fss
	.skip 64		@ sets 16 spaces of 4 bytes each aside and initializes them to 0

fibinput: .word 16		@ assigns memory space to variable fibinput and enters 16 as the value

fibnumber: .word		@ assigns memory space to hold the end result of the program
