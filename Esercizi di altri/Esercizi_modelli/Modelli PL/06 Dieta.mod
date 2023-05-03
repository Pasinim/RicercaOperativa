# Esercizio Dieta

# DATI
set Alimenti := 1..9;
set Sostanze := 1..3;
set Sali := 1..2;

param q     {Sostanze, Alimenti};   #g ogni 100g
param pSali {Sali, Alimenti};       # percentuale sali fabbisogno
param qmax  {Sostanze};             #min sostanze perc
param qmin  {Sostanze};             #max sostanze perc
param costi {Alimenti};             #costi in lire / Kg

# VARIABILI
var x {Alimenti} >=0; # quantit� in grammi
var y {Sostanze} >=0;
var totale;

# VINCOLI
subject to val_y{i in Sostanze}:
     sum {j in Alimenti} x[j] * q[i,j] / 100 = y[i];
     
subject to tot:
     sum{i in Sostanze} y[i] = totale;

subject to Fabbisogno {k in Sali}:
     sum{j in Alimenti} (x[j]*pSali[k,j] / 100) >= 100;

subject to Lim_min {i in Sostanze}:
    y[i] >= qmin[i] * totale / 100;

subject to Lim_max {i in Sostanze}:
     y[i] <= qmax[i] * totale / 100;

# OBIETTIVO
minimize z: sum {j in Alimenti} x[j] * costi[j] / 1000;

####
data;
####

param q :   1		2		3		4		5		6		7		8		9 :=
1           11.5    3.15    8      33      18.5     2.1     2.4    12.0     9
2           72.7    4.85    3.8     0       0.5     0       0.6    68      74
3            1.5    1.55   11      28.4    19       0.1     0.5     6       1
;


param pSali:    1		2		3		4		5		6		7		8		9 :=
1               0      15      52.5    139       0     1.25     0       0       0
2               0       0      28       85      20     6.05     0       0       0
;

param: qmin qmax :=
1        25   35 
2        15   25 
3        10   20 
;

param costi :=
1     2000
2	  2200
3	 16000
4	 29000
5    22500
6	  3500 
7	  5000
8 	  7000
9	 10000
;

end;
