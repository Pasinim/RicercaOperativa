set P := 1..4; #Insieme dei prodotti
param superficie := 4; #[mq]
param utilizzo_forno := 6;
param t{P};
param s{P};
param prod_min{P};
param prezzo{P}; #Prezzo di vendita

#3. Dovendo fare un’offerta speciale per attirare i clienti, che consiste nel ridurre al 50% il prezzo di
# uno dei tipi di prodotto, quale scelta è meglio fare se non si vuole che cambi la produzione ottima?

var x{P} >= 0; #Quantità prodotta per ogni alimento [kg]

s.t. limiteProdotti {i in P, j in P: i<>j}:
	x[i] <= 2*x[j];
s.t. produzioneMin {p in P}:
	x[p] >= prod_min[p];

s.t. spazioTempoLimite:
	sum {p in P} x[p] * s[p] * t[p] <= utilizzo_forno * superficie;

maximize z:
	sum {p in P} x[p] * prezzo[p];

data;
param t := 
1 1
2 3
3 1.5
4 2
;

param s := 
1 1 
2 0.2
3 1.5
4 1.5
;
param prod_min := 
1 5
2 2 
3 3
4 2
;
param prezzo :=
1 2.5
2 4
3 2
4 5.5
;

end;
