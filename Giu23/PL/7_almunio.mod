set E := 1..10;
set M := 1..6;

param comp{E, M}; #composizione  chimica [% in peso]
param uB {E}; #[%]
param lB {E}; #[%]
param risorse{M}; #Materiali disponibili [tonnellate]
param costo{M}; #prezzo [$/ton]
param imp{M}; #impurita dei materiali

param obiettivo := 4.5; #quantita di alluminio da produrre

#Var
var x{M}; #quantita di materiali da acquistare per produrre alluminio 6063

	
#Vincoli
subj to tot:
	sum { m in M} x[m] = obiettivo;

subj to risorseMax {m in M}:
	 x[m] <= risorse[m];
	
subj to limiteSup {e in E, m in M}:
	x[m] * comp[e,m] <= uB[e]*obiettivo;
	
subj to limiteInf {e in E, m in M}:
	x[m] * comp[e,m] >= lB[e]*obiettivo;

#OB
minimize p :
	sum {m in M} x[m] * costo[m];

data;
param comp : 1	 	2	3	4	5	6 :=

1			0.50 0.50 0.30  0 	100	0
2			0.75 0.70 0.50  0	0	100
3			0.20 0.20 0.35	0	0	0
4			0.01 0.01 0.05	0	0	0
5			0.02 0.02 0.05	0	0	0
6			0.02 0.02 0.05	0	0	0
7 			0.02 0.02 0.05	0	0	0
8	 		.02 0.02 0.05	0	0	0
9			97.0 97.0 90.0 100	0	0
10			0.06 0.06 0.77	0	0	0

;

param imp :=
1 1.40 
2 1.45
3 7.83
4 0
5 0
6 0
;


param uB :=
1 0.6
2 0.9
3 0.35
4 0.1
5 0.1
6 0.1
7 0.1
8 0.1
9 100.0
10 0.15

;

param lB :=
1 0.2
2 0.45
3 0
4 0
5 0
6 0
7 0
8 100
9 96.9
10 0

;

param costo :=
1 1230
2 1230
3 1230
4 2140
5 1300
6 2442
;

param risorse :=
1	0.50
2	1.20
3	2.20
4   100000
5	100000
6	100000
;


end;

