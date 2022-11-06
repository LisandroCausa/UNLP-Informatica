	.data
CONTROL: .word32 0x10000
DATO: .word32 0x10008
	.code
	lwu $s6, CONTROL($zero)
	lwu $s7, DATO($zero)
	jal ingreso
	dadd $s0, $zero, $v0
	jal ingreso
	dadd $s1, $zero, $v0
	dadd $a0, $zero, $s0
	dadd $a1, $zero, $s1
	jal resultado
	halt

ingreso: daddi $t0, $zero, 9
	sd $t0, 0($s6) # 9 a control
	lbu $t1, 0($s7)
	daddi $t1, $t1, -0x30 # convierte el ascii a numero
	slti $t0, $t1, 10
	bnez $t0, ret_num
	dadd $t1, $zero, $zero
ret_num: dadd $v0, $zero, $t1
	jr $ra

	# $a0 = operando A
	# $a1 = operando B
	# suma ambos operandos y muestra
	# el resultado en la terminal del simulador
resultado: dadd $t0, $a0, $a1
	sd $t0, 0($s7)
	daddi $t0, $zero, 2
	sd $t0, 0($s6)
	jr $ra