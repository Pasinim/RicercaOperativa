#dati
param nA;
set A:=0..nA; #appigli
#coordinate degli appigli, espresse in cm
param x{A};
param y{A};
param z{A};
param Area; #[cm^2]
param xProva{A};
param yProva{A};
param zProva{A};

#variabili
#coordinate dei punti attaccati agli appigli
var xR{a in A} :=xProva[a];
var yR{a in A} :=yProva[a];
var zR{a in A} :=zProva[a];
#lati del triangolo
var delta{a in A} = sqrt((xR[a]-xR[(a+1)mod 3])^2+(yR[a]-yR[(a+1)mod 3])^2+(zR[a]-zR[(a+1)mod 3])^2);
#semiperimetro
var p = (sum{a in A} delta[a])/2;

#vincoli
s.t. area_minima:
	sqrt(p*(p-delta[0])*(p-delta[1])*(p-delta[2]))>=Area;

#obiettivo
minimize w: (p*2) + (sum{a in A}sqrt((xR[a]-x[a])^2+(yR[a]-y[a])^2+(zR[a]-z[a])^2));

data;
param nA:=2;
param Area:=100; 
param: x y z:=
0 30  50  50
1 60  10  45
2 40  30  10;

param: xProva yProva zProva:=
0 42.74217  30.29082  32.62579
1 42.74235  30.29091  4532.62581
2 42.74218  30.29082  32.62569;