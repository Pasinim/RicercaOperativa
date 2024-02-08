set I;
set C;
param perc{I, C};
param disp{I};
param p_ingredienti{I};
param p_vendita{C};
param peso;

var x{C} >= 0; #produzione caramelle #[kg]
var y{I} >= 0; #Quantita ingredienti
s.t. def_y {i in I}: y[i] = sum{c in C} x[c]*perc[i,c];
s.t. qMax {i in I}: y[i] <= disp[i];

maximize profitto: sum{c in C} x[c] * p_vendita[c] - (sum{i in I} y[i] * p_ingredienti[i]);
#Q1:
#Tutti i tipi di caramella sono convenienti da produrre? Nel caso in cui qualche tipo
#non fosse conveniente, quale dovrebbe essere il suo prezzo di vendita minimo per
#renderne conveniente la produzio  e? 
#Dolce, Golosa, sfizio  e Delzia non sono convenienti. Sarebbero convenienti se rispettivamente il prezzo aumenterebbe di 0.675, 1.18, 1.69 e 2.47 
#Q2:  qual è la caramella più robusta e quale la caramella meno robusta rispetto alle oscillazioni del cambio? La soluzione ottima non cambia dato che tutti i prezzi vartiano nello stesso modo.
#Q3 E' possibile ridurre i costi di approvvigionamento degli ingredienti? Di quanto e
con che risparmio?  Devo togliere la sottrazione dalla f.o., come se tutto fosse guià acquistato: maximize profitto: sum{c in C} x[c] * p_vendita[c], togliere le y e imporre che gli ingredienti utilizzati non superino quelli disponibili.
#Posso quindi non comprare tutti gli ingredienti che non sono scarsi
data;
set I := Fruttosio Saccarosio Glucosio Destrosio Estratti_erbe Estratti_frutta Coloranti Conservanti Aromatizzanti;
set C := Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety;
param peso := 0.01;


param perc :
                   Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio           .30      0       .05       .05       .05    .10     .10
Saccarosio          .20     .30      0        .05       .05     .05     .10
Glucosio            .15     .20      .30       0       .05     .05      .05
Destrosio           .10     .15      .20      .30      0      .05      .05
Estratti_erbe    	.10     .10      .15      .20     .30     0       .05
Estratti_frutta   	.05      .10      .10      .15     .20    .30      0
Coloranti            .05     .05       .10      .10     .15    .20     .30
Conservanti          .05     .05       .05       .10     .10    .15     .20
Aromatizzanti        0      .05       .05       .05      .10    .10     .15;


param disp :=
Fruttosio            9
Saccarosio           5
Glucosio            20
Destrosio           18
Estratti_erbe    	20
Estratti_frutta  	17
Coloranti           18.4
Conservanti         12.5
Aromatizzanti       10;

param p_ingredienti :=
Fruttosio           4
Saccarosio          2
Glucosio            1
Destrosio           3.5
Estratti_erbe   	 8
Estratti_frutta 	10
Coloranti           2
Conservanti         5 
Aromatizzanti       6;

param p_vendita:=
Dolce   5
Delizia 4
Bacetto 8
Golosa  5
Sfizio  6
Slurp   7.5
Sweety  4.5;
end;

