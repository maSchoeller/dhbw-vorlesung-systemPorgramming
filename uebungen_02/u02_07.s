	.global _start

_start:
	MOV R0,#32
	MOV R1,#49
	ADD R0,R0,R1

_exit:
	MOV R7,R1
	SWI 0

@Ergebnis: 81
