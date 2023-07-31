param N := 10;
set p := 1..N;
set m := 1..N;
param mtx{p,m};


#Dato un insieme di N persone e un insieme di N mansioni, conoscendo il costo
#di attribuzione di ogni mansione ad ogni persona, decidere come attribuire una
#mansione ad ogni persona per minimizzare il costo complessivo.
var x{p, m} binary;

subj to mansione {i in p}:
	sum {j in m} x[i,j] = 1;
subj to persona {j in m}:
	sum {i in p} x[i,j] = 1;
	
minimize z:
	sum {i in p, j in m} mtx[i,j] * x[i,j];
		
data;
param mtx : 1 2 3 4 5 6 7 8 9 10 :=
1 35 24 62 57 81 34 36 12 63 24
2 72 25 42 25 64 14 24 74 84 15
3 48 37 62 14 56 94 51 76 11 21
4 26 26 73 83 15 89 89 21 44 53
5 62 26 37 26 15 37 24 61 54 13
6 37 37 76 3 47 52 25 38 61 50
7 59 98 84 26 47 73 51 54 51 48
8 60 54 95 50 45 6 82 33 61 72
9 62 42 68 74 73 12 36 37 38 50
10 2 52 62 38 95 60 88 25 26 84
;

end;

