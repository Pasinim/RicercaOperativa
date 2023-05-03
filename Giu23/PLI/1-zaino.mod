

set nO := 1 ..10;
param c;
param volume {nO};
param valore {nO};

#var
var x{nO} >= 0, binary;

subj to cMax:
	sum {i in nO} x[i] * volume[i] <= c;

maximize z:
	sum {i in nO} x[i] * valore[i];


data;
param c := 100;
param volume :=
1 8
2 9
3 10
4 24
5 28
6 36
7 41
8 57
9 68
10 70
;

param valore :=
1 4
2 6
3 40
4 15
5 20
6 20
7 21
8 38
9 46
10 56

;


end;
