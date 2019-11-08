	.global _start

_start: 
	MOVW R0,#222
	MOVW R1,#333
	SUB R0,R0,R1

_exit:
	MOV R7,#1
	SWI 0
