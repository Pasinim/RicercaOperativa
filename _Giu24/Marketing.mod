set P;
set M;
param disp{M};
param cu{M, P};
param nP{P}; #Numero di prezzi per quantita prodotta di prodotto
set K{p in P} := 1..nP[p];
param quantita{p in P, K[p]};
param prezzi{p in P, K[p]};
 
var x{p in P, K[p]} >= 0, integer; #Quantita venduta in ogni intervallo

s.t. quantitaVendibili{p in P, k in K[p]: k < nP[p]}:
	x[p,k] <= quantita[p,k+1] - quantita[p,k];
	
s.t. disponibilita {m in M}: 
	sum{p in P} cu[m,p] * (sum {k in K[p]} x[p,k])  <= disp[m];
maximize profitto:
	sum {p in P, k in K[p]} x[p,k] * prezzi[p,k];

data;

#Ottengo valori differenti rispetto alla soluzione ma non capisco che cosa ci sia di sbagliato
set P := P1 P2 P3;
set M := M1 M2  C1 C2;
param nP :=
P1	3
P2	3
P3	4
;

param quantita:=
[P1,1] 0
[P1,2] 200
[P1,3] 500
[P2,1] 0
[P2,2] 150
[P2,3] 600
[P3,1] 0
[P3,2] 50 
[P3,3] 150
[P3,4] 300
;


param prezzi:=
[P1,1] 1000
[P1,2] 900
[P1,3] 750
[P2,1] 800
[P2,2] 750
[P2,3] 500
[P3,1] 700
[P3,2] 650 
[P3,3] 600
[P3,4] 400
;

 param disp :=
	M1            37000
	M2            3200
   C1         40000
   C2         47000;
param cu :
		P1    P2    P3 :=
M1    18    12    12
M2    15    12    11
C1    18    18    13
C2    25    18    12;


 end;

