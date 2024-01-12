
param nM := 3;
set M := 1..nM;
set C;
param ricavi{M}; #Ricavo per ogni motociclo [kE/u]
param t{M}; #Tempo di assemblaggio [gg/u]
param ct{C,M}; #Coefficienti tecnologici [pezzi/u]
param d{C}; #Disponibilita di materia prima [pezzi/mese]

var x{M} >= 0; #Numero di motocicli 
var f1; #Profitto
var f2; #Tempo uomo
#Si tratta di un modello di programmazione lineare intera
#Q1: Minimizzare il numero di giorni uomo necessari all'assemblaggio

s.t. disponibilita {c in C}:
	sum {m in M} x[m] * ct[c,m] <= d[c];
s.t. def_f1: sum{m in M} x[m] * ricavi[m] <= f1;
s.t. def_f2: sum{m in M} x[m] * t[m] <= f2;
	
#minimize z:
	#sum {m in M} x[m] * t[m];
maximize w:
	f1 - 1000*f2;

data;
set C := A B C;


param: 	   ricavi	t :=
    1      1200		1
    2      1300		1
    3      1200		1
;
param ct :    1       2       3 :=
   A         10      12      14
   B          5       7       6
   C         10      15       9
;
param d :=
   A       91
   B       40
   C       59
;

end;

