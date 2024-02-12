# Esercizio Trimestre
# DATI
param nP;                   # N. di prodotti
set P := 1..nP;             # Set di prodotti
param nR;                   # N. di risorse
set R := 1..nR;             # Set di risorse
param b {R};                # Quantità di risorse disponibili
param a {R,P};              # Coefficienti tecnologici [Kg/u]
param nK {P};               # N. intervalli per ogni prodotto
set K {j in P} := 1..nK[j]; # Set intervalli per ogni prodotto
param q {j in P,K[j]};      # Valore iniziale di ogni intervallo [u]
param c {j in P,K[j]};      # Prezzo di vendita per ogni intervallo [€/u]

# VARIABILI
var x {j in P,K[j]} >=0, integer;    # Produzione venduta in ogni intervallo [u]

# VINCOLI
# Vincolo sulla disponibilità di materie prime e componenti [Kg]
subject to Tech {i in R}:
  sum {j in P} a[i,j] * (sum {k in K[j]} x[j,k]) <= b[i];
  
# Max quantità vendibile in ogni intervallo [uj]
subject to Maxvendita {j in P, k in K[j]: k<nK[j]}:
  x[j,k] <= q[j,k+1] - q[j,k];

# OBIETTIVO
# Massimizzazione dei ricavi [€]
maximize z: sum {j in P, k in K[j]} c[j,k] * x[j,k];

#####################
data;
#####################

param nP := 3;
param nR := 4;

param b :=
1  37000
2  32000
3  40000
# 40000 << valore iniziale
# 40397.89474       prezzo max 9.17431
# poi non è più scarsa
4  47000
# 47000 << valore iniziale
# 49538.88889       prezzo max 23.39450
# poi non è più scarsa
;

param a: 1     2     3 :=
1       18    12    12
2       15    12    11
3       18    18    13
4       25    18    12;

param nK :=
1   3
2   3
3   4;

param q: 1   2   3   4 :=
1        0 200 500   .
2        0 150 600   .
3        0  50 150 300;

param c: 1    2    3    4 :=
1     1000  900  750    .
2      800  750  500    .
3      700  650  600  400;

end;
