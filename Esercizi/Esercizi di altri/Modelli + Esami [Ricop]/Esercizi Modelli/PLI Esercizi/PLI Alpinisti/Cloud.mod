
param nU := 4;
set U := 1..nU; #Insieme del tipo di utilizzo
param cf{U}; #Costi di utilizzp [e/anno]
param co{U}; #Costi variabili 

var costo ;
var q ; #domanda

param epsilon; #Variabile su cui fare l'analisi parametrica

s.t. linearizzazione {u in U}:
	costo <= q * cf[u] + co[u];
maximize z: costo;
subject to Parametric: q <= epsilon;

data;
param epsilon := 1561;
param: cf co :=
1	1560 .128
2	1280 .192
3	552	 .312
4	0	.64;

end;

