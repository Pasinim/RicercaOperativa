param nV := 8;
set V := 1..nV;
param x{V}; #Ascisse del contorno della fontana
param y{V}; #Ordinate del contorno della fontana

var xx; #ascissa del centro;
var yy; 
var r; #Raggio del cerchio

s.t. raggio{v in V}: 
	(x[v] - xx) + (y[v] - yy) <= r;
minimize z:  r;
	

data;
param : x y :=
1 -2 -2
2 -3 10
3 0 10
4 9 10
5 7 2
6 6 0
7 4 -1
8 0 -2
;
end;
