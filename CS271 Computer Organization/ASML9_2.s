/* --ASML9_2.s */
/* Simple program to demonstrate char_int has been successfully modifed to take a negative number 
as input and deal with it accordingly  */

.global _start
_start:

	mov r0, #1 			@ sets output to monitor
	ldr r1, =string0		@ location of string to show user
	mov r2, #14			@ number of characters to show user
	mov r7, #4			@ setup system call to write
	swi 0				@ system call to write
	ldr r1, =sign_input		@ load into r1 memory address of sign_input, arg for funct getline
	mov r2, #8			@ set up max buffer in r2, arg for funct getline
	bl getline			@ branch to funct getline, saving location to link register

	@ funct getline returns length of string in r0 and string in buffer in memory in r1

	bl char_int_sign		@ branch to funct char_int_sign, saving location in link register

	@ funct char_int_sign returns integer value in r0

	bl operation			@ branch to operation, saving link register
	b end				@ branch to end

	@ end will write answer directly to screen


operation:

	mov r3, r0			@ in r3, copy number in r0
	add r0, r0, r3			@ in r0, add r0 and r3
	bx lr				@ branch to link register


end:

	bl pr_dec		@ branch to function pr_dec, saving link register

	@ funct pr_dec will print the integer in r0 to the screen

	mov r7, #1		@ setup exit
	swi 0			@ exit


.data					@ data section

.balign 4				@ aligns to 4 bytes

sign_input: .skip 8			@ assigns memory space to variable sign_input of 32 bytes

string0: .ascii "Enter number:\n" 	@ string to print to screen
