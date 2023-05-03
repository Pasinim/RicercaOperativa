# Esercizio Patate
# Dati
set Prodotti;
set Fornitori;

param b {Prodotti};				# Max. quantità producibili [Kg]
param c {Fornitori};			# Profitti unitari [€/Kg]
param a {Fornitori,Prodotti};	# Percentuali di trasformazione []

# Variabili
var x {Fornitori} >=0;			# Quantità acquistate da ogni fornitore [Kg]

# Vincoli
# Limite massimo sulla produzione di ogni prodotto [Kg]
subject to Prod 
# Obiettivo
# Massimizzazione del profitto complessivo [€]
maximize z:
  sum {f in Fornitori} c[f] * x[f];

#############################
data;

set Prodotti := A B C;
set Fornitori := Forn1 Forn2;

param b :=
A	6000
B	4000
C	8000
;

param c :=
Forn1	0.02
Forn2	0.03
;

param a :	A		B		C :=
Forn1		0.2		0.2		0.3
Forn2		0.3		0.1		0.3
;

end;
