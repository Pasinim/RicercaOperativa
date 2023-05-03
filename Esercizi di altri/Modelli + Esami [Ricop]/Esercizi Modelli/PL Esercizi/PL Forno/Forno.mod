#ESERCIZIO PL 16.3 - Forno

#DATI
param nP;			# Numero dei prodotti 
set P := 1..nP;		# Insieme dei prodotti (pane, biscotti, focacce, paste)
param t{P};			# Tempo di cottura dei prodotti [h/Kg]
param s{P};			# Spazio occupato nel forno da ogni prodotto [mq/Kg]
param pv{P};		# Prezzo di vendita del prodotto [€/Kg]
param sf;			# Lo spazio disponibile del forno [mq]
param tu;			# Tempo di utilizzo del forno [h]
param pmin{P};		# La produzione minima di prodotto [Kg]

#VARIABILI
var x{P} >= 0;		#le quantità da produrre di ogni Prodotto [Kg]

#VINCOLI

#vincoli sulla produzione minima di ogni prodotto
subject to produzione_minima {p in P}: x[p] >= pmin[p];

#nessun prodotto deve essere sfornato in quantità superiore al doppio di un altro
subject to Double {p1 in P, p2 in P: p1<>p2}: 
	x[p1] <= 2 * x[p2];

#bisogna rispettare i limiti di spazio e tempo del forno
#poiché il forno funziona per 6 ore ed è ampio 4 mq, le risorse disponibili consistono in 24 mq*h
subject to Limit: sum{p in P} x[p] * t[p] * s[p] <= sf * tu;

#OBIETTIVO
#massimizzare il profitto che si ottiene dalla vendita dei prodotti
maximize z: sum{p in P} x[p] * pv[p];

###########################
data;

param nP := 4;
param sf := 4;
param tu := 6;

param t :=
1    1
2    3
3    1.5
4    2;

param s :=
1    1
2    0.2
3    1.5
4    1.5;

param pmin :=
1       5
2       2
3       3
4       2;

param pv :=
1   2.50
2   4.00
3   2.00
4   5.50;

end;
