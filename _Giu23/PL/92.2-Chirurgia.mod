param nS := 3;
set s := 1..nS;
param nP := 10;
set p := 1..nP;
param disp{s}; #disponibilità sala [minuti]
param attesa{p}; #tempo necessario x intervento [minuti]

#var
var x{i in p, j in s} binary; #var assegnamento paziente-sala

#vinc
subj to operaz {i in p}:
	sum {j in s} x[i,j] <= 1;


subj to minutiTotali {j in s}:
	sum {i in p} x[i,j] * attesa[i] <= disp[j];

#ob: massimizzare il numero di pazienti che è possibile operare
maximize z:
	sum {i in p, j in s} x[i, j];
	
data;
param disp := 
1 360
2 360
3 420
;

param attesa := 
1 120
2 60
3 75
4 80
5 130
6 110
7 90
8 150
9 140
10 180
;

end;

