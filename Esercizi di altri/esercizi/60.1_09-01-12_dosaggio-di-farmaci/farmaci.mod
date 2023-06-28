# DATI

set P; # insieme dei parametri
set F; # insieme dei farmaci
param a{P};# stato attuale del paziente
param lB{P}; # lower bound dei parametri
param o{P};# stato ottimale dei parametri
param uB{P}; # upper bound dei parametri
param e{P,F}; # effetti dei farmaci sui parametri
param b{F}; # quantita somministrabile di farmaco

# VARIABILI
var x {F}; # variabile sui farmaci

# VINCOLI
subject to lowerBound {i in P} :
                a[i] + sum{j in F} (x[j] * e[i,j]) >= lB[i];

subject to upperBound {i in P} :
                a[i] + sum{j in F} (x[j] * e[i,j]) <= uB[i];

subject to limiteSomministrazione {j in F}:
                x[j] <= b[j];

# OBIETTIVO
minimize z := sum {i in P} 

data;

set P := a b c d e f g;
set F := A B C D E;

param a := 
a        3.45  
b        1800  
c        0.05  
d        3200  
e        26.4  
f          35  
g         136; 

param lB :=
    a         7.0 
    b        1700 
    c        0.50 
    d        1400 
    e         8.0 
    f          28 
    g          80; 

param o :=
   a        12.0
   b        2500
   c        0.80
   d        2000
   e        10.0
   f          35
   g         120;

param uB :=
    a        15.0
    b        3500
    c        1.30
    d        2750
    e        12.0
    f          41
    g         160;


param e :       A      B      C      D      E   :=
   a          -0.2   +0.5   +0.7   +0.1   +0.2
   b          -500    0.0   -250    +50    0.0
   c          +0.2   -0.1   +0.3    0.0   +0.2
   d           -80   -120    +15    -90   -100
   e          -8.5   -7.0   -1.0   -3.0   +1.0
   f            +5     -2     +8     -4      0
   g            -5     -1     -2     -3     +4;

param b:=
   A          2.0
   B          3.5
   C          0.5
   D          0.5
   E          7.5;





end;


