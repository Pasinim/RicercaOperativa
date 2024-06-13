reset;
param nV := 10;
set V := 1..nV;
param x{V};
param y{V};
param nP := 3;
set P := 1..nP;


#Coordinate delle piattaforme in mezzo alla piazza
var xx {P};
var yy {P};
#Distanza piattaforma vicoli
var distvp {v in V, p in P} = sqrt((xx[p]-x[v])^2+(yy[p]-y[v])^2);
#Distanza piattaforma piattaforma
var distpp {p in P: p>1} = sqrt((xx[p]-xx[p-1])^2+(yy[p]-yy[p-1])^2);

var w {V,P} binary; #Indica se ogni vicolo è associato ad una piattaforma

#VINCOLI
#Ogni vicolo viene associato ad una piattaforma 	
subject to Assign {v in V}: sum {p in P} w[v,p] = 1;

#OBIETTIVO
minimize z: sum {v in V, p in P} distvp[v,p] * w[v,p] +
			sum {p in P: p>1} distpp[p];


data;


param: x  y :=
1     0  1
2     0  3
3     3  7
4     5  9
5     9  9
6    11  8
7    11  7
8    11  4
9     8  1
10    6  1
;

var: xx yy :=
1	3	2
2	6	4
3	9	6;


solve;
end;

