param nP := 15; #numero pti raccolta
set P := 1..nP;
param lato:=100; #km
param nS := 5;
set S := 1..nS;
param xS{S};
param yS{S};
param cap{S}; #Capacita di ogni segheria [q/gg]
param costo{S};
param xP{P};
param yP{P};
param q{P};
param costoTrasporto := 10; #[kLire/km]

var dist{S, P} >= 0; #distanza da ogni segheria al pto di raccolta
var x{S, P} binary; #Quantita che viene trasportata dalla segheria S a P
var y{S} binary; #var ass vale 1 sse esiste una segheria nel pto P
s.t. def_dist {s in S, p in P}: 
	dist[s,p] = sqrt((xP[p]-xS[s] * 100)^2 + (yP[p] - yS[s] * 100)^2); 

s.t. capacita{s in S}:
	sum {p in P} x[s,p] * q[p] <= cap[s] * y[s]; 
#questo funziona se x è una variabile binaria
s.t. ass{p in P}:
	sum {s in S} x[s,p] >= 1;

#Minimizzare costi trasporto + costi manutenzione
minimize z:
	sum {s in S} y[s] * costo[s] + sum {s in S, p in P} dist[s,p] * x[s,p];


data;
param: xP yP q :=
1 0.40 0.66 58
2 0.76 0.17 35
3 0.11 0.47 27
4 0.65 0.58 42
5 0.18 0.88 60
6 0.19 0.02 31
7 0.62 0.62 18
8 0.90 0.17 24
9 0.66 0.95 36
10 0.42 1.00 37
11 0.95 0.12 48
12 0.16 0.26 39
13 0.07 0.71 53
14 0.75 0.43 61
15 0.30 0.76 29
;

param: xS yS costo cap :=
1 0.25 0.20 3 190
2 0.55 0.25 4.5 240
3 0.90 0.15 3 200
4 0.15 0.45 4.4 220
5 0.85 0.55 4.6 190
;

end;


