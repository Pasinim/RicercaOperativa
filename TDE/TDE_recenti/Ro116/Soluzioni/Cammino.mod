# Esercizio Cammino minimo con archi abbinati
# DATI
param nNodi;            # Numero di nodi
set N := 1..nNodi;      # Set di nodi
set A within N cross N; # Set di archi
param c {A};            # Costi degli archi
param s;                # Nodo origine
param t;                # Nodo destinazione
param p;                # Penalità

set E within A cross A; # Coppie di archi in mutua esclusione
set P within A cross A; # Coppie di archi abbinate a penalità

# VARIABILI
var x {A} binary;       # Variabili binarie di selezione degli archi
var y {P} >=0, <=1;     # Penalità

# VINCOLI
# Cammino da s a t
subject to Outdegree_s:
  sum {j in N: (s,j) in A} x[s,j] = 1;
subject to Indegree_t:
  sum {i in N: (i,t) in A} x[i,t] = 1;
subject to FlowConservation {i in N: (i <> s) and (i <> t)}:
  sum {j in N: (j,i) in A} x[j,i] = sum {j in N: (i,j) in A} x[i,j];

# Elementarità: no cicli
subject to Elementarity_in {i in N}:
  sum {j in N: (j,i) in A} x[j,i] <= 1;
subject to Elementarity_out {i in N}:
  sum {j in N: (i,j) in A} x[i,j] <= 1;

# Incompatibilità
subject to Incompatibility {(i,j,k,l) in E}:
  x[i,j] + x[k,l] <= 1;

# Penalty
subject to Penalty {(i,j,k,l) in P}:
  y[i,j,k,l] >= 1 - (x[i,j] + x[k,l]);

# OBIETTIVO
minimize z: sum {(i,j) in A} c[i,j]*x[i,j] + p * sum {(i,j,k,l) in P} y[i,j,k,l];

########################à
data;

param nNodi := 8;
set A := (1,2) (1,3) (1,4) (2,5) (2,6) (3,2) (3,5) (3,6) (3,7) 
         (4,3) (4,6) (4,7) (5,6) (5,7) (5,8) (6,8) (7,6) (7,8);
param c :   1   2   3   4   5   6   7   8 :=
1           .   10  15  18  .   .   .   .
2           .   .   .   .   20  19  .   .
3           .   4   .   .   17  11  10  .
4           .   .   5   .   .   23  18  .
5           .   .   .   .   .   3   18  14
6           .   .   .   .   .   .   .   9
7           .   .   .   .   .   10  .   4
8           .   .   .   .   .   .   .   .
;

set E := (1,3,3,7) (1,2,5,8) (1,4,7,8);

set P := (5,8,7,8) (1,2,1,4) (5,6,7,6);

param s := 1;
param t := 8;
param p := 5;

end;
