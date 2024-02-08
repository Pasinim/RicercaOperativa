param nS;
set S := 1..nS;
set C := 1..2;
param costo{S, S};
param domanda{S};
param cap{S};

#var x{S, C} binary; #Associa ad ogni stazione un concentratore
var y{S} binary; #Indica se nella stazione i è presente un concentratore
var x{S, C} >= 0;

s.t. numeroConcentratori: sum {s in S} y[s] <= 2;
s.t. capConc{c in C, s in S}:  domanda[s] * x[s,c] <= cap[s] * y[s];
s.t. unicoConcentratorePerStazione {c in C}:
	sum {s in S} x[s,c] = 1;
minimize z{c in C}: sum{s in S} costo[s, c] * x[s,c] * domanda[s];
data;
param nS := 6;
param costo :
				  1   2   3   4   5   6:=
   1             12  45  18  27  19  18     
   2             38  34  18  28  34  28
   3             11  10  15  34  23  10
   4             37  39  31  28  29  21
   5             15  34  11  20  28  15
   6             12  30  20  18  27  24;
param domanda := 
 1         100
   2         150
   3         100
   4         200
   5         200
   6         300;
param cap :=
  1        650
   2        500
   3        550
   4        450
   5        550
   6        600;
end;
