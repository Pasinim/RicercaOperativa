# ESERCIZIO PL Mix Produttivo ottimale

# DATI
param nR;				# Numero dei reparti produttivi
param nP;				# Numero dei prodotti
set R := 1..nR;			# Insieme dei reparti produttivi
set P := 1..nP;			# Insieme dei prodotti
param b {R};			# Risorse disponibili per ogni reparto [oreUomo/settimana]
param c {P};			# Profitti unitari per ogni prodotto [€/unità]
param a {R,P};			# Tempi di lavorazione [oreUomo/unità]

# VARIABILI
# Decidere quanti veicoli produrre di ogni tipo ogni settimana
var x {P} >=0;			# Produzione [unità/settimana]

# VINCOLI
# Vincolo sul massimo consumo di risorsa in ogni reparto [oreUomo/settimana]
subject to Consumi {i in R}:
	sum {j in P} a[i,j] * x[j] <= b[i];

# OBIETTIVO
# Massimizzazione dei profitti complessivi [€/settimana]
maximize z: sum {j in P} c[j] * x[j];

#####################
data;

param nR := 5;
param nP := 3;

param b := 
1		120
2		 80
3		 96
4		102
5		 40;

param c :=
1		 840
2		1120
3		1200;

param a:	1	2	3 :=
1			3	2	1
2			1	2	3
3			2	0	0
4			0	3	0
5			0	0	2;

end;
