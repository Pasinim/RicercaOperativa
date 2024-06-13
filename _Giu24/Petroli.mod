set P; 
param prezzi{P};
set M;
param composizione{P, M}; #[%]
param d{M}; #Disponibilità materie prime [milioni barili/mese]
param c{P}; #Costi se la legge viene approvata [e/barile]
param prezzo{P}; #[e/barile]
var x{P} >= 0; #produzione [barili]
var y{M} >= 0; #Quantita di materie utilizate[barili]

s.t. utilizzoMP {m in M}:
	sum {p in P} x[p] * composizione[p,m] = y[m];
s.t. limiteMensile {m in M}:
	y[m] <= d[m];

#Senza leggi
#maximize profitto:
	#sum {p in P} x[p] * prezzo[p];
#Con leggi
maximize profitto_con_leggi:
	sum {p in P} (x[p] * prezzo[p] - c[p] * x[p]);

data;
set P:= A B C D;
set M := Alfa Beta Gamma;
param prezzo := 
A 28
B 25
C 23
D 21;

param composizione : 
Alfa Beta Gamma := 
A .30 .30 .40
B .30 .40 .30
C .35 .35 .30
D .40 .30 .30;

param d :=
Alfa 1800
Beta 1750
Gamma 2000;

param c := 
A	12
B	7
C	3
D	0;

end;
