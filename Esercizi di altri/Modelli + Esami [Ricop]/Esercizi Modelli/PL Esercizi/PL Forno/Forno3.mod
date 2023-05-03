#Ultima domanda dell'esercizio Forno: bisogna scegliere uno dei prodotti da vendere a metà prezzo, senza che la produzione ottima sia modificata e minimizzando la perdita di guadagno
#RISPOSTA: come si poteva ipotizzare, conviene mettere in sconto il prodotto 3, dato che è quello che influisce meno sulla funzione obbiettivo. 

#DATI
param nP;		#numero dei prodotti 
set P:=1..nP;	#insieme dei prodotti
param t{P};		#tempo di cottura dei prodotti [h/Kg]
param s{P};		#spazio occpato nel forno [mq/Kg]
param pv{P};	#prezzo di vendita del prodotto [€/Kg]
param sf;		#lo spazio disponibile del forno [mq]
param tu;		#tempo di utilizzo del forno [h]
param pmin{P};	#la produzione minima di prodotto [Kg]

param x{P};		#produzione ottima

#VINCOLI

#devono essere rispettate le soglie minime
subj to LowerBound{p in P}: x[p]>=pmin[p];

#non si può produrre qualcosa il doppion rispetto ad un altro prodotto
subj to Double{p1 in P, p2 in P: p1<>p2}: x[p1] <= 2 * x[p2];

#bisogna rispettare i limiti di spazio e tempo del forno
subj to Limit: sum{p in P} x[p] * t[p] * s[p]<= sf * tu;

#OBIETTIVO
#massimizzare il profitto
maximize z: sum{p in P} x[p] * pv[p];

data;
param nP:=4;
param sf:=4;
param tu:=6;

param x:=
1	5
2	5
3	3
4	3;

param t:=
1    1
2    3
3    1.5
4    2;

param s:=
1    1
2    0.2
3    1.5
4    1.5;

param pmin:=
1       5
2       2
3       3
4       2;

param pv:=
1   2.50
2   4.00
3   1.00			#Conviene dimezzare questo prezzo (in origine 2 €/Kg, dato che offre il contributo minore alla funzione obiettivo)
4   5.50;





end;
