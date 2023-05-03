# Esercizio n.10: Mars Express

# Dati

param nM;					# Nr. dispositivi
set M := 1..nM;				# Dispositivi
param nO;					# Nr. di orbite
set O := 1..nO;				# Orbite
param OM {O,M};				# Dati previsti in ingresso [Mbit]
param D {O};				# Durata orbite [min]
param v;					# Velocità di trasmissione [Mbit/min]
param storage {M};			# Capacità inziale dispositivi [Mbit]
param init {M};				#  Contenuto iniziale dispositivi [Mbit]

# Variabili

var x {O,M} >= 0;			# Quantità da scaricare per ogni orbita [Mbit]
var y {O,M} >= 0;			# Dati rimasti nel dispositivo dopo il trasferimento [Mbit]
var z {O,M} >= 0;			# Dati presenti dopo input [Mbit]
var maxData >= 0;			# Percentuale massima di riempiento dei dispositivi

# Vincoli

#Maxdata
subj to MaxData {o in O, m in M}:
	z[o,m]/storage[m] <= maxData;
# Calcolo dati rimasti dopo trasfermiento alla prima orbita
subj to PrimaOrbita {m in M}:
	y[1,m] = init[m] - x[1,m];
# Calcolo dati dopo input
subj to CalcDopoIn {o in O, m in M}:
	z[o,m] = y[o,m] + OM[o,m];
# Calcolo dati rimasti dopo trasfermiento
subj to CalcDopoTrasf {o in O, m in M: o>1}:
	y[o,m] = z[o-1,m] - x[o,m];
# Max dati trasferibili in base a velocità
subj to CalcoloVel {o in O}:
	sum {m in M} x[o,m] <= v*D[o];

# Obiettivo

minimize Riempimento: maxData;

###################

data;

param nM := 5;
param nO := 10;
param OM :
		1	2	3	4	5 :=
	1	35	0	80	25	50	
	2	200	70	100	25	0	
	3	0	150	0	25	100	
	4	600	300	0	25	75	
	5	200	0	210	25	200	
	6	50	0	85	0	45	
	7	40	60	50	0	300	
	8	300	90	20	60	0	
	9	0	100	100	60	20	
	10	0	20	100	60	250;
param D :=
	1	45
	2	47
	3	55
	4	45
	5	35
	6	42
	7	30
	8	35
	9	44
	10	40;
param v := 9;
param:	 storage	   init:=
	1		1000		500
	2		1200		600
	3		1000		500
	4		 500		250
	5		 700		350;

end;
