@ r1 points to input buffer
@ r2 is size of buffer (max characters to read)
@ lr is return address

.global getline

getline:
        push {r2,r7}      @ preserve working registers
        mov r0, #0        @ choose stdin
        mov r7, #3        @ setup service call
        sub r2, #1        @ adjust size of buffer to allow null termination
        swi 0             @ make service call
        mov r7, #0        @ make r7 null
        strb r7, [r1, r0] @ add null termination
        pop {r2,r7}       @ restore registers
        bx lr             @ return
        .end
