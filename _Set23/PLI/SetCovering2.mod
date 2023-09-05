param nL := 10;
param nU := 5;
set L := 1..nL;
set U := 1..nU;
param c{L};
param mat{U, L};

var x{L} binary; #Inidica se U è servito da L

subj to ass_utente {u in U}:
	sum {l in L} x[l] * mat[u, l] >= 1;

	
minimize z {u in U}:
	sum {l in L} x[l] * c[l] ;

data;
param mat : 1 2 3 4 5 6 7 8 9 10 :=
1 1 0 0 0 1 1 1 0 1 1
2 0 0 0 1 1 0 0 0 1 0
3 0 0 0 0 1 1 0 0 0 0
4 0 0 0 0 0 0 1 1 1 0
5 1 1 1 0 0 0 0 1 1 1
;

param c :=
1	205
2	311
3	450 
4	274
5	321
6	469
7	327
8	631
9	750
10	400;
end;

