#ESERCIZIO 108 - PNL Nutrie

#DATI
param nP;					# Numero di paesi
set P := 1..nP;				# Insieme dei paesi
param n {P};				# Nutrie in ogni paese
param maxp;					# Max num paesi per ogni cacciatore
param nC;					# Numero di cacciatori
set C := 1..nC;				# Insieme di cacciatori

#VARIABILI
var x {P,C} binary;			# Assegnamento
#N. cacciatori in ogni paese
var k {p in P} = sum {c in C} x[p,c];
#Quota di nutrie assegnata ad ogni cacciatore
var quota {c in C} = sum {p in P} n[p]/k[p] * x[p,c];
var maxq;

#VINCOLI
#Max n. di paesi per ogni cacciatore
subject to Assign {c in C}: sum {p in P} x[p,c] <= maxp;

# Almeno un cacciatore per ogni paese
subject to Almeno1 {p in P}: k[p] >= 1;

#OBIETTIVO
minimize z: maxq;
subject to minmax {c in C}: maxq >= quota[c];

###############################
data;

param nP := 10;
param nC := 5;
param maxp := 3;
param n :=
1	20
2	30
3	24
4	36
5	80
6	72
7	54
8	37
9	25
10	47;

end;
