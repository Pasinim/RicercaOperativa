# Esercizio Cereali

# Dati

param nC ;
param nT ;
set Cereali := 1..nC;
set Terreni := 1..nT;

param v {Cereali};				# Profitto unitario [€/q]
param a {Terreni,Cereali};	    # Consumo di superficie [acri/q]
param h {Cereali};		    	# Consumo di acqua [Kmc/q]
param b {Terreni};              # Superficie disponibile [acri]
param H;                        # Quantità di acqua disponibile [Kmc]

# Variabili
var x {Terreni,Cereali} >=0;	# Quantità da coltivare [q]

# Obiettivo
# Massimizzazione del profitto complessivo [€]
maximize z:
  sum {t in Terreni, c in Cereali} v[c] * x[t,c];

# Vincoli
# Consumo di superficie [acri]
subject to Superficie {t in Terreni}:
  sum {c in Cereali} a[t,c] * x[t,c] <= b[t];

# Consumo di acqua [Kmc]
subject to Acqua:
 sum {t in Terreni, c in Cereali} h[c] * x[t,c] <= H;

####
data;
####

param nC := 6;
param nT := 2;

param a :   1       2       3       4       5       6    :=
1           0.02    0.03    0.02    0.016   0.05    0.04
2           0.02    0.034   0.024   0.02    0.06    0.034;

param: v      h   :=
1     48     0.120
2     62     0.160
3     28     0.100
4     36     0.140
5    122     0.215
6     94     0.180;

param b :=
1   200
2   400;

param H := 400;

end;
