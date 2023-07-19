# Esercizio 2: Patate

# Dati

set T;				# Tipi di trasformazione
set F;				# Fornitori
param profitti {F};	# Profitti per fornitore
param limiti {T};	# Limiti di acquisto patate [kg]
param perc {F,T};	# Percentuale di trasformazione [%]

# Variabili

var x {i in F} >= 0;

# Vincoli

subject to Produzione {i in T}:
	sum {j in F} x[j]*perc[j,i] <= limiti[i];

# Obiettivo

maximize z:
	sum {i in F} profitti[i]*x[i];

##################
data;

set T := A B C;
set F := Forn1 Forn2;

param profitti :=
Forn1	0.02
Forn2	0.03;

param limiti :=
A	6000
B	4000
C	8000;

param perc:	A		B		C :=
Forn1		0.2		0.2		0.3
Forn2		0.3		0.1		0.3;

end;
