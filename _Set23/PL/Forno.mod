
param nP := 4;
set P := 1..nP; #insieme dei prodotti
param t{P}; #Tempo di produzione [h];
param aTot := 4; #[m2]
param tTot := 6; #[h]
param s{P}; #Spazio occupato[m2]
param produzione{P}; #Produzione minima[k]
param profitto{P}; #[e/kg]

var x{P} >= 0; #[kg] prodotti
var h >= 0; #Straordinari


subj to prodMin {p in P}:
	x[p] >= produzione[p];

#Nessun prodotto deve essere sfornato in quantita superiore al doppio di un altro
subj to a {i in P, j in P: i<>j}:
	x[i] <= 2*x[j];

#subj to areaTotale:
	#sum {p in P} s[p] *x[p] <= aTot;
#subj to tempoTotale: 
#	sum {p in P} t[p] * x[p] <= tTot;

subj to limiti:
	sum {p in P} x[p] * t[p] *s[p] <= ( aTot * tTot ) + h;

maximize guadagno:
	sum {p in P} x[p] * profitto[p] - 12 * h;

data;
param t:=
1 1
2 3 
3 1.5
4 2
;

param s :=
1 1 
2 .2
3 1.5
4 1.5
;

param profitto :=
1 2.5
2 4
3 2
4 5.5
;

param produzione :=
1 5
2 2 
3 3 
4 2
;


end;
