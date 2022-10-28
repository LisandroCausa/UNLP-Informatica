	.data
valor: .word 4
result: .word 0
	.code
	daddi $sp, $zero, 0x400
	ld $a0, valor($zero)
	jal factorial
	sd $v0, result($zero)
	halt

factorial: daddi $t0, $zero, 1 # t0 = 1
	beq $a0, $t0, fin_recur # a0 == 1: fin_recur
	daddi $sp, $sp, -16
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	dadd $s0, $zero, $a0 # s0 = a0
	daddi $a0, $s0, -1 # a0 = (s0-1)
	jal factorial
	dmul $v0, $v0, $s0
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	daddi $sp, $sp, 16
	jr $ra
fin_recur: daddi $v0, $zero, 1
	jr $ra