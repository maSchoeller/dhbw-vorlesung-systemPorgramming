
/*
	Benötigt lib_math.s und libc-calls 
	Spezifikation:
		Eingabe: 2 Zahlen
		Vorbedingungen: Zahlen müssen im bereich der reelen Zahlen sein
		Ausgabe: Ergebnis der Beiden zahlen nach Multiplikation und Division
		Nachbedingung: siehe lib_math.s
*/

	.global main
main:
	PUSH {LR}

    @ Eingabe First Word
	LDR R0, =eingabe
	MOV R1, #1
	BL printf

	SUB SP,SP,#4
	LDR R0,=scanformat
	MOV R1,SP
	BL scanf
	LDR R6, [SP] @saving first word
	ADD SP, SP, #4

	@ Eingabe Second Word
	LDR R0, =eingabe
	MOV R1,#2
	BL printf
	
	SUB SP,SP,#4
	LDR R0,=scanformat
	MOV R1,SP
	BL scanf
	LDR R7, [SP] 		@saving second word
	ADD SP, SP, #4

	@ Berechung und Ausgabe Multiplikation
	MOV R0,R6   	 	@move first word into r0 to multiply
	MOV R1,R7	 		@move second word into r1 to multiply
	BL mult_r0_mit_r1

	@Ausgabe auf stdio
	MOV R3,R0
	LDR R0,=stringm
	MOV R1,R6
	MOV R2,R7
	BL printf

	@ Berechnung und Ausgabe Division
	MOV R0,R6			@move first word into R0 to divide
	MOV R1,R7			@move second word into R1 do divide
	BL div_r0_durch_r1
	MOV R3, R0
	LDR R0,=stringd
	MOV R1,R6
	MOV R2,R7
	BL printf
	POP {PC}
_exit:
	MOV R7,#1
	SWI 0

.data
stringm: 	.asciz "%d * %d = %d \n"
stringd: 	.asciz "%d / %d = %d \n"

eingabe: 	.asciz "Zahl %d. eingeben:\n"
scanformat: 	.asciz "%d"

