# Esercizio Miscelazione di idrocarburi

# DATI
set Benzine;
set Sostanze;
param b {Sostanze};   # Max quantità giornaliera disponibile di sostanze [barili]
param p {Sostanze};   # Prezzo di acquisto delle sostanze [$/barile]
param c {Benzine};    # Prezzo di vendita delle benzine [$/barile]
param a_min {Sostanze,Benzine};    # Percentuale minima
param a_max {Sostanze,Benzine};    # Percentuale massima

# VARIABILI
var x {Sostanze,Benzine} >=0;      # Quantità di ogni sostanza in ogni benzina [barili]
var y {i in Sostanze} >=0, <=b[i]; # Quantità totale giornaliera consumata per ogni sostanza [barili]
var z {Benzine} >=0;               # Quantità totale giornaliera prodotta per ogni benzina [barili]

# VINCOLI
# Vincoli sulla composizione [barili]
subject to Limite_minimo {i in Sostanze, j in Benzine}:
  x[i,j] >= a_min[i,j] * z[j];
subject to Limite_massimo {i in Sostanze, j in Benzine}:
  x[i,j] <= a_max[i,j] * z[j];

# Quantità totali giornaliere di sostanze usate [barili]
subject to Risorse {i in Sostanze}:
  sum {j in Benzine} x[i,j] = y[i];
# Quantità totali giornaliere di benzine prodotte [barili]
subject to Prodotti {j in Benzine}:
  sum {i in Sostanze} x[i,j] = z[j];

# OBIETTIVO
# Massimizzazione dei profitti giornalieri [$]
maximize profits: sum {j in Benzine} c[j] * z[j]
                - sum {i in Sostanze} p[i] * y[i];

#################################
data;

set Benzine := Super Normale Verde;
set Sostanze := A B C D;

param :	b		p :=
A		3000	3
B		2000	6
C		4000	4
D		1000	5;

param 	c :=
Super	5.5
Normale	4.5
Verde	3.5;

param a_min:	Super	Normale	Verde :=
A				0.0		0.0		0.0
B				0.4		0.1		0.0
C				0.0		0.0		0.0
D				0.0		0.0		0.0;

param a_max:	Super	Normale	Verde :=
A				0.3		0.5		0.7
B				1.0		1.0		1.0
C				0.5		1.0		1.0
D				1.0		1.0		1.0;

end;

