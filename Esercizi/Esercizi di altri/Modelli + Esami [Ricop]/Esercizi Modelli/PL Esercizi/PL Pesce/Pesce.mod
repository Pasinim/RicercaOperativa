#ESERCIZIO PL 25.1 - Pesce

#DATI
set P:=1..3;				# Insieme dei pesci
param prezzo{P};			# Prezzo di vendita del pesce [€/Kg]
param V{P};					# Volume occupato nella cella frigorifera [cc/Kg]
param cap;					# Capacità di trasporto [cc]
param t{P};					# Tempo di preparazione e confezionamento [minuti/Kg]
param tmax;					# Tempo disponibile [minuti]
param qmax{P};				# Quantità massime acquistabili [Kg/giorno]

#VARIABILI
var x{P} >= 0;				# Le quantità di pesce da prendere [Kg]

#VINCOLI

#non si può eccedere la capacità di trasporto [cc]
subject to Capacity: sum {p in P} x[p] * V[p] <= cap;

#bisogna rispettare il tempo massimo [minuti]
subject to Time: sum {p in P} x[p] * t[p] <= tmax;

#combinazione lineare delle massime quantità acquistabili
subject to Upper {p in P}:
	x[p]/qmax[p] <= 1;

#OBIETTIVO
#massimizzare il ricavo giornaliero [€]
maximize z: sum{p in P} x[p] * prezzo[p];

####################################
data;

param prezzo :=
1       10.00
2        7.50
3       20.00;

param V :=
1       10000
2        7500
3       12500;

param cap := 50000;

param t :=
1       11
2        8
3       10;

param tmax := 45;

param qmax :=
1           40
2           60
3           60;
#I limiti si riferiscono alle quantità massime per ogni prodotto se il prodotto fosse l'unico acquistato.

end;
