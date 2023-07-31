# Esercizio Rettangolo

# DATI

param nP;
set P := 1..nP;
set R := 0..1;
param x{P};
param y{P};


# VARIABILI
var a{R};
var b{R};
var c{R};
var L1 >= 0;
var L2 >= 0;


# VINCOLI

# Normalizzazione dei coefficienti deller ette
s.t. Normalizzazione {j in R}:
	a[j]^2 + b[j]^2 = 1;

# Perpendicolarità
s.t. Perpendicolarità:
	a[0]*a[1] + b[0]*b[1] = 0;

# Antiparallelismo
s.t. Antiparallele {j in R: j <= 1}:
	a[j] *a[j+2] + b[j] * b[j+2] = -1;

# Copertura dei punti

s.t. Copertura{i in P, j in R}:
	a[j]*x[i] + b[j] *y[i] + c[j] = 0;

# Definizione lati
s.t. lato1:
	L1 = c[0] + c[2];
s.t. lato2:
	L2 = c[1] + c[3];

# OBIETTIVO
# Minimizzare l'area
minimize z : L1*L2;

###########

data;

param nP := 10;

  
param: x,y:=
1 -7 -2
2 -3 5
3 -4 -5
4 10 5
5 11 2
6 6 9
7 0 -6
8 -6 2
9 9 0
10 -7 0;

var: a   b   c :=
0    1   0   -100
1    0  -1	 -100
2   -1   0   -100
3    0   1   -100;
end;
