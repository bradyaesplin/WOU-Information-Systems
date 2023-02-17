
.global pr_str
pr_str:
/* Declare a string constant containing the message to print */

.data
invalid_msg:
.asciz "Invalid\n"

.text
/* Print the message to the user */
mov r0, #4                   @ load length of string into r0
ldr r1, =invalid_msg         @ load address of string into r1
mov r2, #1                   @ set file descriptor to stdout
mov r7, #4                   @ set syscall number for write
swi 0                        @ call write syscall

/* Return to the caller */
mov pc, lr
