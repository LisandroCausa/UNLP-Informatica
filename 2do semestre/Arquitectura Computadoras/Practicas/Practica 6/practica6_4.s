	.data
CONTROL: .word32 0x10000
DATO: .word32 0x10008
asterisco: .asciiz "*"
clave: .asciiz "aK7g"
msj_bienv: .asciiz "Bienvenido"
msj_error: .asciiz "ERROR"
entrada: .asciiz ""
	.space 8
	.code
	# $s6 CONTROL
	# $s7 DATO
	ld $s6, CONTROL($zero)
	ld $s7, DATO($zero)
	# $s0 DESPLAZAMIENTO
	# $s1 contador For
ingresar_clave: dadd $s0, $zero, $zero
	daddi $s1, $zero, 4
for: jal char
	sb $v0, entrada($s0)
	daddi $s1, $s1, -1
	daddi $s0, $s0, 1
	bnez $s1, for
	daddi $a0, $zero, entrada
	jal respuesta
	bnez $v0, ingresar_clave
	halt

	# $v0 caracter
char: daddi $t0, $zero, 9
	sd $t0, 0($s6)
	lbu $v0, 0($s7)
	daddi $t0, $zero, asterisco
	sd $t0, 0($s7)
	daddi $t0, $zero, 4
	sd $t0, 0($s6)
	jr $ra

	# $a0 dir cadena
	# $v0 = 0 si son iguales
respuesta: daddi $a1, $zero, clave
loop_resp: lbu $t0, 0($a0)
	lbu $t1, 0($a1)
	bne $t0, $t1, no_iguales
	beqz $t0, si_iguales
	daddi $a0, $a0, 1
	daddi $a1, $a1, 1
	j loop_resp
si_iguales: daddi $t0, $zero, msj_bienv
	sd $t0, 0($s7)
	daddi $t0, $zero, 4
	sd $t0, 0($s6)
	dadd $v0, $zero, $zero
	jr $ra
no_iguales: daddi $t0, $zero, msj_error
	sd $t0, 0($s7)
	daddi $t0, $zero, 4
	sd $t0, 0($s6)
	daddi $v0, $zero, 1
	jr $ra