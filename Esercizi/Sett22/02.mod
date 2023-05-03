#DATI
set P;  
set F;
param Profitto {F};
param ProdMax {P};
param Produzione {F, P}; #{righe, colonne}


#VARIABILI
var x {F} >= 0; #devo determinare la quantità da acquistare per ogni fornitore (non negative) [kg]

#VINCOLI
#il vincolo è la produzione massima per ogni tipo di prodotto [Kg]
subject to Max_Prod {j in P}: 
	sum {i in F} x[i] * Produzione[i, j] <= ProdMax[j];
	#la quantità prodotta totale si calcola andando a sommare la quantità prodotta per ciascun fornitore

#OBIETTIVO
#massimizzare il profitto [eur]
maximize z:
	sum {i  in F} x[i] * Profitto[i];

####
data;

set P := A B C;
set F := Forn1 Forn2;

param Profitto :=
Forn1	0.02
Forn2	0.03
;

param ProdMax :=
A	6000
B	4000
C	8000
;

param Produzione :
		A	B	C :=
Forn1	.2	.3	.2
Forn2	.3	.1	.3
;

end;

