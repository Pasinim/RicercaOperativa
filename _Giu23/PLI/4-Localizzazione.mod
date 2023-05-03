param nU := 10;
param nD := 5;
set U := 1..nU;
set D := 1..nD;
param d{D, U};
param costo{D};
param capacita{D};

var x{D} >= 0, binary; #se = 1 il deposito rifornisce l'utente

subj to vincoli {u in U}:
	sum {j in D} x[j] * d[j, u] >= 1;
subj to cap{j in D}:
	sum {u in U} x[j] * d[j,u] <= capacita[j];
minimize z:
	sum {j in D} x[j] * costo[j];
data;
param d : 1  2  3  4  5  6  7  8  9  10 :=
		1 35 24 62 57 81 34 36 12 63 24
		2 72 25 42 25 64 14 24 74 84 15
		3 48 37 62 14 56 94 51 76 11 21
		4 26 26 73 83 15 89 89 21 44 53	
		5 62 26 37 26 15 37 24 61 54 13
		;

param: 	  costo	capacita :=
		1 35 175
		2 32 126
		3 38 110
		4 38 92
		5 41 155
	;
end;

