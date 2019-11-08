	.global _start

_start: 
	/*Variablen in Register laden + Stack befüllen*/
	MOV R0,#131
	PUSH {R0}

	MOV R1,#188
	PUSH {R1}

	MOV R2,#169
	PUSH {R2}

	POP {R4}

	LDR R0,[R13]

_exit:
	MOV R7,#1
	SWI 0
