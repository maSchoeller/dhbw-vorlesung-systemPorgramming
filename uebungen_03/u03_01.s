	.global _start

_start:
	MOV R0,#73
	MOV R1,#25
	BL mult_r0_mit_r1
	MOV R5,R0
	MOV R0,#127
	MOV R1,#7
	BL mult_r0_mit_r1
	MOV R6,R0
	BLT _exit

mult_r0_mit_r1:
	MOV R2,R0
	SUB R1,#1
loop:
	ADD R0,R0,R2
	SUB R1,#1
	CMP R1,#1
	BGE loop
	MOV PC,LR


_exit:
	MOV R7,#1
	SWI 0
