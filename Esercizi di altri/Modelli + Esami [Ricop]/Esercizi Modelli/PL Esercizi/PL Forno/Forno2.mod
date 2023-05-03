#seconda domanda dell'esercizio Forno: bisogna stabilire se e quanto conviene fare ore di straordinario, che costano 12€ l'una
#RISPOSTA: non conviene farne, si può vedere infatti che te vale zero; il guadagno sale solo per i primi minuti, ha quindi senso solo se è possibile fare una frazione di straordinario. 

#DATI
param nP;		#numero dei prodotti 
set P:=1..nP;	#insieme dei prodotti
param t{P};		#tempo di cottura dei prodotti [h/Kg]
param s{P};		#spazio occpato nel forno [mq/Kg]
param pv{P};	#prezzo di vendita del prodotto [€/Kg]
param sf;		#lo spazio disponibile del forno [mq]
param tu;		#tempo di utilizzo del forno [h]
param pmin{P};	#la produzione minima di prodotto [Kg]

param ce;		#il costo orario extra per il garzone [€/h]

#VARIABILI
var x{P} integer;		#le quantità da produrre di ogni Prodotto [Kg]
var te integer;			#il tempo extra in cui rimane il garzone [h]

#VINCOLI

#devono essere rispettate le soglie minime
subj to LowerBound{p in P}: x[p]>=pmin[p];

#non si può produrre qualcosa il doppion rispetto ad un altro prodotto
subj to Double{p1 in P, p2 in P: p1<>p2}: x[p1] <= 2 * x[p2];

#bisogna rispettare i limiti di spazio e tempo del forno
subj to Limit: sum{p in P} x[p] * t[p] * s[p]<= sf * (tu + te);

#OBIETTIVO
#massimizzare il profitto
maximize z: sum{p in P}(x[p] * pv[p]) - te*ce;

data;
param nP:=4;
param sf:=4;
param tu:=6;

param ce:=12;

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
3   2.00
4   5.50;





end;
