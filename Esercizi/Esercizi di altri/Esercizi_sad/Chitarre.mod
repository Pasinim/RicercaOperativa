# Esercizio Chitarre

# DATI

param nC;			# Numero delle chitarre
set C := 1..nC;		# Insieme delle chitarre
param rC{C};		# Ricavo per unità di produzione di chitarre [€/unità]
param nR;			# Numero dei reparti
set R := 1..nR;		# Insieme dei reparti
param aR{R};		# Numero addetti per reparto
param nP;			# Numero parti delle chitarre
set P := 1..nP;		# Insieme delle parti
param tP{P,C};		# Tempi necessari alla lavorazione per ogni stadio [h/unità]
param qmin;			

# VARIABILI

var cP{C} >= 0;		# Numero di chitarre prodotte settimanalmente per tipo
var nA >= 0;

# VINCOLI

s.t. chitarreProdotte:
	sum{i in C} cP[i] >= qmin;

s.t. tempoUsato1:
	sum{i in C} cP[i]*(tP[1,i]) <= aR[1]*8*5 ;

s.t. tempoUsato2:
	sum{i in C} cP[i]*(tP[2,i]+tP[3,i]) <= (aR[2]+nA)*8*5 ;

s.t. tempoUsato3:
	sum{i in C} cP[i]*(tP[4,i]) <= aR[3]*8*5 ;


# OBIETTIVO

maximize z : sum{i in C} cP[i]*rC[i] - nA*600;

##################

data;

param nC := 3;
param nR := 3;
param nP := 4;
param qmin := 100;

param tP : 1    2    3 :=
1	   2    4    1
2	   1    2.5  0.5
3      1    1.5  1
4      4    1    1;

param rC :=
1	350
2	160
3	100;

param aR :=
1	10
2	5
3	3;


end;
