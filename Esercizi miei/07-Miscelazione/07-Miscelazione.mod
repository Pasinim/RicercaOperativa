set Elementi := 1..10;
set Materiali := 1..6;
set Materiali2 := 1..3;
param q {Materiali2}; #quantità di materiali disponibili [t]
param c {Materiali}; #costi materiali [e/t]
param a {Elementi, Materiali}; #composizione dei materiali [%]
param min {Elementi}; #percentuale minima di elementi chimici [%]
param max {Elementi}; #percentuale massima di elementi chimici [%]
param d := 4.5; #domanda di alluminio [t]

#VARIABILI
var x {Materiali} >= 0; #quantità totale prodotta per ogni elemento
# var totale; so guà il totale, è la quantità di alluminio da produrre, cioè la domanda

#VINCOLI 

subject to prod_alluminio: #la produzione di AL deve essere 4.5 t
    sum {i in Materiali} x[i] = d;

subject to limInf {m in Materiali}:
    sum {e in Elementi} a[e,m] * x[m] / d >= min[m];

subject to limSup {m in Materiali}:
    sum {e in Elementi} a[e,m] * x[m] / d >= max[m];

 #la quantità acquistata deve essere <= delle risorse
subject to risorse {m in Materiali2}:
    x[m] <= q[m];    


#OBIETTIVO: minimizzare il costo per otternere alluminio
minimize z:
    sum {m in Materiali} c[m] * x[m];

data;

#set Elementi := Silicio Magnesio Ferro Rame Manganese Zinco Cromo Titanio Alluminio Altri;

#param: q    c :=
#1   0.5     1230
#2   1.2     1230
#3   2.2     1230
#4   10000   2140 #come metto infinito? Faccio separato
#5   10000   1300
#6   10000   2442
#;

param q := 
1   0.5
2   1.2
3   2.2;

param c := 
1   1230
2   1230
3   1230
4   2140
5   1300
6   2442;

param:   min    max :=
1        .2     .6
2        .45    .9
3        0      .35
4        0      .1
5        0      .1
6        0      .1
7        0      .1
8        0      .1
9        96.9   100
10       0      .15
;

param a: 1      2           3      4        5     6:=
1       0.50    0.50     0.30      0        100   0
2       0.75    0.70     0.50      0        0      100
3       0.20    0.20     0.35      0        0       0
4       0.01    0.01     0.05      0        0       0
5       0.02    0.02     0.05      0        0       0
6       0.02    0.02     0.05      0        0       0
7       0.02    0.02     0.05      0        0       0
8       0.02    0.02     0.05      0        0       0
9       97.0    97.0     90.0     100       0       0
10      0.06    0.06     0.77       0       0       0
;

end;
