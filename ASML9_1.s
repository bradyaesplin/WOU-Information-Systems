/* --ASML4_7.s */
/* Program will use recursion to calculate the 16th Fibonacci value by following the Fibonacci Sequence.
Program will store each value of the sequence in sequential memory locations. */

.global _start
_start:

	mov r0, #1		@ sets output to monitor
	ldr r1, =string0	@ location of string to show to user
	mov r2, #24		@ number of characters to show user
	mov r7, #4		@ setup system call to write
	swi 0			@ system call to write
	ldr r1,=fibinput	@ load into r1 memory address of fibinput, arg for funct getline
	mov r2, #8		@ set up max buffer size in r2, arg for funct getline
	bl getline		@ branch to funct getline, saving location in link register

	@ funct getline returns length of string in r0 and string in buffer in memory in r1

	bl char_int		@ branch to funct char_int, saving location in link register

	@ funct char_int returns integer value in r0

	bl operation		@ branch to operation, saving the link register


	@ returns the integer directly to screen

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

	bl pr_dec		@ branch to function pr_dec

	@ funct pr_dec will print the integer in r0 to the screen

	mov r7, #1		@ setup exit
	swi 0			@ exit


.data				@ data section

.balign 4			@ aligns code to 4 bytes

fibinput: .skip 8		@ assigns memory space to variable fibinput of 32 bytes

string0: .ascii "Enter Fibonacci number:\n" @ string to print to screen
