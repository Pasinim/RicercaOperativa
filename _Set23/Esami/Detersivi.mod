param nS;
param nP;
set S := 1..nS;
set P := 1..nP;
param vMin{P, S};
param vMax{P,S};
param disp{S};
param prezzo{P};

var x{P} >= 0; #produzione per ogni prodotto
var y{ P, S} >= 0;

subj to prodotti {p in P}:
	x[p] = sum {s in S} y[p,s];


subj to valMin {s in S, p in P}:
	y[p,s] * 100  >= vMin[p,s] * x[p];
subj to valMax {s in S, p in P}:
	y[p,s] *100 <= vMax[p,s] * x[p];
subj to disponibilita {s in S}:
	sum {p in P} y[p,s] <= disp[s];

maximize z:
	sum {p in P} x[p] * prezzo[p];


data;
param nS := 3;
param nP := 3;

param vMin: 1	2	3 :=
1		    80	5	10
2			70	10	5
3			65  20	15;

param vMax: 1	2	3 :=
1			90	10	20
2			85	20	15
3			70	50	35;

param disp :=
   1          700
   2          150
   3          200;
   
param prezzo := 
   1        2.5
   2        2.0
   3        3.0
;

end;

