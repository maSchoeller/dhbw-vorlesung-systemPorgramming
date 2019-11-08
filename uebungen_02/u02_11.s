	.global _start

_start:
	MOV R0,#131
	MOV R1,#188
	MOV R2,#169

	STM SP!,{R0-R2}
_exit:
	MOV R7,#1
	SWI 0

/*  

Bei Debuggen erhoeht sich Stack Pointer Adresse. (ascending)
Aktueller Stackpointer zeigt in eine Unbeschriebene Adresse. (empty)
Stack Strategie: Empty Ascending 

*/