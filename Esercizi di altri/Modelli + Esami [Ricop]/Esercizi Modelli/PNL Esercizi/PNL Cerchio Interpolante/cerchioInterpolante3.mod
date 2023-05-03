#ESERCIZIO 27 - PNL Cerchio Interpolante

#DATI
param Num;
set N := 1..Num;
param x {N};
param y {N};
param w {N};

#VARIABILI
# Centro e raggio della circoferenza
var xx;
var yy;
var r;
var errmax;
var d {i in N} = sqrt((x[i]-xx)^2+(y[i]-yy)^2);

#VINCOLI
#Non si sono vincoli

#OBIETTIVO

#Errore massimo
minimize z2: errmax;
subject to minmax1 {i in N}: errmax >= w[i] * (d[i]-r);
subject to minmax2 {i in N}: errmax <= w[i] * (d[i]-r);


#Errore quadratico medio
#minimize z3: sum {i in N} w[i] * (d[i]-r)^2 / Num;


#########################3
data;

param Num := 10;

param:  x    y   w   :=
1      51   13   3
2      48   75   5
3      16   57   4
4      33   70   2
5      95   52   3
6      59   10   3
7      23   61   4
8      32   70   4
9      87   50   2
10     46   98   1;

end;


Scenario B

Punto  X    Y  Peso
  1  -20  -10   1
  2  -10    0   1
  3  -10  -20   1
  4    0  -10   1
  5  -10    1   1
  6  -10   -1   1

