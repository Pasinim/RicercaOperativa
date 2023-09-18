set S;
param p{S};
param budget := 80000;
param c{S};
param r{S};

var x{S} >= 0;
var deltaC >= 0;
var deltaR >= 0;

s.t. recessione:
	sum{s in S} x[s] * r[s] = deltaR;
s.t. crescita:
	sum{s in S} x[s] * c[s] = deltaC;
s.t. liquidita:
	sum{s in S} x[s] <= budget;
minimize z:
	sum{s in S} x[s] * c[s] - sum {s in S}x[s] * r[s] ;


#Ob: Minimizzare lo scenario peggiore (?)


data;
set S := A B C;
param p :=
A 50
B 75
C 90
;
param: c r  :=
A 5 1
B 8 0
C 12 -5
;
end;
