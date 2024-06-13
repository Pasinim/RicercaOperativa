
param n;
set P := 0..n; #Insieme dei punti da visitare
param m{P}; #Finestre temporali per ogni punto 
set F{p in P} := 1..m[p]; #insieme indicizzato delle finestre temporali
param s{p in P, F[p]}; #istante di inizio per ogni finestra teporale
param e{p in P, F[p]}; #istante di fine per ogni finestra teporale
param time{p in P: p > 0};

var t{P}; #indica l'istante di visita per ogni punto P
var x{p in P, F[p]} binary; #Indica per ogni punto P la finestra scelta

s.t. visitaTutti {p in P}:
	sum {f in F[p]} x[p,f] = 1;
	
s.t. istanteDiArrivo {p in P}:
	sum{f in F[p]} x[p,f] * s[p,f] <= t[p];
	
s.t. istanteDipartenza {p in P}:
	sum{f in F[p]}  x[p,f] * e[p,f] >= t[p];

	
#gli istanti di visita di punti consecutivi devono essere non-decrescenti e distanziati almeno del tempo di viaggio
s.t. visitaConsecuitiva{i in P, j in P: i>j}:
	t[i] >= t[j] + time[i];
	
	# Tempi di visita coerenti con i tempi di viaggio
#s.t. Tempi {p in P: p>0}:
 # t[p] >= t[p-1] + time[p];
  
minimize z: t[n] - t[0];
	
data;
param n := 5;
param s:=
[0,1] 0
[1,1] 68
[1,2] 148
[1,3] 200
[2,1] 200
[2,2] 264
[2,3] 320
[3,1] 215
[3,2] 264
[3,3] 332
[3,4] 412
[4,1] 312
[4,2] 400
[4,3] 464
[5,1] 460;



param e:=
[0,1] 200
[1,1] 112
[1,2] 176
[1,3] 220
[2,1] 244
[2,2] 276
[2,3] 344
[3,1] 235
[3,2] 296
[3,3] 368
[3,4] 420
[4,1] 344
[4,2] 416
[4,3] 504
[5,1] 560;



param time :=
1	48
2	80
3	72
4	88	
5	52;

param m :=
0	1
1	3
2	3
3	4
4	3
5	1
;


end;


