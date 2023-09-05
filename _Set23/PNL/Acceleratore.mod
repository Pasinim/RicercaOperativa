param nC := 16;
param nA := 2;
set A := 1..nA;
set C := 1..nC;
param xmin = -100;
param xmax = 100;
param ymin = -50;
param ymax = 50;
param x{C};
p aram y{C};
param r{C};

var xc {a in A};
var yc {a in A};
var rc {a in A} >= 0;

#Il raggio non deve superare i limiti

#Non sovrapposizione delle aree abitate
subj to sovrapposizione {i in C, a in A}:
	(x[i] - xc[a])^2 + (y[i] - yc[a])^2 >= (r[i] + rc[a])^2;
subj to raggioAnelli:
	rc[1]= rc[2];
 
subj to anelli_uguali1{j in A}:
	xc[j] - r[j] >= xmin;
subj to anelli_uguali2{j in A}:
	xc[j] + r[j] <= xmax;
subj to anelli_uguali3{j in A}:
	yc[j] - r[j] >= ymin;
subj to anelli_uguali4{j in A}:
	yc[j] + r[j] <= ymin;
#Anelli tangenti (per formare un 8)



#OB: massimizzare circonferenza (raggio)
maximize raggio {i in A}:
	rc[i];

data;
param : x y r :=
1 -80 30 5
2 -87 -15 2
3 -81 -35 4
4 -59 25 4
5 -25 -30 4
6 -33 -15 2
7 -12 1 5
8 - 6 43 5
9 0 -24 8
10 10 10 9
11 20 -15 2
12 30 25 2
13 41 -31 10
14 55 15 5
15 69 -10 10
16 80 28 9;
 end;
 