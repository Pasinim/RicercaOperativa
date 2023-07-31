# Esercizio Cereali

# Dati

param nC;
set cereali:= 1..nC;              # Insieme dei cereali
param nT;
set terreni:= 1..nT;              # Insieme dei terreni 
param p  {cereali};               # Profitti untiari [€/q]
param a {terreni,cereali};        # Fabbisogno di area [acri/q]
param h {cereali};                # Fabbisogno di acqua [mc/q]
param H;                          # Acqua disponibile [mc]
param A{terreni};                 # Area disponibile[acri]

# Variabli

var x {terreni, cereali} >= 0;     #Quantità coltivata[q]

# Vincoli

# Area disponibile [acri]
subject to consumo_area {i in terreni}:
  sum {j in cereali } a[i,j] * x[i,j] <= A[i];

# Acqua disponibile [mc]
subject to consumo_acqua :
  sum {i in terreni, j in cereali} h[j] * x[i,j] <= H;
# Obiettivo

maximize profitti : sum {i in terreni, j in cereali} p[j]*x[i,j];

##########

data;

param nC := 6;
param nT := 2;
param : p h :=
1 48 120
2 62 160
3 28 100
4 36 140
5 122 215
6 94 180;

param a : 1 2 3 4 5 6 :=
1 0.02 0.03 0.02 0.016 0.05 0.04
2 0.02 0.034 0.024 0.02 0.06 0.034;

param H := 400000;
param A :=
1 200
2 400;

end;
