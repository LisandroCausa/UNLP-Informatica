	.data
tabla:	.word 34, 6, 8, 12, 30, 20, 9, 15, 7, 6
X:		.word 14
CANT:	.word 0
RES:	.word 0
	.code
	ld r1, X(r0)
	daddi r2, r0, 10 # contador loop
	dadd r3, r0, r0 # contador CANT
	dadd r4, r0, r0 # desplazamiento de direcciones memoria
loop: ld r5, tabla(r4)
	slt r6, r1, r5
	daddi r2, r2, -1
	sd r6, RES(r4)
	daddi r4, r4, 8
	beqz r6, fin_loop
	daddi r3, r3, 1
fin_loop: bnez r2, loop
	sd r3, CANT(r0)
	halt