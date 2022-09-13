#Dati
set C; #insieme delle caramelle
set I; #insieme degli ingredienti
param peso := 0.01; #peso caramelle [kg] (dato ridondante)
param perc {I, C}; #ingredienti [%]
param d {I}; #disponibilità giornaliera [kg/gg]
param costo {I}; #prezzo ingredienti [$/kg]
param prezzo {C}; #prezzo di vendita caramelle [$/kg]

#Variabili
var x {C} >= 0; #quantità di caramelle prodotte per ogni tipo [kg/gg]
#incroduco una variabile per indicare i consumi di ingredienti. Assiee alla definizione di y indico anche il limite in modo da introdurre il vincolo del consumo
var y {i in I} >= 0, <= d[i]; #comsumo ingredienti [kg]

#Vincoli
#Limite giornaliero -> definizione quantità ingredienti consumati [kg]
subj to consumi {i in I}:
	sum {c in C} x[c] * perc[i,c]/100 = y[i];

#senza varaibile ausiliaria
#subj to consumi {i in I}:
	#sum {c in C} x[c] * perc[i,c]/100 <= d[i];



#OB: Massimizzare la produzione [$]
maximize z: 
	sum {c in C} x[c] * prezzo[c] - 
	sum {i in I} costo[i] * y[i]; #produzione * costo ingredienti * perc - produzone * prezzo
	
	#maximize z: (senza var ausiliaria)
	#sum {c in C} x[c] * prezzo[c] - 
	#sum {i in I, c in C} costo[i] * x[c] * perc[i,c]/100; 
	
data;

set C :=  Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety; 
set I := Fruttosio, Saccarosio, Glucosio, Destrosio, Estratti_erbe, Estratti_frutta, Coloranti, Conservanti, Aromatizzanti; 

param perc :        Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio           30      0       5       5      5    10     10
Saccarosio          20     30       0       5      5     5     10
Glucosio            15     20      30       0      5     5      5
Destrosio           10     15      20      30      0     5      5
Estratti_erbe       10     10      15      20     30     0      5
Estratti_frutta   	 5     10      10      15     20    30      0
Coloranti            5      5      10      10     15    20     30
Conservanti          5      5       5      10     10    15     20
Aromatizzanti        0      5       5       5     10    10     15 ;

param d :=
Fruttosio            9
Saccarosio           5
Glucosio            20
Destrosio           18
Estratti_erbe    	20
Estratti_frutta  	17
Coloranti           18.4
Conservanti         12.5
Aromatizzanti       10
;

param costo :=
Fruttosio           4
Saccarosio          2
Glucosio            1
Destrosio           3.5
Estratti_erbe    	8
Estratti_frutta 	10
Coloranti           2
Conservanti         5 
Aromatizzanti       6
;

param prezzo :=
Dolce   5
Delizia 4
Bacetto 8
Golosa  5
Sfizio  6
Slurp   7.5
Sweety  4.5
;

end;
