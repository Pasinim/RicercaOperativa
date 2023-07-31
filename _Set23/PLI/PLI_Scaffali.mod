param nL := 15;
#Il numero massimo di scaffali è pari al numero di libri
param sMax := nL;
set L := 1..nL;
set S := 1..sMax;
param w{L};
param h{L};
param maxW := 50;

var x{L, S} binary;
var y{S} >= 0; #altezza di ognio scaffale

#Ogni libro deve essere su uno scaffale
subj to libri {l in L}:
	sum {s in S} x[l,s] >= 1;
subj to maxLungh {s in S}:
	sum {l in L} x[l,s] * w[l] <= maxW;
#subj to capacitaScaffale {s in S}:
#	sum {l in L} x[l, s]*h[l] <= y[s];

subj to hScaffale { s in S}:
	y[s] >= sum {l in L} x[l,s] * h[l];

minimize z:
	sum {s in S} y[s];
data;
param : w h :=
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

