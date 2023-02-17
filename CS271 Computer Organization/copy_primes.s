/* -- copy_primes.s */

.text
.global _start
_start:
   mov r1, #4

  /* get the address of primes into r0 */
   ldr r0, =primes

  /* indirect addressing and pre/post indexing */
   ldr r5, [r0]             /* r5 = primes[0]; */
   ldr r6, [r0, r1]         /* r6 = primes[1]; */
   ldr r7, [r0, r1, lsl #1] /* r7 = primes[2] */

  /* Pre- and post-indexing write-back */
   ldr r8, [r0, #4]!        /* primes++;  r8= *primes */
   ldr r9, [r0], #4         /* r9= *primes; primes++ */
   ldr r10, [r0], #4        /* r10= *primes; primes++ */
   ldr r11, [r0], #4        /* r11= *primes; primes++ */

   ldr r0, =copy_primes     /* set address to store */
   str r5, [r0], #4         /* store to memory and increment index */
   str r6, [r0], #4
   str r7, [r0], #4

end:
   mov r7, #1
   swi 0

.data
.balign 4

/* Declares an array with fixed values as listed (primes) */
primes: .word 1,2,3,5,7,11

/* Allocates space for 6 new values (6 * 4), uninitialized */
copy_primes: .skip 24
