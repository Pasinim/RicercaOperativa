# ESERCIZIO PLI Antitrust v2

#DATI
param nF;					# Numero di filiali
param nP;					# Numero di prodotti
set F := 1..nF;				# Insieme dei filiali
set P := 1..nP;				# Insieme dei prodotti
param a {F, P};				# Fatturato di ogni filiale per ogni prodotto

#VARIABILI
# Il problema consiste nel decidere a quale azienda-figlia deve essere assegnata ogni filiale
var x {F} binary;			# vale 0 se il filiale F viene assegnato ad AF1, vale 1 se viene assegnato ad AF2
var y >=0;					# Fatturato complessivo dell'azienda AF1 
var yy >=0;					# Fatturato complessivo dell'azienda AF2
var alfa >= 0;

#VINCOLI
# Fatturato complessivo dell'azienda figlia 1 (x[i] dell'azienda AF1 vale 0)
subject to FatturatoAF1:
		y = sum {i in F, j in P} a[i,j] * (1 - x[i]);

# Fatturato complessivo dell'azienda figlia 2 (x[i] dell'azienda AF2 vale 1)
subject to FatturatoAF2:
		yy = sum {i in F, j in P} a[i,j] * x[i];

#OBIETTIVO
#Abbiamo una funzione min-max e valore assoluto, dobbiamo linearizzare
#Si vuole minimizzare la differenza di fatturato ocmplessivo tra le 2 aziende-figlie
minimize z: alfa;
subject to Vincolo_1 {j in P}: alfa >= y - yy;
subject to Vincolo_2 {j in P}: alfa >= yy - y;


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
