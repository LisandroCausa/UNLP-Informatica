	.data
CONTROL: .word32 0x10000
DATO: .word32 0x10008
ZERO: .asciiz "ZERO"
UNO: .asciiz "UNO"
DOS: .asciiz "DOS"
TRES: .asciiz "TRES"
CUATRO: .asciiz "CUATRO"
CINCO: .asciiz "CINCO"
SEIS: .asciiz "SEIS"
SIETE: .asciiz "SIETE"
OCHO: .asciiz "OCHO"
NUEVE: .asciiz "NUEVE"
	.code
	daddi $sp, $zero, 0x400
	lwu $s6, CONTROL($zero)
	lwu $s7, DATO($zero)
	jal ingreso
	dadd $a0, $zero, $v0
	jal muestra
	halt

ingreso: daddi $sp, $sp, -8
	sd $ra, 0($sp)
	daddi $t0, $zero, 9
	sd $t0, 0($s6) # 9 a control
	lbu $s0, 0($s7)
	daddi $s0, $s0, -0x30 # convierte el ascii a numero
	slti $t0, $s0, 10
	bnez $t0, ret_num
	dadd $s0, $zero, $zero
ret_num: dadd $v0, $zero, $s0
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

muestra: dsll $a0, $a0, 3 
	daddi $t0, $a0, ZERO
	sd $t0, 0($s7)
	daddi $t0, $zero, 4
	sd $t0, 0($s6)
	jr $ra
