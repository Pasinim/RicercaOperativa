param C := 100;
set o := 1..10;
param v{o}; #Valore
param s{o}; #Spazio occupato

var x{o} binary;

subj to capacitaMax:
	sum {i in o} x[i] * s[i] <= C;

maximize valore:
		sum {i in o} x[i] * v[i];
		
data;
param : s v :=
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
