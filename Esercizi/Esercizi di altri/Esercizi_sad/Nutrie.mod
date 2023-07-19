# Esercizio Nutrie

# DATI
set Paesi;
param nn{Paesi};
param nC;
set C := 1..nC;

# VARIABILI
var x{Paesi,C} binary;
var target{C} >= 0;
var maxtarget;
# VINCOLI

s.t. Num_paesi_per_cacciatore{c in C}:
	sum{p in Paesi} x[p,c] <= 3;

s.t. Target{c in C}:
	target[c] = sum{p in Paesi} nn[p]*x[p,c] / sum{c1 in C} x[p,c1];

s.t. MinCacc{p in Paesi}:
	sum{c in C} x[p,c] >= 1;

# OBIETTIVO
minimize z: maxtarget;

s.t. Minmax{c in C}: maxtarget >= target[c];
###########################

data;
set Paesi := A B C D E F G H I L ;
param nC := 5;

param nn :=
A 20
B 30
C 24
D 36
E 80
F 72
G 54
H 37
I 25
L 47;