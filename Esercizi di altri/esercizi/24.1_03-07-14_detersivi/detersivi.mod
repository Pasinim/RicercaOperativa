# DATI

set P;
set S;

param lB{P,S}; #lower bound di sostanze nei prodotti
param uB{P,S}; #upper bound di sostanze nei prodotti
param b{S}; # disponibilità delle sostanze
param c{P}; # ricavo della vendita dei prodotti

# VARIABILI
var x{P,S};

# VINCOLI
subject to lowerBound{i in P,j in S} :
        x[i,j] * 100 >= lB[i,j] *  sum{a in S} x[i,a];

subject to upperBound{i in P,j in S} :
        x[i,j] * 100 <= uB[i,j] *  sum{a in S} x[i,a];

subject to limiteMateriali{j in S} :
        sum {i in P} x[i,j] <= b[j];

# OBIETTIVO

maximize z: sum{i in P} (sum {j in S}(x[i,j]) * c[i])
;
data;


set P := B ,S ,T;

set S := a , v, p;

param lB :   a        v       p :=

   B         80        5      10  
   S         70       10       5  
   T         65       20      15;

param uB :   a      v       p   :=
 B           90     10      20  
 S           85     20      15
 T           70     50      35;

param b :=
   a          700
   v          150
   p          200;


param c :=
   B        2.5
   S        2.0
   T        3.0;

end;
