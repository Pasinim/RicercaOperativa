# Esercizio Pizze

# DATI

param nP;		# Numero persone
set P := 1..nP; # Insieme persone
param nPI;		# Numero pizze
set PI:= 1..nPI;# Insieme pizze
param G{P,PI};	# Gradimento % pizze

# VARIABILI

var Q{P,PI} >= 0 <= 1;  	# Percentuale di pizza mangiata
var minCon >= 0 <= 1;		    # Minimo grado di contentezza

# VINCOLI

s.t. pizzaMangiata{p in PI}:
	sum{i in P} Q[i,p] = 1;

s.t. minimaContentezza{i in P}:
	minCon <= sum{p in PI} Q[i,p]*G[i,p];

s.t. unaEMezza{i in P}:
	sum{j in PI} Q[i,j] = 1.5;

# OBIETTIVO

maximize z: sum{i in P,p in PI} Q[i,p]*G[i,p];

data;

param nP := 2;
param nPI := 3;


param G :     1       2       3 :=
  1         0.3     0.5     0.2
  2         0.7     0.2     0.1;

end;
