param nC := 3;
set M := 1..nC; #Insieme dei motocicli
set C; # COmponenti
param r{M}; #ricavi con vendita
param t{M}; #Tempi di assemblaggio [giorni/uomo]
param coeff{C,M}; #pezzi/motociclo
param d{C}; #Disponibilità dei componenti

param eps; #Necessario per fare l'analisi parametrica

var x{M} >= 0; #numero di motocicli da produrre mensilmente
var f1;
var f2;
s.t. disponibilita {c in C}:
        sum {m in M} coeff[c,m] * x[m] <= d[c];
s.t. manodopera:
        sum {m in M} t[m] * x[m] <= f2;
        
subject to Def1: f1 = sum {j in M} r[j] * x[j];


maximize profitto: f1;
s.t. Parametric: f2 <= eps;


data;
param eps := 1300;
set C := A B C;
param r :=
1      1200
2      1300
3      1200;
param t :=
1        1
2        1
3        1;

param coeff :  1       2       3 := 
   A         10      12      14
   B          5       7       6
   C         10      15       9;
param d :=    
A       91
B       40
C       59;
end;



