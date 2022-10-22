	.data
A:	.word 3
B:	.word 6
RES: .word 0
	.code
	ld r1, A(r0)
	ld r2, B(r0)
	dadd r3, r0, r0
loop: daddi r1, r1, -1
	bnez r1, loop
	dadd r3, r3, r2 # Delay Slot activado
	sd r3, RES(r0)
	halt