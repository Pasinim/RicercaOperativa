param nG := 31;
set G := 1..nG;
param start{G};
param endTime{G};
param auto := 4;
set A := 1..auto;
param cFisso := 20;
param cVar := 40; #e/gg

var x{A, G} binary; #indica se l'auto è noleggiata il giorno G

s.t. sovrapposizione1 {g in G}:
	sum {a in A} x[a,g] <= auto;
	
s.t. sovrapposizione2 {i in G, j in G: (i<j) and (start[i] < endTime[j]) and (start[j] < endTime[i]) }:
	x[i] + x[j] <= 1;
	

maximize profitto {a in A};
	cFisso + sum {g in G} x[a, g] * (endTime[ 

data;
param : start endTime :=
1 2 5
2 2 10
3 2 12
4 2 13
5 3 8
6 3 24
7 5 7
8 5 15
9 7 12
10 7 14
11 7 28
12 10 15
13 12 19
14 14 26
15 14 30
16 16 20
17 16 27
18 16 33
19 18 30
20 21 22
21 21 26
22 25 25
23 25 26
24 25 30
25 28 30
26 29 34
27 29 35
28 30 30
29 30 32
30 30 34
31 30 35
;
end;



