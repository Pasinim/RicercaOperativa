param nP; #Numero di parametri
set P := 1..nP;
set F;
param vMin{P}; #Soglia minima
param vMax{P}; #Soglia massima
param vRif{P}; #Valore di riferimento
param vAttuale{P}; #Valore attuale
param variazione{P, F}; #Variazione parametri /mg
param fMax{F}; #Massima quantita di farmaci somminsitrabili [mg]

var q{F} >= 0; #Quantita di farmaci da assumere [mg]
var parametri{P};
var z;
s.t. parametriMin {p in P}: parametri[p] >= vMin[p];
s.t. parametriMax {p in P}: parametri[p] <= vMax[p];
s.t. farmaciMax {f in F}: q[f] <= fMax[f];
s.t. def_parametri {p in P, f in F}: parametri[p] = vAttuale[p] * variazione[p,f] * q[f];

s.t.  Vincolo1 {p in P}: z * (vMax[p] - vRif[p]) >= (parametri[p] - vRif[p]);
s.t. Vincolo2 {p in P}: z * (vRif[p] - vMin[p]) <= (vRif[p] - parametri[p]);
maximize z1: z;

data;
set F := A B C D E;
param nP := 7;
param: vAttuale vMin vRif vMax :=
1 3.45 7.0 12.0 15.0
2 1800 1700 2500 3500
3 0.05 0.50 0.80 1.30
4 3200 1400 2000 2750
5 26.4 8.0 10.0 12.0
6 35 28 35 41
7 136 80 120 160
;
param variazione : 
	A	B	C	D	E :=
1 -0.2  0.5 0.7 0.1 0.2
2 -500  0   -250 50 0
3 0.2 -0.1  0.3 0 0.2
4 -80 -120 15 -90 -100
5 -8.5 -7 -1   -3   1
6  5 	-2 8   -4   0
7 -5   -1 -2   -3   4
;
param fMax :=
A 2.0
B 3.5
C 0.5
D 0.5
E 7.5
;
end;

