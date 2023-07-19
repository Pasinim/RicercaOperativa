# Esercizio PNL 101 - Triangolo

# DATI
# Numero di punti dati
param n;
# Insieme dei punti dati
set N := 1..n;
# Coordinate dei punti dati
param x {N};
param y {N};
# Insieme dei vertici del triangolo
# Lo stesso indice vale per il lato opposto ad ogni vertice
set V := 0..2;

# VARIABILI
# Coordinate dei vertici
var xx {V};
var yy {V};
# Lato del triangolo elevato al quadrato
var L2 := 100;
# Coefficienti della combinazione convessa
var lambda {N,V} >=0;

# VINCOLI

# I lati devono essere di uguale lunghezza
subject to Lati_uguali {j in V}:
  L2 = (xx[(j+1) mod 3]-xx[j])^2 + (yy[(j+1) mod 3]-yy[j])^2;

# I punti dati devono essere combinazioni convesse dei tre vertici
subject to Punti_coperti_x {i in N}:
  x[i] = sum {j in V} lambda[i,j] * xx[j];
subject to Punti_coperti_y {i in N}:
  y[i] = sum {j in V} lambda[i,j] * yy[j];
subject to Combinazione_convessa {i in N}:
  sum {j in V} lambda[i,j] = 1;

# OBIETTIVO
# Minimizzare il lato del triangolo
minimize z: L2;

###########################################
data;
###########################################

param n := 5;
param: x   y :=
  1   24 -17
  2   15  14
  3   -2   0
  4   21  20
  5   18  -6;
  
 end;
 