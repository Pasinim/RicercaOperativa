#ogni oggetto ha un peso associato e tutti i containers sono u

param nC := 4;
set C := 1..nC;
param nO := 15;
set O := 1..nO;
param pesoMax := 50;
param volumeMax := 1000;
param p{O};
param v{O};

var x{O, C} binary; #Variabile di assegnamento
var cont{C} binary;  

	
subj to peso {c in C}:
	sum {o in O} x[o,c] * p[o] <= pesoMax * cont[c];
subj to oggetti {o in O}:
	sum {c in C} x[o,c] >= 1;
subj to volume {c in C}:
	sum {o in O} x[o,c] * v[o] = volumeMax * cont[c];

	
#Caso 1: Miniizzare lil numer di containers utilizzati
minimize utilizzo :
	sum {c in C} cont[c];


data;

param : p v :=
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
end;


