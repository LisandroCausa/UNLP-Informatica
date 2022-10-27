	.data
tabla: .word 100, 6, 4, 77, 5, 8, 10, 7, 8, 1
length: .word 10
M: .word 7
	.code
	ld $a0, M($zero)
	daddi $a1, $zero, tabla
	ld $a2, length($zero)
	jal cant_mayores
	halt
cant_mayores: dadd $v0, $zero, $zero
	dadd $t1, $a1, $zero
loop: beqz $a2, fin_rut
	ld $t0, 0($t1)
	daddi $t1, $t1, 8 # desplazamiento +8
	slt $t2, $a0, $t0 # compara: M < tabla[t1]
	daddi $a2, $a2, -1
	beqz $t2, loop
	daddi $v0, $v0, 1 # incrementa contador (valor de retorno)
	j loop
fin_rut: jr $ra