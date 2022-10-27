	.data
str1: .asciiz "holanda"
str2: .asciiz "hola"
	.code
	daddi $a0, $zero, str1
	daddi $a1, $zero, str2
	jal identicas
	halt
identicas: dadd $v0, $zero, $zero
loop: dadd $t2, $a0, $v0
	dadd $t3, $a1, $v0
	lb $t0, 0($t2)
	lb $t1, 0($t3)
	bne $t0, $t1, fin_rut
	daddi $v0, $v0, 1
	beqz $t0, fin_str
	beqz $t1, fin_str
	j loop
fin_str: bne $t0, $t1, fin_rut
	daddi $v0, $zero, -1 # son identicas
fin_rut: jr $ra