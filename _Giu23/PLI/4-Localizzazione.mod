#Non capisco il testo

param nD;
param nU;

set D := 1..nD;
set U := 1..nU;

param t {D, U}; #costi di trasporto
param e {D}; #costi di esercizio
param c {D}; #capacita dei depositi

var x {D, U} binary;


minimize costo:
	sum {i in D, j in U} x[i, j] * t[i, j];
	

data;
param nD := 5;
param nU := 10;

param t :  1  2  3	 4	 5  6  7  8  9 10 :=
1			35 24 62 57 81 34 36 12 63 24
2			72 25 42 25 64 14 24 74 84 15
3			48 37 62 14 56 94 51 76 11 21
4			26 26 73 83 15 89 89 21 44 53
5			62 26 37 26 15 37 24 61 54 13
;

param:   e c :=
1		35 175
2		32 126
3		38 110
4		38 92
5		41 155
;

end;

