	.global _start

_start:
	MOV R5,#73
	MOV R6,#25
	MOV R0,#0

loop:
	ADD R0,R0,R5
	SUB R6,#1
	CMP R6,#0
	BGT loop
_exit:
	MOV R7,#1
	SWI 0
