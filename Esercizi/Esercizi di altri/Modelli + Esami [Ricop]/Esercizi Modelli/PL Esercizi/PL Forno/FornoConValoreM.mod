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
var m >=0;			#valore m

#VINCOLI

# m e' maggiore o uguale a tutti e 4 i valori delle variabili x
subject to valoreM_uno {p in P}:
	m >= x[p];
# m e' minore o uguale al doppio di ciascuna di esse
subject to valoreM_due {p in P}:
	m <= 2 * x[p];

#Vincoli sulla produzione minima di ogni prodotto
subject to produzione_minima {p in P}: x[p] >= pmin[p];

#nessun prodotto deve essere sfornato in quantità superiore al doppio di un altro
subject to Double1 {p in P}: 2 * x[p] - m >= 0;
subject to Double2 {p in P}: x[p] - m <= 0;

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
