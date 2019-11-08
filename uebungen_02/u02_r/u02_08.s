	.global _start

_start:
	MOVW R0,#321
	MOV R1,#189
	ADD R0,R0,R1

_exit:
	MOV R7,#1
	SWI 0


/*
	Mit MOV kompiliert das Programm nicht da  
	Ergebnis Theorie:  443


*/
