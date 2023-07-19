# ESERCIZIO 56 - PNL Location

#DATI
param nP;					# Numero punti
set P := 1..nP;				# Insieme punti
param nF;					# Numero facilities
set F := 1..nF;				# Insieme facilities
param x {P};				# Coordinate x dei punti
param y {P};				# Coordinate y dei punti
param domanda {P};			# Domanda dei punti
param costo {F};			# Costi delle facilities
param capac {F};			# Capacita delle facilites

#VARIABILI
#Localizzazion facilities
var xx {F};
var yy {F};
#Assegnamento
var w {P,F} binary;
#Uso delle facilities
var u {F} binary;
#Distanze tra punti e facilities
var d {P,F} >= 0;

#VINCOLI
subject to Def_dist {i in P, j in F}:
	d[i,j]^2 = (x[i]-xx[j])^2 + (y[i]-yy[j])^2;

subject to Capacity {j in F}:
	sum {i in P} domanda[i] * w[i,j] <= capac[j] * u[j];

#OBIETTIVO
minimize z: sum {j in F} costo[j] * u[j] +
			sum {i in P, j in F} d[i,j] * w[i,j];

###################
data;

param nP :=10;
param nF := 4;

param:	  x		  y		domanda :=
1		-20		 45		30
2		-30		 56		35
3		-10		-29		40
4		  0		-18		15
5		 40		  3		20
6		 30		 40		20
7		 15		 12		25
8		 18		 -6		40
9	 	 23		 24		10
10		 -2		-30		25;

param:		costo		capac	:=
1			 130		800
2			  80		500
3			 100		750
4			  60		400;

#Inizializzion variabili
var:		  xx		  yy	:=
1			-100		-100
2			-100		 100
3			 100		-100
4			 100		 100;

end;
