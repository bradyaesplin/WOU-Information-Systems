/* -- sum-to-ten.s */
.text
.global _start
_start:
    mov r0, #0      @ r0 := 0
    mov r1, #10     @ r1 := 10

again:
    add r0, r0, r1  @ r0 := r0 + r1
    subs r1, r1, #1 @ r1 := r1 - 1
    bne again       @ loop again if we haven't hit zero

end:
    mov r7, #1      @ setup exit
    swi 0           @ exit
