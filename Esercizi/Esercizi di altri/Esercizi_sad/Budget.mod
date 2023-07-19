# Esercizio Budget


# DATI
param nP;		# Numero progetti
set P := 0..nP; # Insieme dei progetti
param minInv;	# Minimo investimento totale [€]
param maxInv;	# Massimo investimento totale [€]
param pA{P};	# Profitti società americana
param pAs{P};   # Profitit società asiatica

# VARIABILI

var x{P} >= 0;		# Investimento totale per ogni progetto [€]

# VINCOLI


# L'investimento totale fatto deve essere superiore all'investimento minimo richiesto [€]
s.t. investimentoMinimo:
	sum{i in P} x[i] >= minInv;

# L'investimento totale fatto deve essere minore all'investimento massimo richiesto  [€]
s.t. investimentoMassimo:
	sum{i in P} x[i] <= maxInv;

s.t. investimentiDivisi{ i in P}:
	x[i] <= x[ (i+1) mod 3] + x[ (i+2) mod 3];

s.t. guadagnoAsia:
	sum{i in P} x[i]*pAs[i]/1000 =  sum{i in P} x[i]*pA[i]/1000;

# OBIETTIVO

maximize z : sum{i in P} x[i]*pA[i]/1000;

##################

data;

param nP := 2;
param minInv := 100000;
param maxInv := 800000;

param :      pA      pAs := 
0            10		  20
1            15		  16
2            18		   8;



end;
