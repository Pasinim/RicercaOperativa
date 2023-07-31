param nS := 3;
set S :=1..nS;
param disp{S};

param nP := 10;
set P := 1..nP;
param h{P}; #durate interventi [min];

var x{P, S} binary;

subj to assegnamento {p in P}:
	sum {s in S} x[p,s] >=1;
	
subj to tempo {s in S}:
	sum{p in P} x[p,s] * h[p] <= disp[s];

maximize pazienti:
	sum {p in P, s in S} x[p,s];

#Pazienti nella sala 1: 1, 7, 8
#Pazienti nella sala 2: 2, 3, 4, 9
#Pazienti nella sala 3: 5, 6, 10
#Si tratta di un problema di assegnamento. Il problema è un problema di PLI con varaibili binarie. Esistono soluzioni simmetriche dato che due sale operatorie hanno entrambe disponibilità di 3 ore.

data;
param disp:=
1 360
2 360
3 420
;

param h :=
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

