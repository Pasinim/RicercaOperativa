# ESERCIZIO PLI Set Covering

#DATI
param nU;					# Numero degli utenti
param nL;					# Numero dei luoghi
set U := 1..nU;				# Insieme degli utenti
set L := 1..nL;				# Insieme dei luoghi
param a {U,L};				# Se il luogo L copre o no l'utente U (matrice di copertura)
param c {L};				# Il costo di ogni luogo

#VARIABILI
var x {L} binary;			# x[i] assume valore 1 se il luogo viene usato (selezione)

#VINCOLI
# Ogni utente deve essere coperto da almeno uno dei luoghi possibili
subject to Copertura {i in U}:
	sum {j in L} a[i,j] * x[j] >= 1;

#OBIETTIVO
# Minimizzare il costo complessivo dei luoghi scelti

minimize z : sum {j in L} c[j] * x[j];

#######################
data;
param nU := 5;
param nL := 10;

param a : 	1	2	3	4	5	6	7	8	9	10 :=
1			1	0	0	0	1	1	1	0	1	1
2			0	0	0	1	1	0	0	0	1	0
3			0	0	0	0	1	1	0	0	0	0
4			0	0	0	0	0	0	1	1	1	0
5			1	1	1	0	0	0	0	1	1	1;

param c :=
1		205
2		311
3		450
4		274
5		321
6		469
7		327
8		631
9		750
10		400;

end;
