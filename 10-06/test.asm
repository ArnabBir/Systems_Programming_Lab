TITLE TEST:LAB_TEST
.MODEL SMALL

SAVE_REGS MACRO REGS
	IRP D,<REGS>
		PUSH D
	ENDM
ENDM

;POPING REGISTERS
RESTORE_REGS MACRO REGS
	IRP D,<REGS>
		POP D
	ENDM
ENDM

;END OF THE PROGRAM
DOS_RTN MACRO
	MOV AH,4CH
	INT 21H
ENDM

NEW_LINE MACRO
	SAVE_REGS <AX,DX>
	MOV AH,2
	MOV DL,0DH
	INT 21H
	MOV DL,0AH
	INT 21H
	RESTORE_REGS <DX,AX>
ENDM

.STACK 100H
.DATA
	STRNG DB 30 DUP(?)
	LARGST DW 0
	POS DB 30 DUP(?)
	TTL DW 0
	ENTR DB 'INPUT: $'
	ENTR_ALP DB 'ALPHABET: $'
	DISP1 DB 'For alphabet $'
	START DB ': starting index : $'
	LEN DB ' length : $'
	SUBS DB '; subsequence : $'
	NP DB 'NOT PRESENT$'
.CODE

;MAIN PROCEDURE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	NEW_LINE
	LEA DI,STRNG
		MOV AH,9
		LEA DX,ENTR
		INT 21H
		
	;calling procedure to read a string
	CALL READ_STR
		MOV AH,9
		LEA DX,ENTR_ALP
		INT 21H
		; getting an alphabet as input
		MOV AH,1
		INT 21H
		NEW_LINE
	; calling a procedure to get the largest contiguous subsequence
	CALL LARGEST
	NEW_LINE
	
	; calling a procedure to display the results
	CALL DISPLAY
	NEW_LINE
	DOS_RTN
MAIN ENDP

;TO READ A STRING
READ_STR PROC
	;INPUT DI: effective address of the string
	;BX: no. of characters read
	SAVE_REGS <AX,DI>
	CLD
	XOR BX,BX
	MOV AH,1
	INT 21H
	LOOP1:
		CMP AL,0DH
		JE END1
		CMP AL,08H
		JNE E1
		DEC DI
		DEC BX
		JMP LOOPEND1
	E1: ; to check for A and B
		CMP AL,'A'
		JE E2
		CMP AL,'B'
		JE E2
		JMP LOOPEND1
	E2:
		STOSB
		INC BX
	LOOPEND1:
		INT 21H
		JMP LOOP1
	END1:
		RESTORE_REGS <DI,AX>
		RET
READ_STR ENDP


; procedure to find the largest contiguous subsequence in the array/string
LARGEST PROC
	SAVE_REGS <AX,BX,CX,DX>
		XOR SI,SI
		MOV CX,BX
		XOR BX,BX
		XOR DI,DI
		
		;loop to compare traverse the complete string
		LOOP2:
			XOR DX,DX
			
			;loop to get the length of subsequences
			LOOP3:
				INC BH
				CMP AL,STRNG[SI]
				JNE RPT
				CMP DX,0
				JNE P1
				MOV BL,BH
				P1:
					INC DX
					INC SI
				CMP CX,0
				JLE END2
					LOOP LOOP3
			
			;checking for the largest length and declare the position
			RPT:
				INC SI
				CMP DX,LARGST
				JL LOOP2_END
				JE SOME
				XOR DI,DI
				MOV LARGST,DX
				SOME:
					MOV POS[DI],BL
					INC DI
		LOOP2_END:
				CMP CX,0
				JLE END2
			LOOP LOOP2
		END2:
		MOV TTL,DI
	RESTORE_REGS <DX,CX,BX,AX>
	RET
LARGEST ENDP


;procedure to display the results
DISPLAY PROC
	SAVE_REGS <AX,DX>
	
		MOV AH,2
		
		; to check for the presence of the alphabet
		MOV CX,LARGST
		CMP CX,0
		JE FINAL
		MOV CX,BX
		
		
		MOV AH,9
		LEA DX,DISP1
		INT 21H
		MOV AH,2
		MOV DL,AL
		INT 21H
		
		; to display the starting index
		MOV AH,9
		LEA DX,START
		INT 21H
		MOV AH,0
		MOV CX,TTL
		XOR DI,DI
		TOTAL:
			MOV AL,POS[DI]
			INC DI
			CALL OUTDEC
				PUSH AX
				PUSH DX
				MOV AH,2
				MOV DL,','
				INT 21H
				POP DX
				POP AX
			LOOP TOTAL
			
		; to display the length of the largest subsequence
		MOV AH,9
		LEA DX,LEN
		INT 21H
		MOV AX,LARGST
		CALL OUTDEC
		MOV AH,9
		LEA DX,SUBS
		INT 21H
		
		; to display the largest subsequence
		MOV CL,POS
		MOV CH,0
		XOR SI,SI
		L3:
			INC SI
			LOOP L3
		DEC SI
		MOV CX, LARGST
		MOV AH,2
		L4:
			MOV DL,STRNG[SI]
			INT 21H
			INC SI
			LOOP L4
		JMP END3
		
	; to display appropriate message if not present
	FINAL:
		MOV AH,9
		LEA DX,NP
		INT 21H
	END3:
	RESTORE_REGS <DX,AX>
	RET
DISPLAY ENDP

INCLUDE d:\OUTDEC.ASM
END MAIN