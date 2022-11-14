	.data
A: .word 4
X: .word 1
Y: .word 4
	.code
	# opcion Delay Slot habilitada
	ld r1, A(r0)
	ld r2, X(r0)
	ld r3, Y(r0)
while: slt r4, r0, r1
	beqz r4, fin_while
	dadd r2, r2, r3
	j while
	daddi r1, r1, -1
fin_while: halt