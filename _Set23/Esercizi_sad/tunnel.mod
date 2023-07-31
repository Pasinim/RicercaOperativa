# Esercizio Tunnel

# DATI

param n;
set N := 1..n;
param x{N};
param y{N};

# VARIABILI

var a := 1;
var b := 0;
var c := -10;
# Distanza dalla retta
var delta{N};

# VINCOLI

# Normalizazione coefficienti della retta
s.t. Normalizzazione : a^2 + b^2 = 1;

# Linearizzazione valori assoluti
s.t. Distanze1{i in N}:
	delta[i] >= a*x[i] + b*y[i] + c;

s.t. Distanze2{i in N}:
	delta[i] >= -a*x[i] - b*y[i] - c;
	
# OBIETTIVO

minimize z: sum{i in N} delta[i];

##############################################
data;

param n := 12;
param:  x   y :=
1     -10  14
2      -8   7
3      -5  10
4      -3  10
5       0   9
6       2   8
7       5   8
8       8   7
9       9   5
10     11   6
11     14   7
12     16   5;
  
end;

