# Esercizio Triangolo

# DATI
param nP;
set P := 1..nP;
param x {P};
param y {P};
set V := 0..2;

# VARIABILI

var xv {V};
var yv {V};
var lambda {P,V};
var L2 >= 0;

# VINCOLI

# Combinazione convessa
s.t. Combinazione_convessa_x {i in P}:
	x[i] = sum{j in V} xv[j]*lambda[i,j];

s.t. Combinazione_convessa_y {i in P}:
	y[i] = sum{j in V} yv[j]*lambda[i,j];

# Normalizzazione
s.t. Somma1 {i in P}: 
	sum{j in V} lambda[i,j] = 1;

# Lato
s.t. Lato{j in V}: 
	(xv[j] - xv[(j+1)mod 3] )^2 + (yv[j] - yv[(j+1) mod 3])^2 = L2;

# OBIETTIVO

minimize z: L2;

#################################
data;

param nP := 5;
param: x y :=
1  24 -17
2 15 14
3 -2 0
4 21 20
5  18 -6;

var: xv  yv :=
0	-10   0
1 	 25	 30
2 	 25	 30;

end;