set P := 1..4;
set C := 1..5;
param dist{C,P}; #lunghezza del ponte tra le coppie

var y{P} binary; #Indica se il ponte p viene costruito
var x{C, P} binary; #Var. Ass. Indica se viene costruito un ponte tra la coppie
var distanzaTotale >= 0; 
var distanzaMedia >= 0;

#Ogni coppia deve essere collegata da almeno un ponte
s.t. pontePerCoppia {c in C}:
	sum {p in P} x[c,p] >= 1;
s.t. def_distanzaMedia {c in C}: sum {p in P} dist[c,p] * y[c,p] = distanzaMedia
	
s.t. def_distanzaPercorsa: sum {p in P, c in C} y[c,p] * dist[c,p] = distanzaTotale;
s.t. disponibilita_ponti:
	sum{p in P} y[p] = 2;
minimize z: distanzaTotale;

data;
param dist : 1 2 3 4 :=
1 12 14 20 24
2 9 17 23 27
3 18 10 12 16
4 25 15 15 15
5 26 16 10 10
;

end;
