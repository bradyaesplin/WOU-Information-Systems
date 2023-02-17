/* -- helloworld.s */
.global _start

_start:
    mov r0, #1       @ stdout is monitor
    ldr r1, =string1 @ location of string to write
    mov r2, #13      @ number of characters to write
    mov r7, #4       @ setup system call to write
    swi 0            @ system call to write

    mov r7, #1       @ setup system call to exit
    swi 0            @ system call to exit

.data
string1:
.ascii "Hello World!\n"
