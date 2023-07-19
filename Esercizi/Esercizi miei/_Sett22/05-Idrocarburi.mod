#Dati
set sostanza;
set benzina;
param uB {sostanza, benzina}; #[%]
param lB {sostanza, benzina}; #[%]
param risorse {sostanza}; #[barile/gg]
param profitto {benzina}; #[$/barile]
param costo {sostanza}; #[$/barile]

#Variabili
var x {sostanza, benzina}; #barili di sostanza utilizzata per ogni barile di benzina [barile]
#è necessario definire una variabile che permetta di calcolare le percentuali
var tB {benzina}; #quantità totale di benzina prodotta [barile/gg]
var tS {sostanza}; #q. totale di sostanza acquistata [barile/gg]

#Vincoli
#sostanze totali consumate:
subject to tot_s {s in sostanza}:
	sum {b in benzina} x[s,b] = tS[s];

subject to tot_b {b in benzina}:
	sum {s in sostanza} x[s,b] = tB[b];

#Limite risorse disponibili:
subject to disponibilita {s in sostanza}:
	tS[s] <= risorse[s];

subject to lower {s in sostanza, b in benzina}:
	x[s,b] >= lB[s,b] * tB[b];

subject to upper {s in sostanza, b in benzina}:
	x[s,b] <= uB[s,b] * tB[b];
	

#Ob: Massimizzare il profitto
#maximize c {b in benzina, s in sostanza}: #### SBAGLIATO
#	x[s, b] * (profitto[b] - costo[s]);	####

maximize c:
	sum {b in benzina} tB[b] * profitto[b] -
	sum {s in sostanza} tS[s] * costo[s];

data;
set sostanza := A B C D;
set benzina := S N V;

param costo :=
A	3	
B	6
C	4
D	5
;

param profitto :=
S	5.5
N	4.5
V	3.5
;

param risorse :=
A	3000
B	2000
C	4000
D	1000
;

param uB : 
	S 	N	V	:=
A	.3	.5	.7
B	1	1	1
C	.5	1	1
D	1	1	1
;

param lB : 
	S 	N	V	:=
A	0	0	0
B	.4	.1	0
C	0	0	0
D	0	0	0
;

end;
