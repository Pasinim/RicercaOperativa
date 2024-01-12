param nV := 3;
set V := 1..nV;
param x{V};
param y{V};
param z{V};
param area_min := 100;

var p >= 0;

#Coordinate vertici del triangolo
var xx{V};
param yy{V};
param zz{V};
#Var ausiliarie: Lunghezza lati e  semi perimetro 	
var lato{V};
var p;

s.t. def_lato {i in V}:
	lato[i] = sqrt((x[i+1 mod 3] + xx[i])^2 + ()^2 + ()^2);
s.t. def_p {v in V}:
	p = ()/2

data;
param: x y z :=
1 30  50  50
2 60  10  45
3 40  30  10
;
end;
