/* CS271 Final - RPN.s */

.global _start
_start:

mov fp,sp 		@ set frame pointer to stack pointer


write:

mov r0, #1                      @ sets output to monitor
ldr r1, =string_instructions    @ location of string to show user
mov r2, #42			@ number of characters to show user
mov r7, #4			@ setup system call to write
swi 0				@ system call to write
b input


input:

ldr r1, =remember	@ load into r1 memory address of remember, arg for funct getline
mov r2, #25		@ set up max buffer in r2, arg for funct getline
bl getline		@ branch to funct getline, saving location to link register

/* funct getline returns length of string in r0 and string in buffer in memory in r1 */

ldrb r0, [r1]		@ load in r0 the character in remember variable at r1
cmp r0, #'x' 		@ check if user wants to exit
beq exit 		@ if x go to exit

cmp r0, #'+' 		@ check if addition
beq add			@ if + go to add

cmp r0, #'-' 		@ check if subtraction
beq subtract		@ if - go to subtract

cmp r0, #'*'		@ check if multiplication
beq multiply		@ if * go to multiply

bl char_int

/* funct char_int returns integer value in r0 */

cmp r0, #0
blt print_error		@ if < 0, branch to print error
cmp r0, #9		@ compare r0 to 9
bgt print_error		@ if > 0 branch to print error

b push


print_error:

push {r0, r1}		@ saves r0 and r1 to stack
mov r0, #1		@ sets output to monitor
ldr r1, =string_error	@ location of string to show user
mov r2, #18		@ number of characters to show user
mov r7, #4		@ setup system call to write
swi 0			@ system call to write
pop {r0, r1}		@ loads r0 and r1 back from stack
b write			@ branch to write


push:

str r0, [r1], #4	@ store r1 into remember variable, shift to next word
bl pr_dec		@ print the integer to user

/* funct pr_dec will print the integer in r0 to the screen */

b write			@ return to write


add:

ldr r2, [r1], #-4	@ load the top value out of remember into r2
ldr r3, [r1], #-4	@ load the top value out of remember into r3
add r0, r2, r3		@ in r0 add r2 and r3
b push			@ branch to push


subtract:

ldr r2, [r1], #-4	@ load the top value out of remember into r2
ldr r3, [r1], #-4	@ load the top value out of remember into r3
sub r0, r2, r3		@ in r0 subtract r3 from r2
b push			@ branch to push


multiply:

ldr r2, [r1], #-4	@ load the top value out of remember into r2
ldr r3, [r1], #-4	@ load the top value out of remember into r3
mul r0, r2, r3		@ in r0 multiply r2 and r3
b push			@ branch to push


exit:

bl pr_dec	@ branch to function pr_dec, saving link register

/* funct pr_dec will print the integer in r0 to the screen */

mov r7, #1	@ setup exit
swi 0		@ exit


.data @ data section

string_instructions: .ascii "Enter an integer or an operator (+, -, *).\n"
string_error: .ascii "Invalid character\n"
remember: .space 100 	@ assigns memory space to variable remember of 25 bytes
