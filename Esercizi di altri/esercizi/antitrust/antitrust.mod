# DATI
param P;
param F;
set Prodotti := 1..P;
set Filiali := 1..F;
param a {Filiali, Prodotti};

# VARIABILI
var x {Filiali} binary;
var delta >= 0;
var y1 {Prodotti};
var y2 {Prodotti};


# VINCOLI
subject to fatturato_azienda1 {j in Prodotti}:
    y1[j] = sum{i in Filiali} a[i,j]*(1-x[i]);


subject to fatturato_azienda2 {j in Prodotti}:
    y2[j] = sum{i in Filiali} a[i,j]*x[i];


# OBIETTIVO

minimize z: delta;
subject to valpos {j in Prodotti}: delta >= y1[j] - y2[j]; 
subject to valneg {j in Prodotti}: delta >= y2[j] - y1[j]; 



data;

param P := 3;
param F := 7;


param a:  1  2  3    :=
1         83 14 42
2         38 63 56
3         28 24 12
4         59 7 53
5         25 35 83
6         52 86 85
7         59 64 25;

end;
