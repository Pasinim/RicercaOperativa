#Marco Pasini - 922742
#Dati
set M;	#insieme magazzini
set D;	#Insieme distributori
param dis {M}; #disponibilita [#libri]
param r {D}; #richieste distributori [#libri]
param c {M, D}; #capacità di trasporto [#libri]
param p {M, D}; #prezzo di spedizione [$/libro]

#Variabili
var x {M, D} >= 0; #numero di libri da trasportare da un magazzino al distributore

#Vincoli
subj to capacita_trasporto {m in M, d in D}:
	x[m,d] <= c[m,d];

subj to q_max {m in M} :
	sum {d in D} x[m,d] <= dis[m];
	
subj to richieste { d in D} : 
	sum {m in M} x[m,d]  >= r[d];

#Ob: Minimizzare i costi di spedizione
minimize z  : 
	sum {m in M, d in D} x[m,d] * p[m,d];

data;
set M := TO NA PA;
set D := MI BO RM BA;

param dis :=
	TO		1200
	NA		1400
	PA		 800 
;

param r :=
	MI		1000
	BO		1200
	RM		 700 
	BA		 500
;

param c :	MI	  	BO	  	RM	  	BA := 
	TO	 	500		1000	1000	1000
	NA	 	500	 	800	 	800	 	800
	PA	 	800	 	600	 	600	 	600
;

param p :		MI	 	BO	 	RM	 	BA :=
		TO	 	7.5	 	2.6	 	1.7	 	1.6
		NA	 	6.4	 	2.2	 	2.0	 	1.5
		PA	 	5.8	 	2.4	 	1.8	 	1.4
	;

end;
