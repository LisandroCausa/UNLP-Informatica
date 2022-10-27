	.data
tabla: .word 7, 10, 4, 9, 12, 3, 0
	.code
	# PROGRAMA PRINCIPAL
	daddi $sp, $zero, 0x400 # Pila
	daddi $a0, $zero, tabla
	jal CANT_IMPARES
	halt
	####################

CANT_IMPARES: daddi $sp, $sp, -24
	sd $ra, 0($sp) # return address
	sd $s0, 8($sp) # contador
	sd $s1, 16($sp) # desplazamiento
	dadd $s0, $zero, $zero
	dadd $s1, $zero, $a0
loop: ld $a0, 0($s1)
	daddi $s1, $s1, 8
	beqz $a0, fin_rut
	jal ES_IMPAR
	beqz $v0, loop
	daddi $s0, $s0, 1
	j loop
fin_rut: dadd $v0, $zero, $s0 # return s0 (contador)
	# POPs
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	ld $s1, 16($sp)
	daddi $sp, $sp, 24
	jr $ra

ES_IMPAR: andi $v0, $a0, 1
	jr $ra