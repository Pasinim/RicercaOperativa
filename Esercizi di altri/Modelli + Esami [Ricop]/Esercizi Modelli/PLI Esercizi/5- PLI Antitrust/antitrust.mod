# ESERCIZIO PLI Antitrust

#DATI
param nF;					# Numero di filiali
param nP;					# Numero di prodotti
set F := 1..nF;				# Insieme dei filiali
set P := 1..nP;				# Insieme dei prodotti
param a {F, P};				# Fatturato di ogni filiale per ogni prodotto

#VARIABILI
# Il problema consiste nel decidere a quale azienda-figlia deve essere assegnata ogni filiale
var x {F} binary;			# vale 0 se il filiale F viene assegnato ad AF1, vale 1 se viene assegnato ad AF2
var y {P} >=0;				# fatturato dell'azienda AF1 per ogni prodotto
var yy {P} >=0;				# fatturato dell'azienda AF2 per ogni prodotto
var alfa >= 0;

#VINCOLI
# Fatturato dell'azienda figlia 1 (x[i] dell'azienda AF1 vale 0)
subject to FatturatoAF1 {j in P}:
		y[j] = sum {i in F} a[i,j] * (1 - x[i]);

# Fatturato dell'azienda figlia 2 (x[i] dell'azienda AF2 vale 1)
subject to FatturatoAF2 {j in P}:
		yy[j] = sum {i in F} a[i,j] * x[i];


#OBIETTIVO
#Abbiamo una funzione min-max e valore assoluto, dobbiamo linearizzare
minimize z: alfa;
subject to Vincolo_1 {j in P}: alfa >= y[j] - yy[j];
subject to Vincolo_2 {j in P}: alfa >= yy[j] - y[j];


##################
data;
param nF := 7;
param nP := 3;

param a: 1		 2		3 :=
1		83		14		42
2		38		63		56
3		28		24		12
4		59		 7		53
5		25		35		83
6		52		86		85
7		59		64		25;

end;
