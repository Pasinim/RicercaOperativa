reset; 
set M;
set D;
param n{M}; #Numero di copie per magazzino
param d{D}; #Domanda per ogni distributore
param c{M, D}; #capacita per il trasporto da M a D
param costoA{M, D}; #Costo di trasporto [e/lbro]
param costoB{M, D}; #Costo di trasporto [e/lbro]

var x{M, D} >= 0; #Quantita di libri spostati da M e A
var ordiniTot >= 0;
s.t. def_ordiniTot:
	sum {m in M, i in D} x[m,i] = ordiniTot;
s.t. richieste {i in D}:
	sum {m in M} x[m,i] >= d[i];
s.t. copieDisponibili{m in M}:
	sum {i in D} x[m,i] <= n[m];
s.t. capacita{i in D, m in M}:
	x[m,i] <= c[m,i];

var C{M,D} >= 0;
s.t. def_C {m in M, i in D}:
	C[m,i] = (costoB[m,i] / (1 - (x[m,i]/c[m,i])));

#maximize ordini: ordiniTot;

#minimize cA:
#	sum {m in M, i in D} costoA[m,i] * x[m,i];

minimize cB:
	sum {m in M, i in D} C[m,i];
	
#Massimizzare il numero di ordini
#Minimizzare il costo complessivo
data;
set M := TO NA PA;
set D := MI BO RM BA;

param n :=
TO 1200
NA 1400
PA 800;
param d :=
MI 1000
BO 1200
RM 700
BA 500;

param c: MI BO RM BA :=
TO 500 1000 1000 1000
NA 500 800 800 800
PA 800 600 600 600;


param costoA: MI BO RM BA :=
TO 7.5 2.6 1.7 1.6
NA 6.4 2.2 2 1.5
PA 5.8 2.4 1.8 1.4
;

param costoB: MI BO RM BA :=
TO 3.9 1.4 1.1 1.4
NA 2.7 0.9 1.2 0.9
PA 2.4 1.4 1.7 1.3;
solve;

end;
