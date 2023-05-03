
param nL := 10;
set L := 1..nL;
param nU := 5;
set U := 1..nU;
param s{U, L} binary;
param costo {L};

var x {L} binary;

subj to copertura {i in U}:
	sum {j in L } x[j] * s[i, j] >=1;
minimize c :
	sum {j in L} x[j] * costo[j];

data;
param s :   1 2 3 4 5 6 7 8 9 10 :=
		1	1 0 0 0 1 1 1 0 1 1
		2	0 0 0 1 1 0 0 0 1 0
		3	0 0 0 0 1 1 0 0 0 0
		4	0 0 0 0 0 0 1 1 1 0
		5	1 1 1 0 0 0 0 1 1 1
;

param costo :=  
1 205
2 311 
3 450 
4 274 
5 321 
6 469 
7 327 
8 631 
9 750
10 400
;


end;

