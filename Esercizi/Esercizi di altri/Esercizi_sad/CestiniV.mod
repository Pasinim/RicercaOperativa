#dati
param nP;
set P:=1..nP; 
#fonti di pattume
param nL;
set L:=1..nL; 
#luoghi per i cestini
param nC; #numero di cestini
param tPL{L,P}; #[s] tempo dalle fonti di pattume ai luoghi
param quant{P}; #[kg/g] quantità pattume prodotto
param cap; #[kg]param M;

#variabili
var x{L} >=0 binary; #assegnamento dei cestini ai luoghi
var y{L,P} >=0 binary; #variabili binarie che mi indicano se un luogo riceve o meno del pattume
var buttati{L,P}>=0; #quantità buttata da ciascun pattume a ciascun luogo
var maxT >=0; #tempo del percorso più lungo
var maxC >=0; #capacità minima che deve avere il cestino più pieno 
var tMedio >= 0;
#vincoli#il pattume va in almeno un luogo
s.t. luoghi_pattume{p in P}: sum{l in L}y[l,p]>=1;
#metto solo 4 cestini nei luoghi
s.t. assegnamento: sum{l in L} x[l]<=nC;
#verifico che venga buttato il pattume solo in luoghi dove c'è un cestino
s.t. variabili_binarie{p in P, l in L}: y[l,p]<=x[l];
#prendo il tempo massimo fra quelli utilizzati
#s.t. tempo_massimo{p in P, l in L}:# maxT>=tPL[l,p]*y[l,p];
 #prendo la capacità massima fra i cestini
#s.t. cap_massima{l in L}:#maxC>=sum{p in P} buttati[l,p];
#calcolo tempo medio impiegato fra tutti i percorsi
#s.t. tempo_medio: maxT  =(sum {p in P, l in L} tPL[l,p]*y[l,p])/(sum{p in P, l in L} y[l,p]);
#capacità di ogni cestino, se non uso il cestino capacità nulla
s.t. buttati_cap{l in L}: sum{p in P}buttati[l,p]<=cap*x[l];
 #conservazione, verifico che tutto il pattume venga buttato

s.t. flow{p in P}: quant[p]=sum{l in L} buttati[l,p];

s.t. tempoMedio:
	tMedio >=  (sum{i in L, j in P} buttati[i,j]*tPL[i,j]) / sum{j in P} quant[j]; 

#obiettivo

minimize w: tMedio;#minimize z: maxC;
###################

data;
param nP:=5;
param nL:=6;
param nC:= 4;
#param M:=100;
param tPL: 1  2  3  4  5:=
 1      4 20 20 35 40 
 2      20  5 10 20 20 
 3      20  5  8 20 20 
 4      20  8  5 25 25
 5      40 15 12 10 12 
 6      40 15 20  8  2;
param quant:=
1 12
2  8
3  8
4 15
5 12;
param cap:= 20;

end;
