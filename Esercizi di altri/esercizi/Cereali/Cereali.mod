# Esercizio cereali
# DATI
param nC;  # numero di cereali
param nT;  # numero di terreni

set C := 1..nC;# insieme dei cereali
set T := 1..nT;# insieme dei terreni

param a {T,C};  # consumo di superficie [acri/q] 
param p {C}; # prezzo di ogni cereale [$/q]
param h {C}; # consumo di acqua [mq/q]
param s {T}; # area disponibile in ogni terreno [acri]
param H; # acqua disponibile [mq]

# Variabili
var x {T,C} >= 0; #produziuone di ogni cereale su ogni terreno [q]

# Vincoli 
# Massima area disponibile su ogni terreno [acri]
subject to Area {i in T}:
    sum {j in C} a[i,j] * x[i,j] <= s[i];

# massimo consumo di acqua [mq]
subject to Acqua:
    sum {i in T,j in C} h[j] * x[i,j] <= H;


# obbiettivo
# massimizzare profittto totale [$]
maximize z: sum {i in T , j in C} p[j] * x[i,j];



##################
data;
param nC := 6;
param nT := 2;

param a:     1       2       3       4       5       6 :=
1	           0.02    0.03    0.02    0.016   0.05    0.04
2	           0.02    0.034   0.024   0.02    0.06    0.034;

param:   p             h        :=	
1	     48		     0.120
2	     62		     0.160
3	     28		     0.100
4	     36		     0.140
5	    122		     0.215
6	     94		     0.180;

param s:=
1	200
2	400;

param H := 400000;

end;
