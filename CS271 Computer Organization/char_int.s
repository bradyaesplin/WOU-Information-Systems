@ r1 points to null terminated string
@ lr is return address
@ r0 returns integer value

.global char_int

char_int:
        push {r1-r4}       @ save working registers
        mov r3, #0         @ initialize value
        mov r4, #10        @ constant for place value
next:
        ldrb r0, [r1], #1  @ get next character
        subs r0, #'0'      @ subtract asciii bias
        blt  notdigit      @ check if not digit
        cmp r0, #9
        bgt notdigit
        mla r3, r4, r3, r0 @ r3 = r3 * r4 + r0
        b next             @ repeat
notdigit:
        mov r0, r3         @ load value to return in r0
        pop {r1-r4}        @ restore working registers
        bx lr              @ return
        .end
