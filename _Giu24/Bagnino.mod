reset;
#Versione senza recinto
#Coordinate bagnino
param xb := -10;
param yb := 0;
#Coordinate persona in mare
param xp := 20;
param yp := 17;
param vc := 24; #Velocita corsa
param vn := 6; #Velocita di nuoto

var y;

var d_mare >= 0;
var d_nuoto >= 0;
var tTot;

s.t. distanzaMare:
	d_mare^2 = (-xb)^2 + (y-yb)^2;
s.t. distanzaNuoto:
	d_nuoto^2 = (-xp)^2 + (y-yp)^2;
s.t. tempoCoplessivo:
	tTot = d_mare /(vc / 3.6) + d_nuoto /(vn/3.6);

minimize z: tTot;

data;
solve;
display z;
display y;
end;

