PIC EQU 20H
HAND_DATO EQU 40H
HAND_ESTADO EQU 41H
ORG 52
	DIR_RUT DW RUT_IMP
ORG 3000H
RUT_IMP: PUSH AX
	MOV AL, [BX]
	OUT HAND_DATO, AL
	INC BX
	CMP BX, OFFSET FIN
	JNZ FIN_RUT
	MOV AL, 0FFH
	OUT PIC+1, AL
FIN_RUT: MOV AL, 20H
	OUT PIC, AL
	POP AX
	IRET
ORG 1000H
	MSG DB "UNIVERSIDAD NACIONAL DE LA PLATA"
	FIN DB ?
ORG 2000H
	CLI
	IN AL, HAND_ESTADO
	OR AL, 80H
	OUT HAND_ESTADO, AL
	MOV AL, 0FBH
	OUT PIC+1, AL
	MOV AL, 13
	OUT PIC+6, AL
	MOV BX, OFFSET MSG
	STI
LOOP: CMP BX, OFFSET FIN
	JNZ LOOP
	INT 0
END
