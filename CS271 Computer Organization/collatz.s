/* -- collatz.s */

.text
.global _start
_start:
   mov r0, #3              @ r0 is current number
   mov r1, #0              @ r1 is number of iterations

again:
   add r1, r1, #1          @ increment number of iterations
   ands r7, r0, #1         @ test if r0 is odd
   beq even                @ branch if not odd (even)

odd:
   add r0, r0, r0, lsl #1  @ if odd, r0 := 3 * r0  (r0 + 2 * r0)
   add r0, r0, #1          @ r0 := r0 + 1
   b again                 @ loop because we know r0 > 1

even:
   mov r0, r0, asr #1      @ if even, r0 := r0 >> 1
   subs r7, r0, #1         @ see if r0 != 1
   bne again               @ if not 1, loop again

end:
   mov r0, r1              @ store number of iterations in r0
   mov r7, #1              @ setup exit
   swi 0                   @ exit
