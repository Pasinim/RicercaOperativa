param nU := 10;
param nD := 5;
set U := 1..nU;
set D := 1..nD;
param ct{D, U};
param costo{D};
param capacita{D};
param domanda{U};

var x{U, D} >= 0; #quantita di merce trasportata 
var y{D} binary; #Indica se D è utilzzato
 
 subj to domandaUtente {u in U}:
	sum {d in D} x[u,d]  = domanda[u] ;
subj to capMax {d in D}:
	sum {u in U} x[u,d] <= capacita[d] * y[d];
	
minimize z:
	sum{u in U, d in D} ct[d, u] * x[u,d] + sum {d in D} y[d] * costo[d];


data;
param ct: 1 2 3 4 5 6 7 8 9 10:=
1 35 24 62 57 81 34 36 12 63 24
2 72 25 42 25 64 14 24 74 84 15
3 48 37 62 14 56 94 51 76 11 21
4 26 26 73 83 15 89 89 21 44 53
5 62 26 37 26 15 37 24 61 54 13;

param: costo capacita :=
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

