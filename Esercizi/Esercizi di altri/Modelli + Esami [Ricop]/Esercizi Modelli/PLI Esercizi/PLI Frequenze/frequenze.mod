#ESERCIZIO PLI Frequenze

#DATI
param nF;					# Numero di frequenze
set F := 1..nF;				# Insieme di frequenze
param freq {F};				# Valori delle frequenze
param K;					# Distanza minima

#VARIABILI
var x {F} binary;			# Selezione di ogni frequenza

#VINCOLI
# Incompatibilita’ tra frequenze che interferiscono
subject to Incompatibility {i in F, j in F: (i < j) and (freq[j] - freq[i] < K) }:
	x[i] + x[j] <=1;

#OBIETTIVO
# Scegliere il massimo numero di frequenze
maximize z : sum {i in F} x[i];

#####################
data;

param nF := 22;

param freq := 
1		101
2		103
3		105
4		107
5		109
6		110
7		112
8		114
9		116
10		118
11		121
12		124
13		125
14		128
15		129
16		132
17		133
18		134
19		135
20		136
21		138
22		140;

param K := 5;

end;
