.global pr_dec

pr_dec:
        push {r0-r7}
        mov r3, r0
        mov r2, #1
        mov r0, #1
        mov r7, #4
        cmp r3, #0
        bge positive

        ldr r1, =minus
        swi 0
        rsb r3, r3, #0

positive:
        cmp r3, #10
        blt last

        ldr r6, =powers+8

higher:
        ldr r5, [r6], #4
        cmp r3, r5
        bge higher

        sub r6, #8

nextdecimal:
        ldr r1, =digits-1
        ldr r5, [r6], #-4

nextdigit:
        add r1, #1
        subs r3, r5
        bge nextdigit

        addlt r3, r5
        swi 0

        cmp r5, #10
        bgt nextdecimal

last:
        ldr r1, =digits
        add r1, r3
        swi 0

return:
        ldr r1, =newline
        swi 0
        pop {r0-r7}
        bx lr

.data
powers:
        .word 1,10,100,1000,10000,100000,1000000
        .word 10000000,100000000,1000000000
        .word 0x7FFFFFFF
digits:
        .ascii "0123456789"
minus:
        .ascii "-"
newline:
        .ascii "\n"
        .end
