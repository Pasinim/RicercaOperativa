param nT := 2; #Numero dei diversi tipi di packaging
set T := 1..nT;
param nO := 11;
set O := 1..nO; #Insieme degli oggetti da spedire
param v{O}; #Volume degli oggetti
param w{O}; #Peso degli oggetti
param costo{T};
param vMin{T};
param vMax{T};
param pMin{T};
param pMax{T};
param nP{T}; #Numero di pacchi per tipo di packaging
set P{k in T} := 1..nP[k];
#Dato un insieme di oggetti da spedire si vuole organizzare la loro spedizione in modo da soddisfare tutti i vincoli imposti dal sistema postale, minimizzando i costi
var y{k in T, P[k]} binary; #Variabile binaria che associa ad ogni pacco un tipo
var x{O, k in T, P[k]} binary; #indica, per ogni oggetto, a che tipo di packaging è associato, e indica in che pacchetto di tipo T viene inserito O


#Ci sono due pacchi per ogni pacchetto, non posso quindi fare più di 2 pacchi per tipologia
s.t. disponibilita {o in O, k in T}:
	sum {j in P[k]} x[o,k,j] <= 2;
s.t. volumeMinimo {t in T,  k in P[t]}:
	sum {o in O} x[o,t,k] *v[o] >= vMin[t] * y[t,k]; #solo se il paccho è utilizzato
s.t. volumeMassimo {t in T, k in P[t]}:
	sum {o in O} x[o,t,k] *v[o] <= vMax[t] * y[t,k];

s.t. pesoMinimo {t in T, k in P[t]}:
	sum {o in O} x[o,t,k] *w[o] >= pMin[t]* y[t,k];
s.t. pesoMassimo {t in T, k in P[t]}:
	sum {o in O} x[o, t, k] *w[o] <= pMax[t]* y[t,k];
s.t. assegnamento {o in O}: #Ogni oggetto deve essere assegnato ad un pacco
	sum {k in T, j in P[k] } x[o,k,j] = 1;
minimize z:
	sum {t in T, k in P[t]} y[k,t] * costo[t] ; 
data;
#Ho due pacchi per ogni packaging
param nP := 
1 2 
2 2
;
param: costo vMin vMax pMin pMax :=
1 10000 0 150 0 1500
2 15000 120 1000 1000 4000
;
param: v w :=
1 14 750
2 13 520
3 62 140
4 28 910
5 19 230
6 20 250
7 31 600
8 4 315
9 10 800
10 15 320
11 15 480
;
end;

