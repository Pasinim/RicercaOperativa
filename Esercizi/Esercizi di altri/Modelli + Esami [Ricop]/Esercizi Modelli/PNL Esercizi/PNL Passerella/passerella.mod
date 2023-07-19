#ESERCIZIO 29 - PNL Passerella

#DATI
param nP;
set P := 1..nP;
param nV;
set V := 1..nV;
#Coordinate estremita' di ogni vicolo
param x {V};
param y {V};

#VARIABILI
#Coordinate delle piattaforme
var xx {P};
var yy {P};
var distvp {v in V, p in P} = sqrt ((xx[p]-x[v])^2+(yy[p]-y[v])^2);
var distpp {p in P: p>1} = sqrt ((xx[p]-xx[p-1])^2+(yy[p]-yy[p-1])^2);
var w {V,P} binary;

#VINCOLI
subject to Assign {v in V}: sum {p in P} w[v,p] = 1;

#OBIETTIVO
minimize z: sum {v in V, p in P} distvp[v,p] * w[v,p] +
			sum {p in P: p>1} dispp[p];

###################
data;

param nP := 3;
param nV := 10;

I punti sul contorno della piazza sono 10.
Le loro coordinate sono le seguenti:

Punto 1  2  3  4  5  6  7  8  9 10
x     0  0  3  5  9 11 11 11  8  6
y     1  3  7  9  9  8  7  4  1  1

Gli snodi disponibili da collocare nella piazza sono 3 oppure 4.

end;
