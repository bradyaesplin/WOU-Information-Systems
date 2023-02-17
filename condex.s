/* --condex.s */
/* Program will compare three numbers in three different registers, add the highest number to register 0
 and exit

Limitations: unknown how program will handle two equal numbers, solution change blt and movle to ble and
movle */

.global _start

_start:

	mov r0, #0 	@ initialize answer register
	mov r1, #34	@ number 1 = 34
	mov r2, #54	@ number 2 = 54
	mov r3, #21	@ number 2 = 21

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
	movgt r0, r2	@ if in compare instruction r2>r3, move value of r2 to r0
	movlt r0, r3	@ if in compare instruction r2<r3, move value of r3 to r0
	b exit		@ break to exit: label

exit:

	mov r7, #1
	swi 0

/* credits https://stackoverflow.com/questions/54237061 */
