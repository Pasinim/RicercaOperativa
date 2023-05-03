set T := 1..3;
set F := 1..2;

param resa {F, T}; #Resa di ogni tipo di patata per ogni fornitore [%]
param profitto {F}; #profitto per ogni tipo di patata [$]
param lim {T}; #limite acquistabile per ciascun fotnitore [kg]

var x{F} >=0;

#Vincoli
subj to limiteProduzione {j in T}:
	sum {i in F} x[i] * resa[i,j] <= lim[j]
	;
	
#Ob
maximize prof:
	sum{i in F} x[i] * profitto[i]
	;

data;
param resa :	 1	 2	 3 :=
1				.2	.2  .3
2				.3  .1  .3
;

param profitto :=
1	0.01
2	0.03
;

param lim := 
1	6000
2	4000
3	8000
;


end;


