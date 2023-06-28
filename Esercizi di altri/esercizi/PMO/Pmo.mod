# Esercizio PMO

# DATI

set P := 1..4;
set R := 1..4;
param b {R};
param a {R,P};
param c1 {P};
param c2 {P};


# VARIABILI

var x {P} >= 0;
var f1;
var f2;

# VINCOLI
subject to Consumi {i in R}:
    sum {j in P} a[i,j] * x[j] <= b[i];

subject to def_f1:
    f1 = sum {j in P} c1[j] * x[j];

subject to def_f2:
    f2 = sum {j in P} c2[j] * x[j];

# Obiettivo
maximize z : 0.25*f1 + 0.75*f2;


###########################
data;
param b:=
1   100
2   120
3   90
4   110;

param a:    1 2 3 4 :=

1           3 2 5 4
2           8 10 1 1 
3           1 3 6 9
4           2 0 8 11;

param: c1   c2 :=
1      1.0  1.7
2      1.5  0.4
3      1.3  2.0
4      2.5  0.7;


end;
