param nL := 2; #Lotti di terreno
set L := 1..nL;
param nC := 6;
set C := 1..nC;
param a{L, C}; #Area necessaria 
param acq{C}; #Acqua necessaria
param prof{C}; #Profitto [e/q]
param acqTot := 400000; #[m3]
param areaTot{L};

var x{L, C} >= 0; #Area occupata da ogni cereale su ogni terreno
s.t. areaDisponibile {l in L}:
	sum {c in C} x[l,c] * a[l,c] <= areaTot[l];
s.t. acquaDisponibile:
	sum {c in C, l in L} x[l,c] * acq[c] <= acqTot;
maximize profitto:
	sum {c in C, l in L} x[l,c] * prof[c];

data;
param areaTot :=
1 200
2 400;
param prof :=
1   48
2   62
3   28
4   36
5   122
6   94
;

param a: 1 2 3 4 5 6 :=
1 0.02 0.03 0.02 0.016 0.05 0.04
2 0.02 0.034 0.024 0.02 0.06 0.034;

param acq := 
1   120
2   160
3   100
4   140
5   215
6   180
;
end;

