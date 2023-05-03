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
param epsilon := max {i in N, k in N} ((x[i]-x[k])^2+(y[i]-y[k])^2);

# VARIABILI
# Coordinate dei vertici
var xx {V};
var yy {V};
# Lato del triangolo elevato al quadrato
var L2 >=epsilon, := 100;
# Parametri rette dei lati
var a {V};
var b {V};
var c {V};

# VINCOLI
# Normalizzazione coefficienti delle tre rette
subject to Normalizzazione {j in V}:
  a[j]^2 + b[j]^2 = 1;

# I lati devono essere di uguale lunghezza
subject to Lati_uguali {j in V}:
  L2 = (xx[(j+1) mod 3]-xx[j])^2 + (yy[(j+1) mod 3]-yy[j])^2;

# Passaggio delle rette dai punti
subject to Passaggio {j in V, k in V: k <> j}:
  a[j]*xx[k] + b[j]*yy[k] + c[j] = 0;
  
# I punti dati devono cadere dalla stessa parte del vertice opposto
subject to Punti_coperti {i in N, j in V}:
  a[j]*x[i] + b[j]*y[i] + c[j] >= 0;
subject to Vertice_opposto {j in V}:
  a[j]*xx[j] + b[j]*yy[j] + c[j] >= sqrt(3*epsilon)/2;

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
 