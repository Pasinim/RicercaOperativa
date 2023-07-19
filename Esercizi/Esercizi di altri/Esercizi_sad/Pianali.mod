# Esercizio Pianali

# DATI

param nA;				# Numero automobili.
set A := 1..nA;			# Insieme delle automobili
param lA{A};			# Lunghezza delle automobili [m]
param vA{A} default 0;	# Se è vincolata a stare su, il valore è 1.
param nP;				# Numero pianali
set P := 1..nP;			# Insieme dei pianali
param lP{P};			# Lunghezza dei pianali [m]
param allungamento{P};	# Allungamento del pianale [m]
param cap;				# Allungamento complessivo pianali inferiori
param nC := 3; # Numero camion
set C := 1..nC;			# Insieme dei camion

# VARIABILI

var usoDeiCamion{C} binary; # 1 se è utilizzato, 0 altrimenti
var assegna{A,P,C} binary;# 1 se è assegnata a quel pianale, 0 altrimenti. 
var all{ i in P,C} >= 0 <= allungamento[i]; # Allungamento dei pianali [m]

# VINCOLI

s.t. soloPianaleSuperiore{i in A, j in P, k in C: (j == 1 or j ==3) and vA[i] == 1}:
	 assegna[i,j,k] = 0;

s.t. assegnaTutteLeAuto{i in A}:
	sum{j in P, k in C} assegna[i,j,k] = 1;

s.t. usoDelCamion{k in C, i in A, j in P}:
	assegna[i,j,k] <= usoDeiCamion[k];

s.t. allungamentoMassimo{j in C}:
	sum{i in P} all[i,j] <= cap;

s.t. lunghezzaMassima{i in P,k in C}:
	sum{j in A} assegna[j,i,k]*lA[j] <= lP[i]+all[i,k];

s.t. SBC{i in C : i > 1}:
	usoDeiCamion[i-1] >= usoDeiCamion[i];

# OBIETTIVO

minimize z: sum{i in C} usoDeiCamion[i];

#####################

data;

param nA := 16;
param nP := 4;

param cap := 1.5;

param: lP allungamento :=
1			7    1
2		    7.1  0
3           7    1
4           7.2  0;

param vA :=
2 1
3 1
12 1
13 1;

param lA :=
1    3.3    
2    3.8    
3    3.8    
4    3.4    
5    4.0    
6    3.8    
7    3.8    
8    3.9    
9    4.0    
10   4.0    
11   3.5    
12   3.6    
13   3.7    
14   3.5    
15   4.0    
16   3.5;


end;
