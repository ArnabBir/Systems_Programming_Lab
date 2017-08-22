TITLE A1_1:ASSIGNMENT_1_QUES_1
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
  MOV AH,2
  MOV CL,6
  P_LOOP:
        MOV CH,CL
        P1_LOOP:
                MOV DL,'A'
                MOV BH,1
                P2_LOOP:
                        INT 21H
                        INC DL
                        INC BH
                        CMP BH,CH
                        JLE P2_LOOP
                DEC CH
                JNZ P1_LOOP
        DEC CL
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        JNZ P_LOOP
  MOV AH,4CH
  INT 21H
MAIN ENDP
END MAIN

        
