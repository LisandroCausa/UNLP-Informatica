PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
ORG 1000H
	LETRA DB "A"
ORG 2000H
	MOV AL, 11111101B ; Strobe de salida, Busy de entrada. bits (7-2) dejamos en entrada
	OUT CA, AL

	MOV AL, 0 ; todos los bits de salida
	OUT CB, AL

POLL: IN AL, PA
	AND AL, 1
	JNZ POLL ; pregunta por bit de Busy

	MOV AL, LETRA
	OUT PB, AL

	; setear Strobe en 1
	IN AL, PA
	OR AL, 00000010B
	OUT PA, AL
	
	NOP
	INT 0
END
