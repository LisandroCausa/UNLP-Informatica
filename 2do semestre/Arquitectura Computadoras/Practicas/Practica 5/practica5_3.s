	.data
base: .double 5.85
altura: .double 13.47
dos: .double 2.0
res: .double 0
	.code
	l.d f0, base($zero)
	l.d f1, altura($zero)
	l.d f3, dos($zero)
	mul.d f2, f0, f1
	div.d f4, f2, f3
	s.d f4, res($zero)
	halt