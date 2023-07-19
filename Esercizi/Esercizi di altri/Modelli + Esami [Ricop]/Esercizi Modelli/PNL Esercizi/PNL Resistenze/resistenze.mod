#ESERCIZIO 61 - PNL Resistenze

#DATI
param nT;					# Numero dei tipi di resistori
set T := 1..nT;				# Insieme dei tipi di resistori
param n {T};				# Numero
param r {T};				# Resistenza
param target;				# Il valore di resistenza desiderato
set P := 1..4;				# Posizioni

#VARIABILI
var x {T,P} binary;												# Assegnamento tipo-posizione
var R {p in P} = sum {t in T} r[t] * x[t,p];
var RR = R[1]*R[2]/(R[1]+R[2]) + R[3]*R[4]/(R[3]+R[4]);			#Resistenza risultante
var delta;

#VINCOLI
#Un resistore per ogni posizione
subject to Assign1 {p in P}:
	sum {t in T} x[t,p] = 1;

#Non piu' di n[t] resistori possono essere usati
subject to Assign2 {t in T}:
	sum {p in P} x[t,p] <= n[t];

#OBIETTIVO
minimize z: delta;
subject to minAbs1: delta >= RR - target;
subject to minAbs2: delta >= target - RR;

########################
data;

param nT := 6;

param:		n		r	:=
1			1		12
2			1		15
3			2		20
4			2		22
5			1		30
6			1		40;

param target := 65;

end;
