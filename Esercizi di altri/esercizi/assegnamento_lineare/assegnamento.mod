# DATI

param P;
param M;

set Persone := 1..P;
set Manzione := 1..M;

param a{Persone,Manzione};



# VARIABILI
var x {Persone ,Manzione} >= 0;

# VINCOLI

subject to lavoro {i in Persone}:
    sum {j in Manzione} (x[i,j]) = 1;

subject to personale {j in Manzione}:
    sum {i in Persone} (x[i,j]) = 1;

# OBIETTIVO

minimize z : sum{i in Persone} sum {j in Manzione} (a[i,j] * x[i,j]); 


##########################
data;

param P := 10;
param M := 10;

param a:  1  2  3  4  5  6  7  8  9  10 := 
1         35 24 62 57 81 34 36 12 63 24
2         72 25 42 25 64 14 24 74 84 15
3         48 37 62 14 56 94 51 76 11 21
4         26 26 73 83 15 89 89 21 44 53
5         62 26 37 26 15 37 24 61 54 13
6         37 37 76 3  47 52 25 38 61 50
7         59 98 84 26 47 73 51 54 51 48
8         60 54 95 50 45 6  82 33 61 72
9         62 42 68 74 73 12 36 37 38 50
10        2  52 62 38 95 60 88 25 26 84;


end;
