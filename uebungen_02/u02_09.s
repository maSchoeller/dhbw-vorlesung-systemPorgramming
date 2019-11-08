	.global _start

_start:
	MOV R0,#222
	MOVW R1,#333
	SUB R0,R0,R1

_exit:
	MOV R7,R1
	SWI 0

/*  

Berechnung von 1c vom vorherigen Übungsblatt: 333-222=111

Zahlen der Aufgabe 1c werden mit den Werten aus 1d ersetzt.
Nach dem ersten ausführen lautet das Ergebnis: 145 

Manuelle Berechnung von 222-333 = -111 (Binär: 1001 0001)
Durch die Umwandlung des Ergebnisses (145) durch das 2er Komplement wird es zu -111


*/