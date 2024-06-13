param nV := 5;
set V := 1..nV;
param peso {V, V};

var x{V, V} binary; #x(i,j) = 1 se i precede j

s.t. orientamento {i in V, j in V}:
	x[i,j] + x[j,i] = 1;
	
s.t. no_cicli {i in V, j in V, k in V: (i<>j) and (j<>k) and (k<>i)}:
	x[i,j] + x[j,k] + x[k,i] <= 2;

minimize pesoTot :
	sum {i in V, j in V: (i<>j)} (peso[i,j] * x[i,j]);

data;

param peso: 1	2	3	4	5 :=
1 0 17 62 28 51
2 25 0 38 42 30
3 22 40 0 20 17
4 48 32 10 0 35
5 31 40 23 15 0;

end;

