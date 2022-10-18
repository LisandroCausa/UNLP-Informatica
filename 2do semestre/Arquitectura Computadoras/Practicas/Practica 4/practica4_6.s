	.data
A:	.word 1
B: 	.word 2
C: 	.word 3
D: 	.word 0
	.code
	dadd r4, r0, r0
	ld r1, A(r0)
	ld r2, B(r0)
	ld r3, C(r0)
	beq r1, r2, if1
	j else1
if1: daddi r4, r4, 2
	beq r2, r3, if2
	j fin
if2: daddi r4, r4, 1
	j fin
else1: beq r1, r3, if3
	beq r2, r3, if3
	j fin
if3: daddi r4, r4, 1
fin: sd r4, D(r0)
	halt