# Esercizio Droni

# DATI

param nP;		# Numero punti
set P := 1..nP;	# Insieme dei punti
param X{P};		# Coordinata X dei punti
param Y{P};		# Coordinata Y dei punti
param r;		# Raggio minimo del drone [unità]
	
# VARIABILI
 
var a >= 0.1; # Semiasse minore
var b >= 0.1; # Semiasse maggiore

# VINCOLI

s.t. puntiEllisse{ i in P: i > 1}:
	(X[i]^2)/(a^2) + (Y[i]^2)/(b^2) = 1;

s.t. raggioMinimoA:
	a >= r;

s.t. raggioMinimoB:
	b >= r;
	

# OBIETTIVO

minimize z: sqrt((X[1]-X[2])^2 + (Y[1]-Y[2])^2) + 3.14*sqrt((a^2+b^2)/2);

############################

data;

param nP := 3;

param: X  Y :=
1	   0  0
2	  20  0 
3     15 15;

param r := 1;

end;
