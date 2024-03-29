N EQU 5
HAND_DATO EQU 40H
HAND_ESTADO EQU 41H
ORG 1000H
	INPUT DB ?
ORG 3000H
POLL: IN AL, HAND_ESTADO
	AND AL, 1
	JNZ POLL
	RET
ORG 2000H
	MOV CL, N
	MOV BX, OFFSET INPUT
LECTURA: INT 6
	INC BX
	DEC CL
	JNZ LECTURA
	MOV AL, 01111111B
	OUT HAND_ESTADO, AL

	MOV CL, N
	MOV BX, OFFSET INPUT
IMPRI1: CALL POLL
	MOV AL, [BX]
	OUT HAND_DATO, AL
	INC BX
	DEC CL
	JNZ IMPRI1
	
	MOV CL, N
	MOV BX, OFFSET INPUT + N - 1
IMPRI2: CALL POLL
	MOV AL, [BX]
	OUT HAND_DATO, AL
	DEC BX
	DEC CL
	JNZ IMPRI2
	INT 0
END
