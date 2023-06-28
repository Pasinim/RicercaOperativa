# DATI
param N;
set O := 1..N;
param a{O}; # volume
param c {O}; # valore
param b;    # capacità
# VARIABILI
var x {O} >= 0, binary;

# VINCOLI

subject to capacity :
    sum {i in O} a[i] * x[i] <= b;

# OBIETTIVO 
maximize z: sum {i in O} c[i]* x[i];

#####################
data;

param N := 10;

param a :=
1  8  
2  9  
3  13 
4  24 
5  28 
6  36 
7  41 
8  57 
9  68 
10 70;


param c :=
1    4
2    6
3    40
4    15
5    20
6    20
7    21
8    38
9    46
10   56;


param b:= 100;


end;
