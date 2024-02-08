#http://www.swappa.it/wiki/Uni/RO-PNL-7novembre2007

 reset;
param nP;
set P := 1..nP;
param  x{P};
param y{P};

var a;
var b;
var c;
var z;

s.t. valAss1 {i in P} : z >   ((a*x[i] + b*y[i] + c) /  sqrt(a^2 + b^2)); 
s.t. valAss2 {i in P} : z >   (-(a*x[i] + b*y[i] + c) /  sqrt(a^2 + b^2)); 

minimize dist: sum {i in P} ((a*x[i] + b*y[i] + c) / sqrt(a^2 + b^2)); 
data;
param nP := 12;
param:  x	 y :=
   1   -10  14
   2    -8   7
   3    -5  10
   4    -3  10
   5     0   9
   6     2   8
   7     5   8
   8     8   7
   9     9   5
  10    11   6
  11    14   7
  12    16   5;
 solve;
 display a, b, c;
 end;