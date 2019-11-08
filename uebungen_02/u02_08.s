	.global _start

_start:
	MOVW R0,#321
	MOV R1,#189
	ADD R0,R0,R1

_exit:
	MOV R7,R1
	SWI 0

/*  
Nach erstem ausführen (ohne MOVW): Programm kompiliert nicht, Fehlercode: Error: invalid constant (141) after fixup

Nach der Änderung MOV -> MOVW: 254     (Binär: 0000 1111 1110)

Manuelle Berechnung von 321 + 189: 510 (Binär: 0001 1111 1110)

Daraus folgt: Bei der Betrachtung der Ergebnisse fällt auf, dass nur die rechten 8 Bit gleich sind.
In den Registern befinden sich allerdings die richtigen Werte. 
Das liegt daran, dass bei dem Aufruf des Ergebnisses durch den Befehl echo nur 8 Bits ausgegeben werden können.


*/