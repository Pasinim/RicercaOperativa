set V;
param resa{V};
param prezzo{V};
param qMin{V};
param qMax{V};
param area{V};

var x{V} >= 0; #Produzione [litro]
var y{V} >= 0; #Ettari di campo per ogni vino
s.t. def_x{v in V}: x[v] = y[v] * resa[v] * 10000 ; #1 ettaro = 10000 mq
s.t. minimo {v in V}: x[v] >= qMin[v];
s.t. massimo {v in V}: x[v] <= qMax[v];
s.t. areaMassima: sum{v in V} y[v] <= sum {v in V} area[v];
s.t. limiteVitigno{v in V, w in V: v<>w}:
	y[v] <= 3*y[w];
s.t. limiteVino{v in V, w in V: v<>w}:
	x[v] <= 4*x	[w];

maximize z: sum {v in V} x[v]*prezzo[v];
data;
set V :=  Silvaner Riesling Pinot Mueller Merlot;
param:		  resa	prezzo	qMin	qMax	area := 
Silvaner      1.2	4.5		150000	1500000  95
Riesling      0.9	5		200000	1200000	125
Pinot         1.0	4		100000	950000	95
Mueller       0.8	3		150000	800000	100
Merlot        1.4	3.5		100000	1500000	85
;
end;
