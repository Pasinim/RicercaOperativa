param  nD := 5;
param nU := 10;
set D := 1..nD;
set U := 1..nU;

param t{D, U}; #Costo trasporto da D a U
param  domanda{U};
param costo{D};
param cap{D};

var x{D} binary; #Indica l'utilizzo di ciascun deposito
var y{D, U} >= 0; #Quantita di merce in ogni deposito

subj to def_y{u in U}:
	sum {d in D} y[d, u] = domanda[u]; 

subj to CapacitaMax {d in D}:
	sum {u in U} y[d,u] <= cap[d] * x[d];
	

#Ogni cliente deve essere assegnato ad ogni deposito
subj to cliente {u in U}:
	sum {d in D} y[d,u] >= 1;



minimize z:
	sum {d in D} x[d] * costo[d] + sum {d in D, u in U} y[d,u] * t[d,u];

data;
param t : 1 2 3 4 5 6 7 8 9 10 :=
1 35 24 62 57 81 34 36 12 63 24
2 72 25 42 25 64 14 24 74 84 15
3 48 37 62 14 56 94 51 76 11 21
4 26 26 73 83 15 89 89 21 44 53
5 62 26 37 26 15 37 24 61 54 13
;

param: costo cap :=
1 35 175
2 32 126
3 38 110
4 38 92
5 41 155
;

param domanda :=
1 35 
2 28
3 49
4 37
5 40
6 26
7 31
8 48
9 28
10 36
;
end;

