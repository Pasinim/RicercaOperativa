# Esercizio Ragno

# DATI

param nA;			# Numero appigli
set A := 0..nA;		# Insieme degli appigli
param aX{A};		# Coordinata X degli appigli [cm]
param aY{A};		# Coordinata Y degli appigli [cm]
param aZ{A};		# Coordinata Z degli appigli [cm]
param aMin;			# Area minima della ragnatela[cmq]

# VARIABILI

var  x{i in 0..2} := aX[i]+10;			# Coordinata x dei vertici
var  y{i in 0..2} := aY[i]+10;			# Coordinata y dei vertici			
var  z{i in 0..2} := aZ[i]+10;			# Coordinata z dei vertici
var a >= 100;
var l{i in 0..2} = sqrt((x[i] - x[(i+1)mod 3])^2 + 
					      (y[i] - y[(i+1)mod 3])^2 + 
					      (z[i] - z[(i+1)mod 3])^2 ); 
var p = 0.5*sum{i in 0..2} l[i];        

# VINCOLI

s.t. area:
	a = sqrt( p *(p - l[0])*(p - l[1])*(p -l[2]));

# OBIETTIVO

minimize w : sum{i in A} sqrt( (x[i] - aX[i])^2 + (y[i] - aY[i])^2 + (z[i] - aZ[i])^2 )+
				+ p*2;

#######################
data;

param nA := 2;

param: aX   aY   aZ :=
0      30   50   50
1      60   10   45
2      40   30   10;

param aMin := 100;


end;