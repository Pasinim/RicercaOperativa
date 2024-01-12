

param nP := 5;
set T := 1..3;
set P := 1..nP;
param x{P}; #ascisse dei punti
param y{P}; #ordinatedei punti

var xx{T}; #Ascisse dei vertific del triangolo eq
var yy{T}; #Ordinate dei vertific del triangolo eq

data;
param : x y :=
  1   24 -17
  2   15  14
  3   -2   0
  4   21  20
  5   18  -6
;
end;


