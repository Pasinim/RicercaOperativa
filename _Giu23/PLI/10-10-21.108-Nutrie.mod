param nP := 10;
set P := 1..nP;
param T := 3; #Massimo numero di paesi che puo coprire un cacciatore
param nC := 5; #Numero cacciatori
set C := 1..nC;
param pop {P}; #popolazione di nutrie per ogni paese

#Variabili
var x {C, P} binary; #il cacciatore c può andare in p
var target >= 0;
var numero_cacc{P} >= 0 integer; #numero di cacciatori per ogni paese
#Vincoli
subj to cacc{p in P}:
	numero_cacc[p] = sum{c in C} x[c,p]  ;
#ad ogni paese bisogna associare almeno un cacciatore
subj to cacciatoreMinimo {p in P}:
	sum {c in C} x[c,p] >= 1;
subject to maxTerritorio {c in C}:
	sum {p in P} x[c,p] <= T;
subj to minTerritorio {c in C}:
	sum {p in P} x[c,p] >= 1;


subj to trg {c in C}:
	target >= sum {p in P} (x[c,p] * (pop[p] /numero_cacc[p]));

minimize z: target;
	
data;
param pop := 
	1 	20
	2 	30
	3 	24
	4 	36
	5 	80
	6 	72
	7 	54
	8 	37
	9 	25
	10	 47
;

end;


