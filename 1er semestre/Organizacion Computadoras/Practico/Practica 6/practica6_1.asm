ORG 1000h
	NUM1 DW 1234h, 0FFFFh
	NUM2 DW 5400h, 0320h
	RESUL DW 0000h, 0000h
	BIEN DW 0000h, 0000h
	MAL DW 0000h, 0000h
ORG 2000h
	MOV BX, OFFSET NUM1 + 2
	MOV CX, [BX]
	MOV BX, OFFSET NUM2 + 2
	MOV DX, [BX]
	ADD CX, DX
	PUSH CX
	MOV CX, NUM1
	MOV DX, NUM2
	ADC CX, DX
	JO THEN
	JMP ELSE
THEN: MOV DX, OFFSET MAL
	JMP FIN_IF
ELSE: MOV DX, OFFSET BIEN
FIN_IF: MOV BX, DX
	MOV [BX], CX
	MOV BX, OFFSET RESUL
	MOV [BX], CX
	POP CX
	ADD BX, 2
	MOV [BX], CX
	MOV BX, DX
	ADD BX, 2
	MOV [BX], CX
	HLT
END
