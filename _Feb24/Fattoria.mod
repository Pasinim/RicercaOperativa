set T; #Insieme dei lotti di terreno
param nC;
set C := 1..nC;
param a{T}; #area terreno [acri] 
param profitto{C}; #[e/q]
param area{T, C}; #[acri]
param acqua{C};
param acquaTot;

var x{T, C} >= 0;

s.t. limAcqua:
	sum {t in T, c in C} x[t,c] * acqua[c] <= acquaTot;
s.t. limTerreno {t in T}: 
	sum {c in C} x[t,c] * area[t,c] <= a[t];

maximize z: sum {c in C, t in T} profitto[c] * x[t,c];
data;
param acquaTot := 400000; #[m3]
set T := A B;
param nC := 6;
param a :=
A 200
B 400;
param: profitto	acqua :=
1	48	120
2	62	160
3	28	100
4	36	140
5	122	215
6	94	180;
param area :
	1	2	3	4	5	6 :=
A	0.02	0.03	0.02	0.016	0.05	0.04
B	0.02	0.034	0.024	0.02	0.06	0.034;
end;

