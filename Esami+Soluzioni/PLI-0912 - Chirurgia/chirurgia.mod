param nP := 10;
param nS := 3;
set P := 1..nP;
set S := 1..nS;
param durata {P};
param disponibilita {S}; #disponibilità delle sale [minuti]

#Var
var x{P, S} binary; #var che indica che la sala S è occuapta dal paziente p

#Vincoli
#I pazienti devono essere operati una sola volta
subj to vincolo {p in P}: 
	sum {s in S} x[p,s] <= 1;
#La durata delle operazioni non deve eccedere il tempo disponibile in ogni sala operatoria
subj to disp {s in S} :
	sum {p in P} x[p,s]*durata[p] <= disponibilita[s];
	


#Obiettivo
#Massimizzare il numero di pazienti assegnati
maximize z:
	sum {p in P, s in S} x[p,s];

data;

param disponibilita:=
	1 	360
	2	360
	3	420
;
param durata:=
   1		120
   2		60
   3		75
   4		80
   5		130
   6		110
   7		90
   8		150
   9		140
  10		180
;

end;
