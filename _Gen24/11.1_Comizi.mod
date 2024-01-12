#SI TRATTA DI UN PROBLEMA DI PROGRAMMAZIONE LINEARE BINARIA

#Massimizzare il numero di elettori
param nC := 25;
set C := 1..nC;
set T := 1..2; #Tipo di comizio
param timeC{T}; #Tempo impiegato per il comizio sintetico o quello analitico
param time := 16; #Tempo totale[min] -> 16h
param v := 100; #[km\h]
param tf := 0.5; #[h]
param dist{C}; #Distanza dalla citta A
param s{C}; #Audience per comizio sintetico
param a{C}; #Audience per comizio analitico;

var x{C, T} binary; #Tipo di comizio per ogni citt�
var timeComizi >= 0; #Variabile ausiliaria che indica il tempo speso solamente per i comizi
var timeViaggio >= 0;
var timeFisso >= 0;

#In ogni citt� ci pu� essere solamente un tipo di comizio
s.t. assegnamento {c in C}:
	sum {t in T} x[c,t] <= 1;
	
s.t. def_timeComizi:
	timeComizi = sum{c in C, t in T} x[c,t] * timeC[t];

s.t. def_timeViaggio {c in C}:
	timeViaggio * v  >= dist[c] * sum {t in T} x[c,t];

s.t. def_timeFisso:
	timeFisso = sum {c in C, t in T} x[c,t] * tf;

s.t. tempoLimite:
	timeComizi + timeViaggio + timeFisso <= time;

maximize z:
	sum {c in C, t in T} x[c,t] * s[t];

data;
param timeC :=
1 1
2 1.5;

param : dist  s 	a :=
1 0 120 140
2 12 80 200
3 25 60 100
4 31 400 450
5 46 200 250
6 60 10 30
7 72 500 550
8 89 90 110
9 110 50 80
10 127 300 330
11 142 10 50
12 160 60 90
13 166 230 280
14 170 190 240
15 180 100 150
16 193 100 110
17 211 100 180
18 218 200 300
19 230 80 180
20 244 10 20
21 263 80 150
22 280 90 100
23 285 120 130
24 292 500 650
25 298 400 490
;
end;

