 reset;
 param nC;
 set C := 1..nC;
 param r{C}; #Raggio dei cerchi
 param rMax := 200;
 
 var x{C}; #Ascisse del cerchio i
 var y{C}; #Ordinate del cerchio i
 var minDistanza;
 
 s.t. def_maxDistanza{i in C, j in C: i < j}:
 	minDistanza <=  ((x[i]^2 - x[j]^2) + (y[i]^2 - y[j]^2))^(0.5) - (r[i] - r[j]);
 s.t. contenutoNelCerchio {i in C}:
 	(x[i]^2 + y[i]^2) <= (rMax - r[i]);
 
 #In altri termini si vogliono localizzare nel piano 
 #alcuni cerchi in modo da massimizzare la distanza minima tra 
 #le loro circonferenze.
 maximize z: minDistanza;
data;
param nC := 20;
param r :=
1 24
2 31
3 15
4 7
5 18
6 22
7 10
8 8 
9 25
10 27
11 14
12 13
13 11
14 19
15 2
16 3
17 9
18 4
19 5
20 20;
solve;
display x,y;
end;
