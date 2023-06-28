
# DATI
param L;
param U;

set Luoghi := 1..L;
set Utenti := 1..U;

param a {Utenti,Luoghi};
param c {Luoghi};
# VARIABILI

var x {Luoghi} >= 0 , binary;

# VINCOLI

subject to assegnamento {i in Utenti}:
    sum {j in Luoghi} a[i,j]*x[j] >= 1;

# OBIETTIVO

minimize z: sum {j in Luoghi} c[j]* x[j];


data;

param L := 10;
param U := 5;

param a: 1 2 3 4 5 6 7 8 9 10 :=
1        1 0 0 0 1 1 1 0 1 1
2        0 0 0 1 1 0 0 0 1 0
3        0 0 0 0 1 1 0 0 0 0
4        0 0 0 0 0 0 1 1 1 0
5        1 1 1 0 0 0 0 1 1 1;

param c := 
1 205
2 311
3 450
4 274
5 321
6 469
7 327
8 631
9 750
10 400;






end;
