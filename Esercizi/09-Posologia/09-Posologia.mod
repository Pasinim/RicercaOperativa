
#DATI
set hour := 1..24;
set farmaco;
set hour2 := 1..12;

param max := 45; #[mg/c]
param q {hour}; #minimo all'ora [mg/cc all'ora]
param a {hour2, farmaco}; #tasso di proteina Y prodotta [mg/cc per ogni g di farmaco]
param p{farmaco}; #prezzo [e/g]

#VARIABILI
var x {h in hour, farmaco} >=0, <= max;
#VINCOLI

subject to qmin {h in hour: h > 1}:
    sum{j in farmaco, k in hour2} a[k, j] * x[h-k, j];
    #devo considerare la durata del farmaco


#OBIETTIVO
#si vuole trovare una posologia che consenta di rispettare i limiti
#richiesti, minimizzando (a) la quantità di sostanza
# complessiva da assumere durante la giornata, 
minimize sostanza {j in farmaco}:
    sum {i in hour} a[i,j]; 


#oppure (b) il costo della cura, calcolabile conoscendo
#il prezzo dei farmaci
minimize prezzo {j in farmaco}:
    sum{i in hour} x[i]*p[j];




data;
set farmaco := Prismil Cilindren;

param q :=
5 1 0 0 0 0 4 15 12 5 4 3 25 30 25 15 5 4 3 25 30 25 20 10
;

param a: Prismil    Cilindren
0         1.5          2.5
1         3.0          4.0
2         4.0          5.5
3         2.5          4.0
4         1.9          3.0
5         1.4          1.5
6         1.0          0.7
7         0.7          0.4
8         0.5          0.2
9         0.3          0.0
10        0.2          0.0
11        0.1          0.0
12        0.0          0.0
;


end;

