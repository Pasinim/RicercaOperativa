# ESERCIZIO Miscelazione

#DATI

set S;					# Insieme delle sostanze
set B;					# Insieme delle benzine
param lower {S,B};		# Percentuale minimina di sostanze in ogni tipo di benzina
param upper {S,B};		# Percentuale massima di sostanze in ogni tipo di benzina
param qS {S};			# Disponibilita giornaliera di ogni sostanza [barili]
param cS {S};			# Costo di acquisto di ogni sostanza [$/barile]
param rB {B};			# Ricavo da ogni barile di benzina [$/barile]

#VARIABILI

var x {S,B} >=0;		# Quantita totale di sostanza in ogni tipo di benzina [barili] (non la percentuale)
var y {B} >=0;			# Quantita totale prodotta di ogni tipo di benzina [barili] (non la percentuale)

#VINCOLI

#Vincolo sulla massima quantita di sostanze utilizzabili in ogni benzina
# somma su tutte le benzine di queste quantita <= quantita disponibile della sostanza (per ogni sostanza)
subject to quantita_massima_sostanza {i in S}:
	sum {j in B} x[i,j] <= qS[i];

#La quantita di benzina prodotta e' la somma su tutte le sostanze di queste quantita x {S,B}
subject to total_production {i in B}:
	sum {j in S} x[j,i] = y[i];

#Vincolo sul limite inferiore nella composizione delle benzine
subject to lower_bound {i in S, j in B}:
	x[i,j] >= y[j] * lower[i,j];

#Vincolo sul limite superiore nella composizione delle benzine
subject to upper_bound {i in S, j in B}:
	x[i,j] <= y[j] * upper[i,j];

#OBIETTIVO
#Massimizzazione dei profitti, ossia la differenza tra il totale dei ricavo e il totale dei costo
maximize z: sum {i in S, j in B} x[i,j] * (rB[j] - cS[i]);

########################
data;

set S := A  B  C  D;
set B := Super Normale Verde;

param lower:	Super	Normale	Verde :=
A				0.0		0.0		0.0
B				0.4		0.1		0.0
C				0.0		0.0		0.0
D				0.0		0.0		0.0;

param upper:	Super	Normale	Verde :=
A				0.3		0.5		0.7
B				1.0		1.0		1.0
C				0.5		1.0		1.0
D				1.0		1.0		1.0;

param qS :=
A		3000
B		2000
C		4000
D		1000;

param cS :=
A		3
B		6
C		4
D		5;

param rB :=
Super		5.5
Normale		4.5
Verde		3.5;

end;
