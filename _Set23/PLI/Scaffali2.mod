param nL := 15;
set L := 1..nL;
param h{L};
param lung{L};
param maxLung := 50;
set S := 1..nL; #il numero di scaffali è al massimo pari al numero di libri (un libro per scaffale)


var x{L, S} binary;#1 sse L è assegnato a S
var hScaff{S} >= 0; #Altezza dello scaffale S

subj to lungTot {s in S}:
	sum { l in L} lung[l] * x[l,s] <= maxLung;
subj to ass {l in L}:
	sum {s in S} x[l, s] >= 1;
	
subj to def_hScaff {s in S}:
	hScaff[s] >= sum {l in L} x[l,s] * h[l];

minimize z:
	 sum {s in S} hScaff[s];


data;

param: lung h :=
1 10 2
2 22 20
3 20 10
4 5 10
5 8 8
6 7 12
7 15 18
8 11 9
9 9 15
10 10 13
11 2 8
12 3 7
13 12 7
14 5 10
15 1 5
;

end;



