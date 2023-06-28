# DATI
param U;
param D;

set Utenti := 1..U;
set Depositi := 1..D;

param c{Depositi,Utenti};
param k{Depositi};
param q{Depositi};
param d{Utenti};

# VARIABILI
var y {Depositi}, binary;
var x {Depositi,Utenti} >= 0;
# VINCOLI

subject to soddisfacimento_richiesta {j in Utenti}:
    sum {i in Depositi} x[i,j] = d[j];

subject to capacity {i in Depositi}:
    sum {j in Utenti} x[i,j] <= q[i]*y[i];

# invece di moltiplicare nel vincolo sopra per y possiamo:
#subject to collegamento_x_y {i in Depositi,j in Utenti}:
#   x[i,j] <= y[i]*100000; # M = 100000


# OBIETTIVO
minimize z : sum {i in Depositi,j in Utenti} c[i,j]*x[i,j] + sum{i in Depositi} k[i]*y[i];  


data;

param U := 10;
param D := 5;


param c: 1  2  3  4  5  6  7  8  9  10 :=
1        35 24 62 57 81 34 36 12 63 24
2        72 25 42 25 64 14 24 74 84 15
3        48 37 62 14 56 94 51 76 11 21
4        26 26 73 83 15 89 89 21 44 53
5        62 26 37 26 15 37 24 61 54 13;

param k :=
1 35 
2 32 
3 38 
4 38 
5 41; 

param q:=
1 175
2 126
3 110
4 92
5 155;

param d:=
1 35
2 28
3 49
4 37
5 40
6 26
7 31
8 48
9 28
10 36;

end;

