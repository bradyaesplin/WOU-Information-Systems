/* --ASML6_1.s */
/* Program will load three numbers into registers from memory. Program will use a label and a .data block to put numbers
into three consecutive memory locations. Program will then compare the three numbers in three different registers,
store the highest number into a fourth memory location immediatly following the three other values and exit.

Note: Program will handle two equal numbers, changed blt and movlt to ble and
movle */


.data				@ starts the section used to hold data

.balign 4			@ ensures next address will start 4-byte boundary
numbers:			@ names variable
	.word 34,54,21,0	@ enters 4 numbers into the word space

.text				@ starts the section used to hold code

.balign 4			@ ensures code is 4-byte aligned
.global _start			@ makes _start a global command

_start:

	ldr r4, addr_of_numbers
	ldr r1, [r4], #4
	ldr r2, [r4], #4
	ldr r3, [r4], #4

operation:

	cmp r1, r2	@ compare r1 and r2
	bgt greater	@ if in compare instruction r1>r2, move to greater: label
	blt less	@ if in compare instruction r1<r2, move to less: label

greater:

	cmp r1, r3	@ compare r1 and r3
	movgt r0, r1	@ if in compare instruction r1>r3, move value of r1 to r0
	movlt r0, r3	@ if in compare instruction r1<r3, move value of r3 to r0
	b exit		@ break to exit: label

less:

	cmp r2, r3	@ compare r2 and r3
	movge r0, r2	@ if in compare instruction r2>r3, move value of r2 to r0
	movle r0, r3	@ if in compare instruction r2<r3, move value of r3 to r0
	b exit		@ break to exit: label

exit:
	str r0, [r4]	@ stores the value in r0 into the address in r4
	mov r7, #1
	swi 0

/* Label Section */
addr_of_numbers : .word numbers

/* credits https://stackoverflow.com/questions/54237061 */
