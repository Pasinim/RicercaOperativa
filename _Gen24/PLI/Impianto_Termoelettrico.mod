
set I := 1..5; #Insieme degli impianti termoelettrici
set G := 1..10; #Insieme dei giorni

param pMin{I}; #[MW]
param pMax{I}; #[MW]
param cF{I}; #[Euro]
param cV{I}; #[Euro/MWh]
param f{G}; #[MWh]

var x{I, G} binary; #Indica se l'impianto i è acceso nel giorno G
var energia{I, G} >= 0; #Indica la quantità di energia prodotta nel giorno G

s.t. assegnamento {g in G}:
	sum {i in I} x[i,g] >= 1;
s.t. fabbisogno {g in G}:
	sum{i in I} energia[i,g] = f[g];
	
s.t. lower {i in I, g in G}:
	 energia[i, g] >= pMin[i];
	 
s.t. upper {i in I, g in G}:
	 energia[i, g] <= pMax[i];


#Ob: Spesa minore
minimize z :
	sum{i in I, g in G} (cF[i] * x[i,g] +  cV[i]*energia[i, g]);
data;
param : 	pMin	pMax	cF	cV :=
1 100 650 1900 25
2 150 600 1500 32
3 200 500 2400 22
4 150 400 2000 24
5 220 500 2800 15
;

param f := 
1 45000
2 47000
3 56000
4 52000
5 48000
6 46000
7 51000
8 55000
9 45000
10 35000
;

end;

