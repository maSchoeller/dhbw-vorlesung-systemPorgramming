	.global _start

_start:
	MOV R0,#131
	MOV R1,#188
	MOV R2,#169
	STM SP!, {R0-R2}
	LDMEA SP!, {R3-R5}
_exit:
	MOV R7,#1
	SWI 0
