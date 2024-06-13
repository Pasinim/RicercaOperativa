
param nH := 10;
param nB := 20;
set R := 1..nH;
set C := 1..nB;
param q{R, C}; #matrice dei dislivelli
param c := 0.5; #Costo unitario per spostare 1m3 di terra ad 1m di distanza
param m := sum {b in C, h in R} q[h,b] / (nH * nB);
param d {i in R, j in C, r in R, z in C} := sqrt((i-r)^2+(j-z)^2);	# Distanza tra celle


var x{R, C, R, C} >= 0; #Quantita di terra da spostare da hb a hb [m3]


s.t. piallamento {w in R, z in C}:
	sum {i in R, y in C} x[i,y,w,z]+q[w,z] - sum {i in R, y in C} x[w,z,i,y] = m;

minimize costo:
	sum {i in R, j in C, r in R, z in C} c * x[i,j, r, z]*d[i,j,r,z];

data;
param q :
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 :=
1 -5 -4 -3 -2 -1 0 -1 -1 -1 0 1 1 1 2 3 4 3 3 4 5
2 -5 -4 -3 -2 -1 0 0 0 0 1 2 1 0 1 2 3 2 2 3 4
3 -4 -3 -3 -2 -1 0 1 0 1 0 1 0 -1 0 1 2 1 1 2 3
4 -4 -3 -2 -2 -1 0 1 0 1 1 1 0 -1 -1 0 1 0 0 1 2
5 -3 -2 -2 -2 -1 0 1 0 1 1 1 1 0 0 1 0 -1 -1 0 1
6 -2 -2 -2 -1 -1 0 1 1 1 2 2 2 1 0 0 -1 -2 -2 -1 0
7 -1 -1 -1 0 0 1 2 2 2 3 3 3 2 1 0 -1 -2 -3 -2 -1
8 0 0 -1 0 1 2 3 3 3 4 4 4 3 2 1 0 -1 -2 -3 -2
9 1 1 0 1 2 3 4 4 4 5 5 5 4 3 2 1 0 -1 -2 -3
10 2 2 1 2 3 4 5 5 5 6 6 6 5 4 3 2 1 0 -1 -2;
end;


