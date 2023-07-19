# Esercizio Hong Kong

# DATI

param nA;			# Numero appuntamenti
set A := 1..nA;		# Insieme degli appuntamenti
param PC{A};		# Punti consumati per raggiungere ogni appuntamento
param VA{A};		# Valore di ogni appuntamento
param TOT;			# Numero di punti totali

# VARIABILI

var AC{A} binary;	# 1 se conclude l'affare, 0 se non lo conclude
var ultimo{A} binary;	# ULTIMO APPUNTAMENTO

# VINCOLI

s.t. punti:
	 + 1 + sum{i in A} AC[i]*PC[i]  <=  TOT + sum{i in A} ultimo[i]*PC[i] ;

s.t. unSoloUltimo:
	sum{i in A} ultimo[i] <= 1;

#s.t. collegaUltimo{i in A}:
#	ultimo[i] <= AC[i];

s.t. ultimoAppuntamento{i in A, j in A}:
	ultimo[i]*VA[i] - (1-AC[j])*VA[j] <= VA[j]*AC[j];


# OBIETTIVO

maximize z: sum{i in A} VA[i]*AC[i];

data;

param nA := 20;
param TOT := 850;

param PC :=
1 200 
2 180
3 165
4 141 
5 138 
6 130 
7 122 
8 115 
9 109 
10 104 
11 90
12 79 
13 61 
14 50 
15 42 
16 34 
17 27 
18 20 
19 12  
20 9;

param VA :=
1 112
2 105 
3 104  
4 99  
5 97  
6 90  
7 81  
8 78  
9 66  
10 58 
11 55 
12 52 
13 50 
14 43 
15 41
16 37 
17 35 
18 33 
19 30 
20 25;

end;
