# Esercizio Miscelazione

# Dati

param nS;								# Numero di sostanze.
param nP;								# Numero dei prodotti.
set sostanze := 1..nS;					# Insieme delle sostanze.
set prodotti := 1..nP;					# Insieme dei prodotti.
param sostanzeDisponibili {sostanze};	# Risorse disponibili per sostanza [barili/giornalieri].
param costoSostanze {sostanze};			# Costo per sostanza [dollari/barile].
param ricaviProdotti {prodotti};		# Ricavi per prodotto [dollari/barile].

# Variabili

var produzione {sostanze, prodotti}		# Sostanza per ogni prodotto [barile].

# Vincoli

subject to Max_produzione {j in sostanze}:
	sum 

# Obiettivo


#############

data;

param nS := 4;
param nP := 3;
param sostanzeDisponibili :=
1 3000
2 2000
3 4000
4 1000;
param costoSostanze :=
1 3
2 6
3 4
4 5;
param ricaviProdotti :=
1 5.5
2 4.5
3 3.5;

end;
