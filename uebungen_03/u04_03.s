/*	
	Multipliziert und dividiert 2 Zahlen.
 	Gibt diese mit printf aus der libc-calls library aus
*/
	.global main
main:
	PUSH {LR}
	MOV R0,#25
	MOV R1,#73

	@Multiplikation von R0 und R1
	BL mult_r0_mit_r1

	@Ausgabe auf stdio
	MOV R3,R0
	LDR R0,=stringm
	MOV R1,#25
	MOV R2,#73
	BL printf


	LDR R0,=821
	MOV R1,#11

	@Division von R0 und R1
	BL div_r0_durch_r1
	MOV R3, R0
	
	@Ausgabe auf stdio
	LDR R0,=stringd
	LDR R1,=821
	MOV R2,#11
	BL printf
	POP {PC}
_exit:
	MOV R7,#1
	SWI 0

.data
stringm: 	.asciz "%d * %d = %d \n"
stringd: 	.asciz "%d / %d = %d \n"
