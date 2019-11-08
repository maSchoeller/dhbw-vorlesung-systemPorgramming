	.global _start

_start:
	MOV R0,#131
	MOV R1,#188
	MOV R2,#169

	PUSH {R0}
	PUSH {R1}
	PUSH {R2}

	POP {R4}

	LDR R0, [R13]

_exit:
	MOV R7,R1
	SWI 0

/*  
Das Ergebnis lautet: 188

Erkenntnis 1: Durch Ausgabe des Stackwertes durch das laden von SP/R13 in R0 bekommt man den obersten Wert des Stacks d.h. die verwendete Strategie 
              ist ein Full Stack.
Erkenntnis 2: Die Frage ist, ob ein Full Ascending oder ein Full Descending verwendet wird. Auf die Loesung dieser Frage kommt man durch debuggen.
              Dadurch, dass die Adresse des Stackpointer immer kleiner wird erkennt man das die verwendete Strategie: Full Descending ist.
*/