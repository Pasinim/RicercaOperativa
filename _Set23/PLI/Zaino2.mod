param nO := 10;
set O := 1..nO;
param vol{O};
param val{O};
param c := 100;

var x{O} binary;

subj to max_cap:
	sum {i in O} vol[i] * x[i] <= c;
maximize z:
	sum {i in O} val[i] * x[i];

data;
param: vol val :=
	1 8 4
	2 9 6
	3 13 40
	4 24 15
	5 28 20
	6 36 20
	7 41 21
	8 57 38
	9 68 46
	10 70 56
;

end;
