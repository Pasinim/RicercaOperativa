param nP := 3;
param nF := 7;
param nA := 2; #Suddivisione in due aziendi minori
set A := 1..nA;
set P := 1..nP;
set F := 1..nF;
param fatturato{F, P};

var fatturato1{P} >=0;
var x{F} binary; #1 sse F viene assegnata ad AF1
var fatturato2{P} >=0;
var alfa >= 0;

subj to def_fatt1 {p in P}:
	sum {f in F} x[f] * fatturato[f,p] = fatturato1[p];

subj to def_fatt2 {p in P}:
	sum {f in F} (1-x[f]) * fatturato[f,p] = fatturato2[p];
	
	
	

#OB: Minimizzare la massima differenza tra una azienda figlia e quell'dell'altra rispetto ad uno stesso prodotto
minimize z: alfa;
subj to lin1 {p in P}: alfa >= fatturato1[p] - fatturato2[p];
subj to lin2 {p in P}: alfa >= fatturato2[p] - fatturato1[p];



data;

param fatturato : 1 2 3 :=
1 83 14 42
2 38 63 56
3 28 24 12
4 59 7 53
5 25 35 83
6 52 86 85
7 59 64 25
;
end;

