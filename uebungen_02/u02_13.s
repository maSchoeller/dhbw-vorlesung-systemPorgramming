	.global _start

_start:
	
	MOV R5,#25
	MOV R6,#73
	MOV R0,#0

loop: 	
	ADD R0,R0,R5
	SUB R6,#1
	CMP R6,#0
	BGT loop

_exit:
	MOV R7,#1
	SWI 0

/*  

Die Berechnung ergibt: 33                   (Binaer:      0010 0001)

Eigentlich ergibt die Rechnung 25*73 = 1825 (Binaer: 0111 0010 0001)

Daraus ergibt sich wie bei Aufgabe u02_08, dass echo nur 8 Bit zur Ausgabe verdenen kann.
Im Debugger allerdings ist das richtige Ergebnis (1825) zu erkennen.

(Alle Ergebnisse wurden mit echo ausgegeben)

*/