TITLE A3_1:ASSIGNMENT_3_QUES_1
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 0DH,0AH,'$'
	ENTR DB 'ENTER AN INTEGER$'
	GCD DB 'GCD = $'
	M DW ?
	N DW ?
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	MOV AH,9
	LEA DX,ENTR
	INT 21H
	LEA DX,MSG
	INT 21H
	CALL INDEC
	MOV M,AX
	MOV AH,9
	LEA DX,ENTR
	INT 21H
	LEA DX,MSG
	INT 21H
	CALL INDEC
	MOV N,AX
	CMP M,AX
	JL P1
	MOV BX,N
	JMP P2
	P1:
		MOV BX,M
	P2:			
		LOOP1:
			MOV AX,M
			MOV DX,0
			DIV BX
			CMP DX,0
			JNE P3
			MOV AX,N
			MOV DX,0
			DIV BX
			CMP DX,0
			JE END1
			P3:
				DEC BX
				JMP LOOP1
	END1:
		MOV AH,9
		LEA DX,GCD
		INT 21H
		MOV AX,BX
		CALL OUTDEC
	MOV AH,4CH
	INT 21H
MAIN ENDP
INCLUDE d:\INDEC.ASM
INCLUDE d:\OUTDEC.ASM
END MAIN