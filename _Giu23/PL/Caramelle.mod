set C;
param nC := 7;
param nI := 9;
set I;
param prop{I, C}; #Tabella delle propriozioni [%]
param disp{I};
param costo{I}; #costo ingredienti [e/kg]
param vendita{C}; #prezzo di vendita [e/kg]
param peso := 0.01; #kg

var x{C} >= 0; #produzione (kg)
var consumi{i in I} >= 0; #quantita di ingredienti utilizzati rispetto alla produzione

subj to def_y {i in I}:
	 sum{c in C} x[c] * prop[i,c]/100 <= consumi[i];
subj to dispIngredienti{i in I}:
	consumi[i] <= disp[i];

maximize z:
	sum {c in C} x[c] * vendita[c] - sum {i in I} costo[i]*consumi[i]; 


#################
data;
set C := Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety;
set I := 
Fruttosio
Saccarosio
Glucosio
Destrosio
Estratti_erbe
Estratti_frutta
Coloranti
Conservanti
Aromatizzanti
;


param prop :
Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio 30 0 5 5 5 10 10
Saccarosio 20 30 0 5 5 5 10
Glucosio 15 20 30 0 5 5 5
Destrosio 10 15 20 30 0 5 5
Estratti_erbe 10 10 15 20 30 0 5
Estratti_frutta 5 10 10 15 20 30 0
Coloranti 5 5 10 10 15 20 30
Conservanti 5 5 5 10 10 15 20
Aromatizzanti 0 5 5 5 10 10 15
;

param disp :=
Fruttosio 9
Saccarosio 5
Glucosio 20
Destrosio 18
Estratti_erbe 20
Estratti_frutta 17
Coloranti 18.4
Conservanti 12.5
Aromatizzanti 10
;

param costo :=
Fruttosio 4
Saccarosio 2
Glucosio 1
Destrosio 3.5
Estratti_erbe 8
Estratti_frutta 10
Coloranti 2
Conservanti 5
Aromatizzanti 6
;

param vendita :=
Dolce 5
Delizia 4
Bacetto 8
Golosa 5
Sfizio 6
Slurp 7.5
Sweety 4.5
;


end;

