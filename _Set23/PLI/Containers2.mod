param nO := 15;
set O := 1..nO;
param nC := 4;
set C := 1..nC;
param capacita := 50;
param volume := 1000;
param peso{O};
param vol{O};
param costo{C};
param pesoC{C};

var x{C} binary; #1 sse c è utilizzato
var y{O, C} binary; #1 sse o è in C
subject to max_cap{c in C}:
	sum {o in O} peso[o] * y[o, c] <= pesoC[c]* x[c];
#Caso 2	
#subject to max_vol{c in C}:
#	sum {o in O} vol[o] * y[o, c] <= volume * x[c];
	
subj to oggetti {o in O}:
	sum {c in C} y[o,c] = 1;

#Ob1: Trasportare tutti gli oggetti
#minimize containers:
#	sum {c in C} x[c];
	
#Ob3: Minimizzare il costo
minimize prezzo:
	sum {c in C} costo[c] * x[c];

data;
param: peso vol :=
1 10 260
2 24 140
3 18 190
4 7 220
5 7 180
6 6 250
7 16 170
8 11 200
9 8 140
10 11 170
11 1 190
12 6 230
13 15 230
14 8 180
15 2 250
;
#Caso 3 
param: costo pesoC :=
1 900 45
2 1000 50
3 1200 60
4 1300 80
;
end;

