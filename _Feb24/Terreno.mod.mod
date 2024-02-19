#L’appezzamento è rettangolare ed è stato diviso in quadratini uguali, di area pari
#ad un metro quadrato, con lati paralleli a quelli del rettangolo. Grazie ad osservazioni satellitari, di ogni quadratino è stata
#rilevata l’altezza rispetto ad un dato valore di riferimento
reset;
param nB;
param nH;
set B := 1..nB;
set H := 1..nH;
param q{B, H}; #Quota per ogni metro di terreno
param k; #Costo unitario per muovere un m3 di un metro di distanza
var x{B,H,B,H} integer;
var d{B,H,B,H} >=0;

s.t. def_d{i in B, j in H, w in B, z in H}:
	d[i,j,w,z] = sqrt(()^2 + ()^2);

data;
param nB := 20;
param nH := 10;
param q :
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 :=
1 -5 -4 -3 -2 -1 0 -1 -1 -1 0 1 1 1 2 3 4 3 3 4 5
2 -5 -4 -3 -2 -1 0 0 0 0 1 2 1 0 1 2 3 2 2 3 4
3 -4 -3 -3 -2 -1 0 1 0 1 0 1 0 -1 0 1 2 1 1 2 3
4 -4 -3 -2 -2 -1 0 1 0 1 1 1 0 -1 -1 0 1 0 0 1 2
5 -3 -2 -2 -2 -1 0 1 0 1 1 1 1 0 0 1 0 -1 -1 0 1
6 -2 -2 -2 -1 -1 0 1 1 1 2 2 2 1 0 0 -1 -2 -2 -1 0
7 -1 -1 -1 0 0 1 2 2 2 3 3 3 2 1 0 -1 -2 -3 -2 -1
8 0 0 -1 0 1 2 3 3 3 4 4 4 3 2 1 0 -1 -2 -3 -2
9 1 1 0 1 2 3 4 4 4 5 5 5 4 3 2 1 0 -1 -2 -3
10 2 2 1 2 3 4 5 5 5 6 6 6 5 4 3 2 1 0 -1 -2;
solve;
end;
