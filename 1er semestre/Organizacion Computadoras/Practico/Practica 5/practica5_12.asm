ORG 1000h
	X DB 3
	TABLA DB ?
ORG 2000h
	MOV CL, X
	MOV BX, OFFSET TABLA
LOOP: MOV CH, CL
	AND CH, 1 ; Z = 1 PAR.  Z = 0 IMPAR
	JZ PAR
	JMP IMPAR
PAR: SUB CL, 7
	JMP FIN_IF
IMPAR: ADD CL, 5
FIN_IF: MOV [BX], CL ; ALMACENA EN TABLA
	INC BX
	CMP CL, 0 ; WHILE(CL <> 0)
	JNZ LOOP
	HLT
END
