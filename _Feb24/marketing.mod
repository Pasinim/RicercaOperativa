 reset;
 param nP;
 param nM;
 param nC;
 set C := 1..nC;
 set P := 1..nP;
 set M := 1..nM;
 param nI{P}; #Intervalli per ogni prodotto
 set K{p in P} := 1..nI[p];#numero di intervalli per ogni prodotto
 param dispM{M};
 param dispC{C};
 param consumiM{M,P};
 param consumiC{C,P};
 param startI {p in P, K[p]}; #Valore iniziale per ogni intervallo
 param prezzoI{p in P, K[p]}; #Prezzo per ogni intervallo
 
 var x{p in P, K[p]} >= 0, integer; #Quantita prodotti
 
 s.t. consumi1 {m in M}: 
 	sum {p in P, k in K[p]} consumiM[m,p] * x[p,k] <= dispM[m];
  s.t. consumi2 {c in C}: 
 	sum {p in P, k in K[p]} consumiC[c,p] * x[p,k] <= dispC[c];
 s.t. def_intervallo {p in P, k in K[p]: k < nI[p]}:
 	x[p,k] <= startI[p,k+1] - startI[p,k];
 maximize z:
sum {p in P, k in K[p] } (x[p,k] * prezzoI[p,k]);
 
 data;
 param nP := 3;
 param nM := 2;
 param nC := 2;
 param nI :=
1	3
2	3
3	4
;
 param startI :
 	1	2	3	4 :=
 1	0	200	501 .
 2	0	150	601	.
 3 	0	50	150	301;
 
param prezzoI :
	1	 2	 3	 4 :=
1	1000 900 750 .
2	800	750	500	.
3	700	650	600	400;

param dispM :=
       1     37000
       2     32000;
      
 param dispC :=
 1	40000
 2	47000;
 param consumiM :
 	1	2	3 :=
1 	18    12    12
2   15    12    11;
param consumiC :
	1	2	3 :=
1   18  18  13
2   25  18  12;
 	
 
 solve;
 display x, z;
 end;

