param nV;
set V :=0..nV + 1;
set E within V cross V;
param capacita{E};
param costo{E};

#Devo fare passare il maggior numero di carri minimizzando il costo
var x{V, V} binary; #Indica se il carro passa da V a V
s.t. sensoUnico { i in V: i < 9}: sum {j in V : j >= 1} x[i,j] = 1;

maximize z:
	sum{i in V, j in V:i<>j and (i, j) in E} x[i,j] * capacita[i,j];
minimize z1:
	sum {i in V, j in V: i<>j and (i, j) in E } x[i,j] * costo[i,j];
data;
param nV := 8;
set E :=
0 1 
0 2 
0 3 
1 3 
1 4 
2 3 
2 5 
3 6 
4 5 
4 7 
5 4 
5 8 
6 7 
6 8 
6 9 
7 9 
8 9;

param : capacita costo :=
0 1 15 30
0 2 15 60
0 3 20 500
1 3 15 10
1 4 28 180
2 3 20 250
2 5 18 40
3 6 20 200
4 5 9 10
4 7 8 50
5 4 9 50
5 8 8 10
6 7 7 340
6 8 7 410
6 9 10 200
7 9 10 270
8 9 10 290;


end;
