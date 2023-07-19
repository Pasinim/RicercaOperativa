#ESERCIZIO: PL Caramelle

#DATI
set C;              # Insieme dei prodotti (tipi di caramelle)
set I;              # Insieme degli ingredienti
param a {I, C};     # Percentuali di composizione dei prodotti [%]
param b {I};        # Disponibilita di ingredienti [Kg/giorno]
param p {I};        # Prezzo degli ingredienti [Euro/Kg]
param c {C};        # Prezzo di vendita delle caramelle [Euro/kg]
param k;            # Peso di ogni caramella [Kg]

#VARIABILI
var x {C} >= 0;						# Produzione di caramelle [Kg]
var y {i in I} >= 0, <= b[i];		# Quantita di ingredienti consumati [Kg]

#VINCOLI
# Definizione quantita' ingredienti consumati [Kg]
subject to Consumi {i in I}:
	sum {j in C} a[i,j]/100 * x[j] = y[i];

#OBIETTIVO
# Massimizzare i profitti [Euro]
maximize z : sum {j in C} c[j] * x[j] - sum {i in I} p[i] * y[i];

#################
data;

set C := Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety;
set I := Fruttosio Saccarosio Glucioso Destrosio Estratti_di_erbe
         Estratti_di_frutta Coloranti Conservanti Aromatizzanti;


param a:            Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio           30    0       5       5      5      10    10
Saccarosio          20    30      0       5      5      5     10
Glucioso            15    20      30      0      5      5     5
Destrosio           10    15      20      30     0      5     5
Estratti_di_erbe    0     10      15      20     30     0     5
Estratti_di_frutta  5     10      10      15     20     30    0
Coloranti           5     5       10      10     15     20    30
Conservanti         5     5       5       10     10     15    20
Aromatizzanti       0     5       5       5      10     10    15;

param b :=
Fruttosio              9
Saccarosio             5
Glucioso               20
Destrosio              18
Estratti_di_erbe       20
Estratti_di_frutta     17
Coloranti              18.4
Conservanti            12.5
Aromatizzanti          10;

param p :=
Fruttosio              4
Saccarosio             2
Glucioso               1
Destrosio              3.5
Estratti_di_erbe       8
Estratti_di_frutta     10
Coloranti              2
Conservanti            5
Aromatizzanti          6;

param c :=
Dolce       5
Delizia     4
Bacetto     8
Golosa      5
Sfizio      6
Slurp       7.5
Sweety      4.5;

param k := 0.01;

end;

