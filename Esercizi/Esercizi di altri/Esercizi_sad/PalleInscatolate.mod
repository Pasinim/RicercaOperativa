# Esercizio Palle Inscatolate

# DATI

param nD;			# Numero decorazioni diverse
set D := 1..nD;		# Insieme tipi delle decorazioni
param rD{D};		# Raggio delle decorazioni [cm]
param nuD{D};		# Numero decorazioni per tipo
set decorazioni{i in D} := 1..nuD[i];

# VARIABILI

var lunghezza >= 0 := 17;	# Lunghezza della scatola [cm]
var larghezza >= 0 := 15;	# Larghezza della scatola [cm]
var altezza >= 0 := 15.5;     # Altezza della scatola   [cm]

var posX{d in D,decorazioni[d]} >= rD[d];
var posY{d in D,decorazioni[d]} >= rD[d];
var posZ{d in D,decorazioni[d]} >= rD[d];

# VINCOLI

s.t. nonSiSovrappongono{d in D,i in decorazioni[d],f in D, j in decorazioni[f]: !(d == f and i == j)}:
	 (posX[d,i] - posX[f,j])**2 + (posY[d,i] - posY[f,j])**2 +
	(posZ[d,i] - posZ[f,j])**2   >= (rD[d] + rD[f])**2;

s.t. valoreX{d in D,j in decorazioni[d]}:
	posX[d,j] + rD[d] <= lunghezza;

s.t. valoreY{d in D,j in decorazioni[d]}:
	posY[d,j] + rD[d] <= altezza;

s.t. valoreZ{d in D,j in decorazioni[d]}:
	posZ[d,j] + rD[d] <= larghezza;

# OBIETTIVO

minimize z: larghezza*lunghezza*altezza;

###################

data;

param nD := 6;

param: rD nuD :=
1    2          3
2    4          2
3    3          2
4    4          2
5    2          3
6    3          2;

end;
