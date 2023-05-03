# ESERCIZIO arbitri

#DATA

param nA;					# Numero degli arbitri
param nG;					# Numero delle giornate
param nP;					# Numero delle partite
param nS;					# Numero delle squadre
set A := 1..nA;				# Insieme degli arbitri
set G := 1..nG;				# Insieme delle giornate
set P := 1..nP;				# Insieme delle partite
set S := 1..nS;				# Insieme delle squadre
param c{G,P,S};				# Matrice a 3 dimensioni, vale 1 sse la squadra S gioca la partita P nella giornata G

#VARIABILI 
#il problema decisionale consiste nel decidere QUALE arbitro assegnare ad ogni partita di ogni giornata

var x{A,G,P} binary;		#assume valore 1 sse l'arbitro A viene assegnato alla partita P della giornata G
var z1;						# il minimo numero di assegnamenti di uno stesso arbitro ad una stessa squadra
var z2;						# il massimo numero di assegnamenti di uno stesso arbitro ad una stessa squadra

#VINCOLI
#ogni partita in ogni giornata sia arbitrata da un arbitro
subject to VincoloUno{g in G, p in P}:
	sum{a in A} x[a,g,p] = 1;

#nessun arbitro puo dirigere piu' di una partita nella stessa giornata
subject to VincoloDue{a in A, g in G}:
	sum{p in P} x[a,g,p] <= 1;

#OBIETTIVO
#massimizzare la differenza tra il massimo ed il minimo numero di volte che uno stesso arbitro viene assegnato ad una stessa squadra (si tratta quindi di una funzione obiettivo MIN-MAX)

minimize z: z2 - z1;

subject to VincoloObj1 {a in A, s in S}:
	z1 <= sum {g in G, p in P} c[g,p,s] * x[a,g,p];

subject to VincoloObj2 {a in A, s in S}:
	z2 >= sum {g in G, p in P} c[g,p,s] * x[a,g,p];

#########################
data;
param nA := 4;
param nG := 5;
param nP := 3;
param nS := 6;

end;
