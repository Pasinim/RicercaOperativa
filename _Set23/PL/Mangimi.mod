param nM := 5;
param nP := 3;
set M := 1..nM;
set P := 1..nP;
set I;
param perc{M, I}; #[%]
param t{M, P}; #[min/q] tempo per ogni linea di produzione
param d{I}; #[q/gg]
param v{M}; #prezzo [klire/q]
param s{M};	#inizio lavorazione
param e{M}; #fine lavorazione
param produzione {P, M};
##########################
var p{M} >= 0; #quantita da produrre per ogni tipo di mangime
var comp{M, I} >= 0; #composizione

s.t. def_p{m in M}:
	sum {i in I} comp[m,i] = p[m];
	
s.t. ingredienti{m in M, i in I}:
	comp[m,i] / p[m] = perc[m, i];

##########################
data;
set I := A B C D;
param produzione : 1 2 3 4 5 :=
1 27 0 12 0 50
2 33.75 13 2.5 6 30
3 60 0 90 0 21
;
param perc : A B C D :=
1 30 20 20 30
2 40 5 10 45
3 40 35 10 15
4 50 20 20 10
5 50 30 5 15
;

param t : 1 2 3 :=
1 5 4 2
2 8 5 2
3 10 10 2
4 10 5 5
5 3 5 5
;

param d := 
A 150
B 135
C 90
D 75
;
param v :=
1 40
2 50
3 35
4 55
5 30
;

param: s e :=
1 0		120
2 30	180
3 120	270
4 225	300
5 255	360
;


end;

