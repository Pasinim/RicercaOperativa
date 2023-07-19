# ESERCIZIO PL Cereali

#DATI
param nC;                       #Numero di cereali
param nT;                       #Numero di terreni
set Cereali := 1..nC;           #Insieme dei cereali
set Terreni := 1..nT;           #Insieme dei terreni

param v {Cereali};              # Profitto unitario per ogni quintale di cereale prodotto [€/q]
param h {Cereali};              # Consumo di acqua [Kmc/q]
param a {Terreni,Cereali};      # Consumo di superficie [acri/q]
param b {Terreni};              # Superficie disponibile [acri]
param H;                        # Quantità di acqua disponibile [Kmc]


#VARIABILI
var x {Terreni,Cereali} >=0;	# Quantità da coltivare [q]

# VINCOLI

# Vincolo sul consumo di superficie [acri]
subject to Superficie {t in Terreni}:
  sum {c in Cereali} a[t,c] * x[t,c] <= b[t];

# Vincolo sul consumo di acqua [Kmc]
subject to Acqua:
 sum {t in Terreni, c in Cereali} h[c] * x[t,c] <= H;


#OBIETTIVO
# Massimizzazione del profitto complessivo [€]
maximize z: sum {t in Terreni, c in Cereali} v[c] * x[t,c];

###########################
data;

param nC := 6;
param nT := 2;

param v :=
1     48
2     62
3     28
4     36
5    122
6     94;

param h :=
1       0.120
2       0.160
3       0.100
4       0.140
5       .215
6       0.180;

param a :   1       2       3       4       5       6    :=
1           0.02    0.03    0.02    0.016   0.05    0.04
2           0.02    0.034   0.024   0.02    0.06    0.034;


param b :=
1   200
2   400;

param H := 400;

end;
