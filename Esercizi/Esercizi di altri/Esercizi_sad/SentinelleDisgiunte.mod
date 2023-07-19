# Esercizio sentinelle

# DATI

param nI; 				# Numero incroci
set I := 1..nI;					# Insieme degli incroci
set E within (I cross I);

# VARIABILI

var sentinella{I} binary;		# 1 Se c'è una sentinella , 0 altrimenti
var copre{E} binary;			# 1 se c'è una sentnella ai due estremi, 0 altrimenti

# VINCOLI

s.t. copertura{i in I}:
	sum{(i,j) in E} sentinella[j] + sum{(j,i) in E} sentinella[j] >= 1;

s.t. sentinellaSuNodo1{i in I, (i,j) in E}:
	copre[i,j] <= sentinella[i];

s.t. sentinellaSuNodo2{j in I, (i,j) in E}:
	copre[i,j] <= sentinella[j];

s.t. unaSentinellaGuarda{i in I}:
	sentinella[i] = sum{(i,j) in E} copre[i,j] + sum{(j,i) in E} copre[j,i];

# OBIETTIVO

minimize z : sum{i in I} sentinella[i];

#####################

data;

param nI := 30;

set E :=  1,2  1,3  1,4 2,30
		  3,13 3,16 4,5 4,6
	      4,24 5,6 5,8 5,13
		  6,7 7,9 7,10 8,9
		  8,12 8,13 8,27 9,10
		  9,27 10,11 11,23 11,29
		  12,13 12,18 12,19 12,27
		  13,14 14,15 14,18 15,16
		  15,17 18,19 18,28 19,20
		  19,28 20,21 20,22 20,29
		  24,25 24,26 27,29;

end;
