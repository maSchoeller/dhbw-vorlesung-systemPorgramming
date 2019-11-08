	.global _start
_start:

	MOVW R0, #821	@Dividend
	MOV R1, #11		@Divisor
	MOV  R2,#0		@Verschieben
	MOV R3,R0		@Rest der Division
	MOV R4,#0		@Ergebnis
	MOV R5,#0		@holende Zahl


_teilen:
	
	CMP R0,R1
	BLT _exit
	B kuerzenFirst
kuerzen:
	ADD R2, R2, #1		@ verschiebung erhöhen
kuerzenFirst:
	MOV R3, R0, LSR R2 	@R0 um R2 Stellen kürzen -> in R3
	CMP R3, R1
	BGE kuerzen
	SUB R2,R2, #1		@Anzahl abgeschnittene und damit nachher zu holende stellen
	
	MOV R3, R0, LSR R2	@erste Teildividend
shift: 
	MOV R4,R4, LSL #1 	@vor jedem Durchlauf Ergebnisregister R4 um 1 Stellen nach links schieben 

	CMP R3,R1 
	BLT shiftsub
	SUB R3,R3, R1
	ADD R4,R4, #1
shiftsub:
	SUB R2,R2,#1
	CMP R2,#0
	BLT finish
	MOV R5,R0, LSR R2
	AND R5,R5,#1
	MOV R3,R3, LSL #1
	ADD R3,R3,R5
	B shift
finish:
	MOV R0,R4
	MOV R1,R3

_exit: 
	MOV R7,#1
	SWI 0



