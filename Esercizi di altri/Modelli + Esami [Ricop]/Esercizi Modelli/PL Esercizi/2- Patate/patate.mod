# ESERCIZIO PL Patate

#DATI
param nF;				# Numero di fornitori
param nP;				# Numero di prodotti
set F := 1..nF;			# Insieme dei fornitori
set P := 1..nP;			# Insieme dei prodotti
param a {F,P};			# Resa percentuale [%]
param c {F};			# Profitti unitari [euro/kg]
param b {P};			# Quantita massime di ciascun prodotto [kg]

#VARIABILI
var x {F} >=0;			# Quantita acquistate da ciascun fornitore [kg]

#VINCOLI
#Vincoli sulla massima produzione di ogni tipo di prodotto [kg]
subject to Max_prod {j in P}:
	sum {i in F} x[i] * a[i,j] <= b[j];

#OBIETTIVO
#Massimizzare i profitti complessivi [euro]
maximize z: sum {i in F} c[i] * x[i];

###########################
data;

param nF := 2;
param nP := 3;

param a: 1		2		3	 :=
1		.20		.20		.30
2		.30		.10		.30;

param c :=
1		0.02
2		0.03;

param b :=
1		6000
2		4000
3		8000;

end;
