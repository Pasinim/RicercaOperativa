param nV := 30;
set V := 1..nV;
set E within V cross V;

var x{V} binary; #1 sse la sentinella è presente nell'incorcio.
subj to coperatura {i in V}:
	x[i] + sum{j in V: (i, j) in E or (j, i) in E} x[j] >=1;

minimize z:
	sum {i in V} x[i];

data;
set E :=
1 2,
1 3,
1 4,
2 30,
3 13,
3 16,
4 5,
4 6,
4 24,
5 6,
5 8,
5 13,
6 7,
7 9,
7 10,
8 9,
8 12,
8 13,
8 27,
9 10,
9 27,
10 11,
11 23,
11 29,
12 13,
12 18,
12 19,
12 27,
13 14,
14 15,
14 18,
15 16,
15 17,
18 19,
18 28,
19 20,
19 28,
20 21,
20 22,
20 29,
24 25,
24 26,
27 29;

end;
