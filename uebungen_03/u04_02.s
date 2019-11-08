	.global _start

_start:
	MOV R0,#25
	MOV R1,#73
	BL mult_r0_mit_r1
	MOV R9,R0

	LDR R0,=821
	MOV R1,#11
	BL div_r0_durch_r1
	MOV R8, R0

_exit:
	MOV R7,#1
	SWI 0
