param nA;
param nS := 6;
param nG := 5;
set G := 1..nG;
set P := 1..3;
set S := 1..nS;
set A := 1..nA;
param match {G, P, S} binary; #variabile binaria che indica se la squadra S gioca la partita P nella giornata G

var x{A, P, G} binary; #indica se A è assegnato alla partita P nella giornata G
var z1; #minimo numero di assegnamento di uno stesso arbitro ad una stessa squadra
var z2; #massimo numero di assegnamento di uno stesso arbitro ad una stessa squadra


#un arbitro a partita, vincolo su ogni giornata e su ogni partita
subj to vincolo {g in G, p in P}: 
	sum {a in A } x[a,p,g] = 1	;

#lo stesso arbitro non può arbitrare più di una partita a giornata, e può arbitrare al più una partita 
subj to giornata {g in G, a in A}:
	sum {p in P} x[a,p,g] <= 1;
	
subj to vincolo1 {a in A, s in S}:
	sum {g in G, p in P} x[a,p,g] * match[g,p,s] >= z1;
	
subj to vincolo2 {a in A, s in S}:
	sum {g in G, p in P} x[a,p,g] * match[g,p,s] <= z2;

#Minimizzare la diff tra l max e il min numero di volte che uno degli arbitri viene assegnato ad una delle squadre nell'arco di tutto il campionato
minimize z: 
	 z2 - z1;
data;
param nA := 3;
#Non so come definire una matrice di 3 elementi
param match:  #G, P, S variabile binaria che indica se la squadra S gioca la partita P nella giornata G
     1  1  1  4 := 1,
     1  2  2  5 := 1,
     1  3  3  6 := 1;
	 
     2  1  1  6 := 0;
     2  2  2  4 := 0;
     2  3  3  5 := 0;

end;

