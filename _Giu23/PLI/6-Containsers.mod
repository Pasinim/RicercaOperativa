
set O := 1..15;
set C := 1..4;
param peso {O};
param volume {O};
param costo {C};
param capacita {C};
 
#Indica che il container è utilizzato
var y{C} binary;

var x{O, C} binary; #Indica se l'oggetto p è nel container c

#Non deve eccedere la capacita dei container
subject to capacitaMax {c in C}:
# moltiplico per y perche devo fare il confronto solamente su quelli utilizzati
	sum {o in O} x[o,c]*peso[o] <= capacita[c] *y[c];

#trasportare tutti gli oggetti
subj to assegnamento{o in O}:
	sum{c in C} x[o,c] = 1;



#Minimizzaare il numero di containers usati:
minimize z:
	sum {c in C} y[c];
 
data;
param capacita := 
	1 50 2 50 3 50 4 50;

param : peso volume :=
	1	10 	260
	2	24 140
	3	18 190
	4	7 220
	5	7 180
	6	6 250
	7	16 170
	8	11 200
	9	8 140
	10	11 170	
	11	1 190
	12	6 230
	13	15 230
	14	8 180
	15	2 250
;

#param : costo capacita :=
#1		900 45
#2		1000 50
#3		1200 60
#4		1300 80
#; Solo nel caso 3



end;

