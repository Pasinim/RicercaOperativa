param nL := 2;
param nC := 6;
set C := 1..nC;
set T := 1..nL;
param g{T}; #area Terrreni [acri]
param p{C}; #Profitto [e/q]
param acqua{C}; #acqua richiesta [m3/q]
param  area{T, C}; #area richiesta [acri/q]
param acquaTot := 400000;

#Varaibili
var x{T, C} >= 0; #quantita prodotta per ogni cereale[q]

#Vincoli
subj to acquaMax:
	sum {t in T, c in C} x[t,c] * acqua[c] <= acquaTot;
	
subj to areaTot{t in T}:
	sum {c in C} x[t, c] * area[t, c] <= g[t];



maximize profitto {t in T}:
	sum {c in C} x[t, c] * p[c];
	
	
	
maximize profitto:
	sum {t in T, c in C} x[t, c] * p[c];

data;
param g := 
1	200
2	400
;

param p :=
1 48
2 62
3 28
4 36
5 122
6 94
;

param acqua :=
1 120
2 160
3 100
4 140
5 215
6 180
;

param area :	1		2	3  	4	  5		6 :=
1				0.02 0.03 0.02 0.016 0.05 0.04
2				0.02 0.034 0.024 0.02 0.06 0.034
;
end;
