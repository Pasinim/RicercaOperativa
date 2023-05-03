#ESERCIZIO 05 - PLI Segherie

#DATI
param n;                # Numero punti di raccolta
set N := 1..n;          # Insieme dei punti di raccolta
param m;                # Numero di siti candidati
set M := 1..m;          # Insieme di siti candidati
param x1 {N};           # Ascissa punti di raccolta
param y1 {N};           # Ordinata punti di raccolta
param x2 {M};           # Ascissa siti candidati
param y2 {M};           # Ordinata siti candidati
param q {N};            # Quantita' di legname da ogni punto di raccolta [q]
param Q {M};            # Capacita di ogni sito [q]
param c {M};            # Costo di funzionamento di ogni sito [Euro]
param coeff;            # Coefficiente di costo unitario [Euro/km q]

param d {i in N, j in M} := sqrt( (x1[i]-x2[j])^2+(y1[i]-y2[j])^2 );

#VARIABILI
var y {M} binary;       # Selezioni siti
var x {N,M} binary;     # Frazione di legname da "i" a "j"

#VINCOLI

subject to Capacity {j in M}:
   sum {i in N} q[i] * x[i,j] <= Q[j] * y[j];

subject to Assignment {i in N}:
   sum {j in M} x[i,j] = 1;

#OBIETTIVO
#Minimizzare i costi complessivi: i costi di funzionamento dei siti selezionati + costi di trasporto del legname
minimize z: sum {j in M} c[j] * y[j] + 
            sum {i in N, j in M} coeff * d[i,j] * q[i] * x[i,j];


###################
data;

param n := 15;

param:  x1      y1       q :=
1       0.40    0.66     58
2       0.76    0.17     35
3       0.11    0.47     27
4       0.65    0.58     42
5       0.18    0.88     60
6       0.19    0.02     31
7       0.62    0.62     18
8       0.90    0.17     24
9       0.66    0.95     36
10      0.42    1.00     37
11      0.95    0.12     48
12      0.16    0.26     39
13      0.07    0.71     53
14      0.75    0.43     61
15      0.30    0.76     29;

param coeff := 10;

param m := 5;

param:      x2      y2         c        Q   :=
1           0.25    0.20       3.0     190 
2           0.55    0.25       4.5     240
3           0.90    0.15       3.0     200
4           0.15    0.45       4.4     220
5           0.85    0.55       4.6     190;

end;
