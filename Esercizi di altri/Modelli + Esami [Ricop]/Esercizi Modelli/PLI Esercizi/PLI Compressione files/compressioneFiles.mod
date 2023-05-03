#ESERCIZIO 49 - PLI Compressione files

#DATI

param nF;						# Numero di files
set F := 1..nF;					# Insieme dei files
param nC;						# Numero di CD disponibili
set C := 1..nC;					# Insieme dei CD
param dNormale {F};				# Dimensione normale dei files
param dCompressa {F};			# Dimensione compressa dei files
param q;						# La capacita di ogni CD [megabytes]

#VARIABILI

var x {F,C} binary;				# Assegno il file F al cd C in modalita normale
var y {F,C} binary;				# Assegno il file F al cd C in modalita compressa

#VINCOLI

#Vincoli di capacita'
subject to Capacity {c in C}:
	sum {f in F} (dNormale[f] * x[f,c] + dCompressa[f] * y[f,c]) <= q;

#Vincoli di incompatibilita'
#Tutti i file devono essere assegnati, o in modalita normale, o in modalita compressa, ovviamente non tutte due
subject to Assignment {f in F}:
	sum {c in C} (x[f,c] + y[f,c]) = 1;

#OBIETTIVO
# Minimizzare il numero di assegnamento di tipo "Compressa"
minimize z : sum {f in F, c in C} y[f,c];

#######################
data;

param nF := 8;
param nC := 3;

param:		dNormale	dCompressa :=
1			 450			220
2			 550			240
3			 600			235
4			 120			 70
5			 530			260
6			 480			240
7			 200			180
8			 240			110;

param q:= 700;


end;
