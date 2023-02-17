/* -- ASML6_3.s */

.text

.global _start

_start:

	mov r0, #1		@ sets output to monitor
	ldr r1, =string0	@ location of string to show to user
	mov r2, #26		@ number of characters to show user
	mov r7, #4		@ setup system call to write
	swi 0			@ system call to write

input:

	ldr r1,=initial		@ load into r4, the memory address of initial
	mov r0, #0		@ sets input device to keyboard
	mov r2, #1		@ input string length
	mov r7, #3		@ setup system call to take input
	swi 0			@ system call to take input

respond:

	mov r0, #1		@ sets output to monitor
	ldr r1, =string1	@ location of string to write
	mov r2, #6		@ string length
	mov r7, #4		@ setup system call to write
	swi 0			@ system call to write

	mov r0, #1		@ sets output to monitor
	ldr r1, =initial	@ location of string to write
	mov r2, #3		@ string length
	mov r7, #4		@ setup system call to write
	swi 0			@ system call to write

ending:

	mov r7, #1		@ setup system call to exit
	swi 0			@ system call to exit

.data

string0: .ascii "Please type your initial:\n"
string1: .ascii "Hello \0"
initial: .ascii " !\n"

/* I was trying to insert 4 bytes instead of only inserting 1 byte  */
