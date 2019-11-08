	.global _start

_start:
	MOV R0,#131
	MOV R1,#188
	MOV R2,#169

	STM SP!,{R0-R2}

	LDMEA SP!,{R3-R5}

_exit:
	MOV R7,#1
	SWI 0

/*  

Stack Strategie: EA
R0:131
R1:188
R2:169
R3:131
R4:188
R5:168

Beim Laden der Register R0 - R2 wird die Methode EA verwendet (werte nach LIFO Prinzip in Stack geladen).
Verwendet man diese Methode auch beim herausladen aus dem Stack werden die Werte 
in der gleichen Reihenfolge herausgeladen (nach FIFO Prinzip). (Aus Debugging erkennbar)

Strategien: 
STM -> EA 
LDM -> EA

*/