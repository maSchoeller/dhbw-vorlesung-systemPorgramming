

/********************************************************************************/
/*  library: 		lib_math.s													*/
/*  description:	Contains functions for multiplikattion and division			*/
/*					function mult_ro_mit_r1: muliply two numbers				*/
/*					function div_r0_durch_r1: divide ro to r1					*/	
/*	depends on:		---															*/
/********************************************************************************/
	.global mult_r0_mit_r1
	.global div_r0_durch_r1

/************************************************************************/
/*  function: mult_r0_mit_r1											*/
/*	description:  muliply two numbers, number1 in R0, number2 in R1 	*/
/************************************************************************/
/*	input: 	R0: factor one												*/
/*			R1: factor two												*/
/*	output:	R0: result from multiplication								*/
/*	helper: R1, may to be saved											*/
/************************************************************************/
mult_r0_mit_r1:
	MOV R2,R0
	SUB R1,#1
loop:
	ADD R0,R0,R2
	SUB R1,#1
	CMP R1,#1
	BGE loop
	MOV PC,LR


/********************************************/
/*  function: div_r0_durch_r1				*/
/*	description:  Divid R0 by R1			*/
/********************************************/
/*	input: 	R0: Dividend					*/
/*			R1: Divisor 					*/
/*	output:	R0: result from divion			*/
/*	helper: R2,R3,R4,R5 may to be saved		*/
/********************************************/

div_r0_durch_r1:
	@init registers
	MOV R2,#0
	MOV R3,R0
	MOV R4,#0
	MOV R5,#0

	CMP R0,R1
	BLT _finish
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
_finish:
	MOV PC,LR
