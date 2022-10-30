	.data
peso: .double 75.7
estatura: .double 1.73
IMC: .double 0
estado: .word 0
###########
infrapeso: .double 18.5
normal: .double 25
sobrepeso: .double 30
	.code
	l.d F1, estatura($zero)
	l.d F0, peso($zero)
	mul.d F2, F1, F1
	div.d F3, F0, F2
	s.d F3, IMC($zero)
	l.d F11, infrapeso($zero)
	l.d F12, normal($zero)
	l.d F13, sobrepeso($zero)
	daddi $t0, $zero, 1
	c.lt.d F3, F11
	bc1t fin
	daddi $t0, $t0, 1
	c.lt.d F3, F12
	bc1t fin
	daddi $t0, $t0, 1
	c.lt.d F3, F13
	bc1t fin
	daddi $t0, $t0, 1
fin: sd $t0, estado($zero)
	halt