# Esercizio 5: Miscelazione di idrocarburi

# Dati

set S;					# Sostanze
set G;					# Benzine
param lower {S,G};		# Limiti inferiori per ottenere benzine [%]
param upper {S,G};		# Limiti superiori per ottenere benzine [%]
param disp {S};			# Disponibilità delle sostanze [barile]
param costi {S};		# Costi delle sostanze [$/barile]
param ricavi {G};		# Ricavi delle benzine [$]

# Variabili

var x {S} >= 0;			# Quantità di sostanze acquistata al giorno [barile]
var y {S,G} >= 0;		# Quantità sostanze per ogni benzina [barile]
var z {G} >= 0;			# Quantità di benzine prodotte [barile]

# Vincoli

# Limite risorse disponibili
subject to LimitiSostanze {s in S}:
	x[s] <= disp[s];

# Limiti inferiori per benzine
subject to LimitiInferiori {s in S, g in G}:
	y[s,g] >= lower[s,g]*z[g];
# Limiti superiori per benzine
subject to LimitiSuperiori {s in S, g in G}:
	y[s,g] <= upper[s,g]*z[g];
# 
subject to SostanzeBenzine {s in S}:
	sum {g in G} y[s,g] = x[s];
#
subject to BenzineSostanze {g in G}:
	sum {s in S} y[s,g] = z[g];

# Obiettivo
maximize Z:
	sum {g in G} z[g]*ricavi[g] -
	sum {s in S} x[s]*costi[s];

##################################
data;

set S := A, B, C, D;
set G := super, normale, verde;
param lower :
		super	normale		verde :=
	A	0		0			0
	B	0.4		0.1			0
	C	0		0			0
	D	0		0			0;
param upper :
		super	normale		verde :=
	A	0.3		0.5			0.7
	B	1		1			1
	C	0.5		1			1
	D	1		1			1;
param disp :=
	A	3000
	B	2000
	C	4000
	D	1000;
param costi :=
	A	3
	B	6
	C	4
	D	5;
param ricavi :=
	super		5.5
	normale		4.5
	verde		3.5;

end;
