param nM := 7;
set M := 1..nM;
param periodoOttimo{M}; 
param costoOttimo{M}; #[kE/settimana]

var formula >= 0;
var c{M} >= 0;
var t{M} >= 0;

s.t. def_formula {i in M}:
	c[i]/costoOttimo[i] = 0.5 * (t[i]/periodoOttimo[i] + periodoOttimo[i]/t[i]);

data;
param periodoOttimo :=
1 17
2 10
3 19
4 12
5 5
6 12.5
7 24
;
param costoOttimo :=
1 140
2 65
3 200
4 115
5 75
6 145
7 100
;
end;

