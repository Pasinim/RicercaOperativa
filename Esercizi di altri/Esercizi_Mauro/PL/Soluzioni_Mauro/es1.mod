# Esercizio 1: Il mix produttivo ottimale

# DATI

param p;			# nr prodotti
param r;			# nr reparti
set P := 1..p;		# prodotti
set R := 1..r;		# reparti
param profitti {P};	# profitti x prodotti [€]
param capacita {R};	# capacità x reparto [h]
param tempi {R,P};	# tempi lavorazione [h]

# VARIABILI

var x {P} >= 0;			# numero veicoli da produrre

# VINCOLI

subj to Tempi_massimi {i in R}:
	sum {j in P} x[j]*tempi[i,j] <= capacita[i];

#OBIETTIVO

maximize z: sum {i in P} 
	x[i]*profitti[i];

####################

data;

param p := 3;
param r := 5;
param profitti :=
	1	840
	2	1120
	3	1200;
param capacita :=
	1 120
	2  80
	3  96
	4 102
	5  40;
param tempi :
		1	2	3:=
	1	3	2	1
	2	1	2	3
	3	2	0	0
	4	0	3	0
	5	0	0	2;

end;
