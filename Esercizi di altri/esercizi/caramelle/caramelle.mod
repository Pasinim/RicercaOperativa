# ESERCIZIO CARAMELLE

#DATI

set P; # Insieme dei prodotti 
set I; # Insieme degli ingredienti
param a {I,P}; # Composizione percentuale (%)
param b {I};   # Quantità disponibili [Kg/g]
param p {I}; # prezzo degli ingredienti
param c {P}; # Prezzo di vendita dei prodotti [$/kg]

# Variabili
var x {P} >=0 ; # Produzione [Kg/g]

# Vincoli
# vincoli sui consumi dei ingredienti [kg/g]
subject to Consumi {i in I}:
    sum {j in P} x[j]*a[i,j]/100 <= b[i];

# Obbiettivo
 # massimizzazione dei profitti, cioe dei ricavi [$/g]
 maximize z: sum {j in P} c[j]*x[j];

######################################
data;

set P := Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety;
set I := Fruttosio, Saccarosio, Glucosio, Destrosio,
Estratti_di_erbe, Estratti_di_frutta, Coloranti, Conservanti, Aromatizzanti;


param a:           Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio           30      0       5       5      5    10     10
Saccarosio          20     30       0       5      5     5     10
Glucosio            15     20      30       0      5     5      5
Destrosio           10     15      20      30      0     5      5
Estratti_di_erbe    10     10      15      20     30     0      5
Estratti_di_frutta   5     10      10      15     20    30      0
Coloranti            5      5      10      10     15    20     30
Conservanti          5      5       5      10     10    15     20
Aromatizzanti        0      5       5       5     10    10     15;

param b :=

Fruttosio            9
Saccarosio           5
Glucosio            20
Destrosio           18
Estratti_di_erbe    20
Estratti_di_frutta  17
Coloranti           18.925 # 18.4 valore di partenza
Conservanti         12.5
Aromatizzanti       10;
 
param p :=

Fruttosio           4
Saccarosio          2
Glucosio            1
Destrosio           3.5
Estratti_di_erbe    8
Estratti_di_frutta 10
Coloranti           2
Conservanti         5 
Aromatizzanti       6;

param c := 
Dolce   5
Delizia 4
Bacetto 8
Golosa  5
Sfizio  6
Slurp   7.5
Sweety  4.5;


# Tutte le caramelle pesano 10 grammi.

end;
