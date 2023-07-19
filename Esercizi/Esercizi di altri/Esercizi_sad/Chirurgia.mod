# Esercizio Chirurgia

# DATI

param nS;			# Numero sale
set S := 1..nS;		# Insieme delle sale
param T{S};			# Tempo disponibilità sale [s]
param nP;			# Numero pazienti
set P := 1..nP;		# Insieme pazienti
param tsO{P};		# Durata attesa operazione

# VARIABILI

var A{S,P} binary;# 1 Se il paziente è assegnato alla sala, 0 altrimenti. 

# VINCOLI

s.t. assegnamentoPaziente{i in P}:
	sum{j in S} A[j,i] <= 1;

s.t. durataOperazioni{i in S}:
	sum{j in P} tsO[j]*A[i,j] <= T[i];

# OBIETTIVO

maximize z: sum{i in S, j in P} A[i,j];

####################

data;

param nS := 3;
param nP := 10;

param T :=
1 360
2 360
3 420;

param tsO :=
   1		120
   2		60
   3		75
   4		80
   5		130
   6		110
   7		90
   8		150
   9		140
  10		180;

end;
