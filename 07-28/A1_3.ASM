TITLE A1_3:ASSIGNMENT_1_QUES_3
.MODEL SMALL
.STACK 100H
.DATA
        MSG DB 0DH,0AH,'$'
        MSG2 DB 'NUMBER OF CHARACTERS BETWEEN 70 AND 80: $'
        MSG3 DB 'MAXIMUM ASCII CODE IS FOR: $'
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV CH,9
        MOV CL,'0'
        MOV BH,0
        P1_LOOP:
                MOV AH,9
					LEA DX,MSG
					INT 21H
                MOV AH,2
					MOV DL,'?'
					INT 21H
                MOV AH,1
					INT 21H
					MOV BL,AL
					CMP BL,70
						JL P2
					CMP BL,80
						JG P2
					INC CL
					P2:CMP BH,BL
						JG P3
					MOV BH,BL
				P3:DEC CH
				JNZ P1_LOOP
		MOV AH,9
			LEA DX,MSG
			INT 21H
			LEA DX,MSG2
			INT 21H
        MOV AH,2
			MOV DL,CL
			INT 21H
        MOV AH,9
            LEA DX,MSG
            INT 21H
            LEA DX,MSG3
            INT 21H
        MOV AH,2
			MOV DL,BH
			INT 21H
        MOV AH,4CH
			INT 21H
MAIN ENDP
END MAIN
