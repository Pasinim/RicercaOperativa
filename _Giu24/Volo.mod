reset;
param n := 2;
set C := 1..n;
set R := 0..n; #Insieme degli stati
param cu{R}; #Costo unitario
param nS{C}; #Numero di segmenti per ogni confine 

param xp; #Coordinate aeroporto partenza
param yp;
param xa; #Coordinate aeroporto arrivo
param ya;
set P{c in C} := 0..nS[c];
param xx{c in C, P[c]};
param yy{c in C, P[c]};

#Coordinate in cui il confine viene attraversato
var x{c in C};
var y{c in C};
var w{c in C, P[c]} binary;
var d{R}; #Distanza percorsa per attraversare la regione R
var lambda{C} >= 0, <=1;

s.t. combConvX{c in C}:
	x[c] = lambda[c] * sum {p in P[c]: p>0} (w[c,p] * xx[c,p-1]) + (1-lambda[c]) * sum{p in P[c]: p>0} (w[c,p] * xx[c,p]);
s.t. combConvY{c in C}:
	y[c] = lambda[c] * sum {p in P[c]: p>0} (w[c,p] * yy[c,p-1]) + (1-lambda[c]) * sum{p in P[c]: p>0} (w[c,p] * yy[c,p]);
s.t. attraversamento {c in C}:
	sum{p in P[c]} w[c,p] = 1;
	
s.t. distanzaP:
	d[0]^2 = (xp - x[1])^2 + (yp - y[1])^2;
s.t. distanzaA:
	d[n]^2 = (xa - x[n])^2 + (ya - y[n])^2;
s.t. distanza {r in R: r>0 and r<n}:
	d[r]^2 = ((x[r] - x[r+1])^2 + (y[r]-y[r+1])^2);
	


minimize z:
	sum {r in R} cu[r] * d[r];


data;
param nS:=
1	2
2	2;

param xp := 5;
param yp := 20;
param xa := 25;
param ya := 8;

param cu :=
	   1		1.5
	   2		0.8
	   3		1.4;

param xx:=
[1,0]	1 
[1,1]	22
[2,0]	10
[2,1]	30
;

param yy:=
[1,0]	9 
[1,1]	24
[2,0]	0
[2,1]	20
;
solve;
end;

