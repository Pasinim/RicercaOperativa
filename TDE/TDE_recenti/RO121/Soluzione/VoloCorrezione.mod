param nC := 2; #Numero confini
set R := 0..nC;  #Insieme delle regioni da sorvolare
set C := 1..nC; #Insieme dei confini
param xP; #Ascissa di partenza
param yP; #Ordinata di partenza
param xA; #Ascissa di arrivo
param yA; #Ordinata di arrivo
param nS{C}; #Segmenti per ogni confine
set P {c in C} := 0..nS[c];	# Insieme dei punti per ogni confine
param prezzo{R};
param xx{c in C, P[c]}; #Ascissa punti di discontinuita
param yy{c in C, P[c]}; #Ordinata punti di discontinuita
###Variabile

var x{C};
var y{C};
var lambda{C} >=0, <= 1;
var w{c in C, P[c]} binary;
var d{R} >= 0; #Distanza percorsa sopra ogni stato

 # Per vincolare un punto (xc, yc) ad appartenere ad un
# segmento di estremi (xcp-1, ycp-1) e (xcp, ycp), un modo semplice è quello di imporre che le coordinate del punto siano
# una combinazione convessa delle coordinate degli estremi
s.t. Ascissa {c in C}:
	x[c] = lambda[c] * sum{p in P[c]: p > 0} w[c,p] * xx[c,p-1] + (1-lambda[c]) * sum{p in P[c]: p > 0} w[c,p] * xx[c,p];

s.t. Ordinata{c in C}:
	y[c] = lambda[c] * sum{p in P[c]: p > 0} w[c,p] * yy[c, p-1] + (1-lambda[c]) * sum{p in P[c]: p>0} w[c,p] * yy[c,p];
	
	
#Un segmento attraversato per ongi confine
s.t. attraversamento {c in C}: 
	sum {p in P[c]: p >0} w[c,p] = 1;
s.t. distanza0:
	d[0]^2 = (xP-x[1])^2 + (yP - y[1])^2;
s.t. distanzaN:
	d[nC]^2 = (xA-x[nC])^2 + (yA - y[nC])^2;
	
minimize z: 
	sum {r in R} prezzo[r] * d[r]; 
data;
param prezzo :=
0	1.5
1	0.8
2	1.4;

param nS := 
1	1
2	1;

param xx:= 
[1,0]  1
[1,1]  22
[2,0] 10
[2,1] 30;

param yy:=
[1,0] 9 #Confine 1, xuntodiDiscontinuita y[0]
[1,1] 24
[2,0]  0
[2,1] 20;

param xP := 5;
param yP := 20;
param xA := 25;
param yA := 8;


end;
