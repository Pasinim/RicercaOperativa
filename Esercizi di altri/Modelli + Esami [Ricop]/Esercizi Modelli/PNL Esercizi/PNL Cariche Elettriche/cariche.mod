#ESERCIZIO - PNL Cariche

#DATI
param n;
set C := 1..n;

#VARIABILI
# Posizione nello spazio a 3 dimensioni
var x {C};
var y {C};
var z {C};
# La distanza
var d {i in C, j in C} = sqrt( (x[i]-x[j])^2 + (y[i]-y[j])^2 + (z[i]-z[j])^2 );

#VINCOLI
subject to Normalizzazione {i in C}:
	x[i]^2 + y[i]^2 + z[i]^2 = 1; 

#OBIETTIVO
minimize EnergiaTotale: sum {i in C, j in C: i<j} 1/d[i,j];

################
data;
param n := 5;

#Inizializziamo le variabili
var:	x	y	z	:=
1		0	1	-1
2		1	0	0
3		1	1	0
4		-1	0	1
5		0	-1	1;

end;
