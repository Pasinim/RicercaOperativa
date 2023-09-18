param nP := 3;
set P := 0..nP-1;
param prof_USA{P};
param prof_ASIA{P};
param investimentoMin := 100;
param investimentoMax := 800;

var budget{P} >= 0;
var profittoUSA >= 0;
var profittoASIA >= 0;

subj to minimo:
	sum {p in P} budget[p] >= investimentoMin;
subj to massimo:
	sum {p in P} budget[p] <= investimentoMax;
subj to def_USA:
	sum {p in P} budget[p] * prof_USA[p]/1000 = profittoUSA;
subj to def_ASIA:
	sum {p in P} budget[p] * prof_ASIA[p] / 1000= profittoASIA;
subj to investimentiDivisi{ i in P}:
	budget[i] <= budget[(i+1) mod 3] + budget[(i+2) mod 3];
	
maximize z:
	profittoASIA + profittoUSA;
data;
param: prof_USA prof_ASIA:=
0 10 20
1 15 16
2 18 8
;

end;

