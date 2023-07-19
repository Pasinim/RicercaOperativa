#Esercizio Forno

#DATI
set P; #set dei prodotti da produrre 
param tempo{P}; #[h] tempo di produzione per ogni prodotto
param spazio{P}; #[mq/Kg] spazio occupato da ogni kg di prodotto
param minimo{P}; #[Kg] minima quantità da produrre per ogni prodotto
param valore{P}; #[€/Kg] prezzo di vendita per prodotto
param tempoTot; #[h] tempo disponibile per il forno
param spazioTot; #[mq] spazio disponibile per il forno

#VARIABILI

var p{P} >= 0;	# Produzione in KG totale per prodotto
var h >= 0;

#VINCOLI

s.t. spazioDisponibile:
	sum{j in P} p[j]*spazio[j]*tempo[j] <= spazioTot*(tempoTot+h);

s.t. produciAlmeno{i in P}:
	 p[i] >= minimo[i];

s.t. tempoUsato:
	 sum{i in P} p[i]*spazio[i]/spazioTot*tempo[i] <= tempoTot+h;

s.t. doppioDiUnAltro{i in P, j in P : i <> j}:
	 p[i]*2 >=p[j];

s.t. tempoAggiuntivo:
	h = 0.08750;

#OBIETTIVO

maximize z : sum{j in P} p[j]*valore[j] - h*12;

###############

data;
set P:= Pane Biscotti Focacce Paste;

param tempo:=
Pane 1
Biscotti 3
Focacce 1.5
Paste 2;
param spazio:=
Pane 1
Biscotti 0.2
Focacce 1.5
Paste 1.5;
param minimo:=
Pane 5
Biscotti 2
Focacce 3
Paste 2;
param valore:=
Pane 2.50
Biscotti 4.00
Focacce 2.00
Paste 5.50;
param spazioTot:=4;
param tempoTot:=6;
end;
