# Esericizio Caramelle

# DATI

set i;				# Ingredienti.
set p;				# Prodotti.
param c {i,p};		# Composizioni percentuali dei prodotti.
param d {i};		# Disponibilità giornaliera degli ingredienti [Kg/giorno].
param pi {i};		# Prezzi degli ingredienti [€/kg].
param pp {p};		# Prezzi di vendita dei prodotti [€/kg].
param peso;			# Peso delle caramelle [kg].

# VARIABILI

var cP{p} >= 0;		# Caramelle prodotte [kg].
var cI{i} >= 0;		# Ingredienti acquistati [kg].

# VINCOLI

s.t. disponibilitaIngredienti {t in i}:
	cI[t] <= d[t];

s.t. vincoloProdottiIngredienti {t in i}:
	sum{f in p} cP[f] * c[t,f]/100 <= cI[t];

# OBIETTIVO

maximize z : (sum{f in p} cP[f] * pp[f]); # - (sum{t in i} pi[t] *  cI[t]);


#############

data;

set i := Fruttosio Saccarosio Glucosio Destrosio Estrattidierbe Estrattidifrutta Coloranti Conservanti Aromatizzanti;

set p := Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety;

param c :          Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio           30      0       5       5      5    10     10
Saccarosio          20     30       0       5      5     5     10
Glucosio            15     20      30       0      5     5      5
Destrosio           10     15      20      30      0     5      5
Estrattidierbe      10     10      15      20     30     0      5
Estrattidifrutta     5     10      10      15     20    30      0
Coloranti            5      5      10      10     15    20     30
Conservanti          5      5       5      10     10    15     20
Aromatizzanti        0      5       5       5     10    10     15;


param d :=
Fruttosio            9
Saccarosio           5
Glucosio            20
Destrosio           18
Estrattidierbe      20
Estrattidifrutta    17
Coloranti           18.4
Conservanti         12.5
Aromatizzanti       10;

param pi :=
Fruttosio           4
Saccarosio          2
Glucosio            1
Destrosio           3.5
Estrattidierbe      8
Estrattidifrutta   10
Coloranti           2
Conservanti         5 
Aromatizzanti       6;

param pp :=
Dolce   5
Delizia 4
Bacetto 8
Golosa  5
Sfizio  6
Slurp   7.5
Sweety  4.5;

param peso := 0.01;

end;
