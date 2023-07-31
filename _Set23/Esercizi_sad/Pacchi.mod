# Esercizio pacchi postali

# DATI

param nT;       # Numero tipi
param nO;       # Numero oggetti da spedire
set T := 1..nT; # Insieme dei pacchi
set O := 1..nO; # Insieme degli oggetti
param co{T};    # Costo dei pacchi
param volMin{T};# Volume minimo
param volMax{T};# Volume massimo
param pMin{T};  # Peso minimo
param pMax{T};  # Peso massimo
param vol{O};   # Volume degli oggetti
param peso{O};  # Peso degli oggetti
param nP{T};    # Numero di pacchi per tipo
set P{k in T} := 1..nP[k];

# VARIABILI

var y{k in T, P[k]} binary;         # 0 se non è utilizzato, 1 altrimenti
var x{O,k in T,P[k]} binary;        # 1 se impaccato, 0 altrimenti

# VINCOLI

s.t. volumeMinimo{k in T, j in P[k]}:
 sum{i in O} x[i,k,j]*vol[i] >= volMin[k]*y[k,j];

s.t. volumeMassimo{k in T, j in P[k]}:
 sum{i in O} x[i,k,j]*vol[i] <= volMax[k]*y[k,j];
 
s.t. pesoMinimo{k in T, j in P[k]}:
 sum{i in O} x[i,k,j]*peso[i] >= pMin[k]*y[k,j];
 
s.t. pesoMassimo {k in T, j in P[k]}:
 sum{i in O} x[i,k,j]*peso[i] <= pMax[k]*y[k,j];

s.t. impaccoTutto{i in O}:
 sum{k in T, j in P[k]} x[i,k,j] = 1;

# Symmetry breaking constraints
s.t. SBC{k in T, j in P[k]: j > 1}:
   y[k,j] <= y[k,j-1];

# OBIETTIVO

minimize z: sum{k in T, j in P[k]} y[k,j]*co[k];

################

data;

param nP :=
1   2
2   2;

param: vol peso :=
1        14        750
2        13        520
3        62        140
4        28        910
5        19        230
6        20        250
7        31        600
8         4        315
9        10        800
10        15        320
11        15        480;


param: co volMin volMax pMin pMax :=
 1    10000    0      150       0    1500
 2    15000  120     1000    1000    4000;

param nT := 2;
param nO := 11;

end;
