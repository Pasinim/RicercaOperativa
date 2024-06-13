param nS;
param nC;
set S := 1..nS;
set C := 1..nC;
param grandezza{S};
param compressione{S};
param cMax := 700;

var x{S, C} binary; #Variabile che indica che il file S è compresso ed è salvato su C
var y{S, C} binary; #indica che il file S non è compresso ed è salvato su C

s.t. assegnamento {s in S}:
	sum {c in C} y[s,c] + sum {c in C} x[s,c] = 1;
s.t. dimensioneMax {c in C}:
	sum {s in S} (x[s,c] * compressione[s] + y[s,c] * grandezza[s]) <= cMax;
minimize numero_compressi:
	sum {s in S, c in C} x[s,c];
data;
param nS := 8;
param nC := 3;
param: grandezza compressione :=
1 450 220
2 550 240
3 600 235
4 120 70
5 530 260
6 480 240
7 200 180
8 240 110
;

end;



