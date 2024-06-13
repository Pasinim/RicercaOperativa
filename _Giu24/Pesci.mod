param nP := 3;
set P := 1..nP;
param prezzi{P};
param v{P};
param t{P};
param limite{P};
param tTot := 45;
param vTot := 50000;

var x{P} >= 0;

s.t. volumeMax: sum {p in P} x[p] * v[p] <= vTot;
s.t. tempoMax: sum {p in P} x[p] * t[p] <= tTot;
#combinazione lineare delle massime quantità acquistabili
subject to Upper {p in P}:
	x[p]/limite[p] <= 1;
	
maximize profitto:
	sum {p in P} x[p] * prezzi[p];

data;
param prezzi :=
1     10.00
2 		7.50
3      9;

param v := 
1 10000
2 7500
3 12500;
param t :=
1		11
2 		8
3       10
;
param limite := 
1 40
2 60
3 60;

end;

