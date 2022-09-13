set N := 0..9;
set P := 0..9;

param A {N, P}; #due cifre in posizione errata
param B {N, P}; #due  // in posizone corretta
param C {N, P}; #una // in posizione esatta
param D {N, P}; #6 in pos errata
param sA := 2; #sbagliati a
param sB := 8;
param sC := 9;
param sD := 6;
#Var
var x {N, P} binary;
#Vincoli
subj to Assign1 {n in N}:
	sum { p in P } x[n,p] = 1;
subj to Assign2 {p in P}:
	sum {n in N} x[n,p] = 1;

subj to SbagliateA:
	sum {p in P, n in N} A[n,p] * x[n,p] = 10 - sA;
subj to SbagliateB:
	sum {p in P, n in N} A[n,p] * x[n,p] = 10 - sB;
subj to SbagliateC:
	sum {p in P, n in N} A[n,p] * x[n,p] = 10 - sC;
subj to SbagliateD:
	sum {p in P, n in N} A[n,p] * x[n,p] = 10 - sD;
#Ob 


data;
#cifre su righe e posizioni su colonna 
param A : 0 1 2 3 4 5 6 7 8 9 := 
0		  0 0 0 0 0 0 0 1 0 0 
1		  0 0 0 0 1 0 0 0 0 0 
2		  1 0 0 0 0 0 0 0 0 0 
3		  0 0 0 1 0 0 0 0 0 0 
4		  0 1 0 0 0 0 0 0 0 0 
5		  0 0 1 0 0 0 0 0 0 0 
6		  0 0 0 0 0 6 0 0 0 0 
7		  0 0 0 0 0 0 0 0 0 1 
8		  0 0 0 0 0 0 0 0 1 0 
9		  0 0 0 0 0 0 1 0 0 0 
;

param B : 0 1 2 3 4 5 6 7 8 9 := 
0		  0 0 0 0 0 1 0 0 0 0 
1		  0 0 0 1 0 0 0 0 0 0 
2		  0 0 0 0 2 0 0 0 0 0 
3		  0 0 0 0 0 0 0 0 1 0 
4		  0 0 0 0 0 0 0 1 0 0 
5		  0 0 0 0 0 0 0 0 0 1 
6		  1 0 0 0 0 0 0 0 0 0 
7		  0 0 7 0 0 0 0 0 0 0 
8		  0 8 0 0 0 0 0 0 0 0 
9		  0 0 0 0 0 0 1 0 0 0 
;

param C : 0 1 2 3 4 5 6 7 8 9 := 
0		  0 1 0 0 0 0 0 0 0 0 
1		  0 0 0 0 1 0 0 0 0 0 
2		  0 0 0 1 0 0 0 0 0 0 
3		  1 0 0 0 0 0 0 0 0 0 
4		  0 0 0 0 0 0 1 0 0 0 
5		  0 0 0 0 0 0 0 1 0 0 
6		  0 0 0 0 0 0 0 0 0 1 
7		  0 0 0 0 0 0 0 0 1 0 
8		  0 0 0 0 0 1 0 0 0 0 
9		  0 0 1 0 0 0 0 0 0 0 
;

param D : 0 1 2 3 4 5 6 7 8 9 := 
0		  0 0 0 0 1 0 0 0 0 0 
1		  0 0 1 0 0 0 0 0 0 0 
2		  1 0 0 0 0 0 0 0 0 0 
3		  0 0 0 1 0 0 0 0 0 0 
4		  0 1 0 0 0 0 0 0 0 0 
5		  0 0 0 0 0 0 0 1 0 0 
6		  0 0 0 0 0 0 0 0 0 1 
7		  0 0 0 0 0 0 0 0 1 0 
8		  0 0 0 0 0 1 0 0 0 0 
9		  0 0 0 0 0 0 1 0 0 0 
;


end;
