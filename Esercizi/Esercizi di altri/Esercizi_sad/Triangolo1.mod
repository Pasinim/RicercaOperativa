# Esercizio Triangolo

# RISOLTO USANDO INSIEME CONVESSO.

#

# DATI

param nP;			# Numero dei punti
set P := 1..nP;		# Insieme dei punti
param xP{P};		# Coordinata X dei punti
param yP{P};		# Coordinata Y dei punti
set V := 0..2;		# Insieme vertici del triangolo

# VARIABILI

var x{V};		# Coordinate X dei vertici del triangolo
var y{V};		# Coordinate Y dei vertici del triangolo
var lambda{P,V} >= 0;
var L >= 0 := 30;

# VINCOLI

# EQUIDISTANZA DEI PUNTI

s.t. equidistanti{i in V}:
	L =  (x[i] - x[(i+1) mod 3])^2 + (y[i] - y[(i+1) mod 3])^2 ;

s.t. coefficientiConvessi{i in P}:
	sum{j in V} lambda[i,j] = 1;

s.t. combinazioneConvessaX{i in P}:
	sum{j in V} lambda[i,j]*x[j] = xP[i];
s.t. combinazioneConvessaY{i in P}:
	sum{j in V} lambda[i,j]*y[j] = yP[i];

# OBIETTIVO

minimize z: L;

#########################

data;

param nP := 5;

param: xP yP :=
1 24 -17
2 15 14
3 -2 0
4 21 20
5 18 -6;

end;
