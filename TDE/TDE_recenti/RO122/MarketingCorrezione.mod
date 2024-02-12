param nP;                   # N. di prodotti
set P := 1..nP;             # Set di prodotti
param nR;                   # N. di risorse
set R := 1..nR;             # Set di risorse
param b {R};                # Quantità di risorse disponibili
param a {R,P};              # Coefficienti tecnologici [Kg/u]
param nK{P}; #Numero di intervalli per ogni prodotto
set K{p in P} := 1..nK[p];
param unita{p in P, K[p]}; #Unita di partenza per ogni intervallo
param prezzo{p in P, K[p]}; #Prezzo per ogni unita venduta

var x{p in P, K[p]} >= 0;
s.t. coefficienteTech{r in R}: 
	sum {p in P} a[r,p] * (sum{k in K[p]} x[p,k]) <= b[r];
s.t. intervalli{p in P, k in K[p]: k<nK[p]}: #con l'ultima condizione non sfora gli intervalli del prodotto 3
	unita[p,k+1] - unita[p,k]>= x[p,k];
maximize z:
	sum {p in P, k in K[p]} x[p,k] * prezzo[p,k];
data;
param nR := 4;
param nP := 3;
param b :=
1 37000
2 32000
3 40000
4 47000;
param a :
	1	2	3 :=
1	18	12	12
2 	15	12  11
3   18  18  13
4   25  18  12 ;
param nK :=
1	3
2	3
3	4;
param unita :
	1	2	3	4 :=
1	0	200	500 .	
2	0	150	600	.
3	0	50	150	300;

param prezzo:
	1	 2	 3	 4 :=
1	1000 900 750 .
2	800	750	500	.
3	700	650	600	400
;

end;

