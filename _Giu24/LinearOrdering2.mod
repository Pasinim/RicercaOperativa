param nV := 7;
set V  := 1..nV;
param w{V,V};

var x{V, V} binary;

s.t. noCiclo {i in V, j in V, k in V: (i<>j) and (j<>k) and (k<>i)}:
        x[i,j] + x[j,k] + x[k,i] <= 2;
s.t. orientamento {i in V, j in V: (i<>j)}:
        x[i,j] + x[j,i] = 1;

#minimizzare la somma dei pesi degli archi (i,j) tali che i precede j nell’ordinamento dei nodi.
minimize pesoMinimo:
        sum {i in V, j in V: (i<>j)} w[i,j] * x[i,j];


data;

param w: 1  2   3   4   5   6   7 :=
1 0  68  81  23  45  20  37
2 12   0  25  51  57  89  78
3 34  27   0  12   9  71  20
4 95  55  42   0   8  23  44
5 60  60  51  34   0   2  40
6 93  22  48  45  24   0  77
7 75  64  36  25  16  21   0;

end;
