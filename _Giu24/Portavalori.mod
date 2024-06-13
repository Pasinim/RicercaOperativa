param nF := 3;
set F := 1..nF;
set G := 1..nF; #Insieme delle guardie
param cap{F};
param costo{F};
param v{G};
param stip{G};
param tf := 2.5;
param q := 3500; #kg valori da trasportare

var x{G} binary;
var y{F} binary;

#Una persona può essere assegnata solamente ad un furgone
s.t. assegnamento {g in G}:
	sum {f in F} x[f,g] >= 1;
s.t. assegnamentoFurgni {f in F}:
	sum {g in G} x[f,g] >= 1;
s.t. spostaTutto{g in G}:
	sum{f in F} cap[f] * x[f,g] >= q;
minimize spesa:
	sum {f in F, g in G} x[f,g] * (costo[f] + stip[g]) * 2.5;


data;
param: cap  costo :=
1 1000 19.00
2 1500 22.00
3 4000 27.00;

param: v stip := 
1 600 18.00
2 700 19.50
3 500 17.00
;
end;

