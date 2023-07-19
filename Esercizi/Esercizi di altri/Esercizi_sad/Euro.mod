# Esercizio Euro

# DATI

param nS := 1000;		# Numero di somme da pagare, in centesimi
set S := 1..nS;
param nT;		# Numero tagli
set T := 1..nT; # Insieme dei tagli
param v{T};		# Valore dei tagli in centesimi

# VARIABILI

var tagliUsati{S,T} >= 0 integer;		# Tagli usati per arrivare alla somma
var x >= 0 integer;
var resto{S,T} >= 0;

# VINCOLI

s.t. sommaDeiTagli{i in S}:
	sum{j in T} tagliUsati[i,j]*v[j] = i + sum{j in T} resto[i,j];

s.t. taglioPeggiore{i in S}:
	x >= sum{j in T} (tagliUsati[i,j] + resto[i,j]);

# OBIETTIVO

minimize z: x;

#####################

data;

param nT := 10;
param v :=
1 1
2 2
3 5
4 10
5 20
6 50
7 100
8 200
9 500
10 1000;


end;
