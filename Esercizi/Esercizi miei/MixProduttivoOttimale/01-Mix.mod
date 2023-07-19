
# DATI
param nR; #numero reparti
param nP; #numero prodotti
set R := 1..nR; #insieme dei reparti
set P := 1..nP; #insieme dei prodotti
param b {R}; #vettore che contiene le risorse disponibili [oreUomo/Settimana] La graffa indica che il vettore ha tanti componenti quanti R
param c {P}; #profitti unitari[e/unità]
param a {R,P};	#tempi di lavorazione[oreUomo/unità]

#VARIABILI
var x {P} >= 0; #Produzione [unità/settimana] (avariabili non negative)



#VINCOLI
#vincolo sul massimo consumo di risorsa in ogni reparto [oreUomo/sett]
subject to Consumi {i in R}:
    sum {j in P} a[i,j] * x[j] <= b[i];

#OBIETTIVO
#massimizzare i profitti
maximize z: sum {j in P} c[j] * x[j];

#####
#nella seconda parte inserisco i valori numerici dei dati.
data;
param nR := 5;
param nP := 3; #perchè ho 5 reparti e 3 prodotti
param b := 
1	120
2	80
3	96
4	102
5	40;

param c :=
1	840
2	1120
3	1200;

param a : 	1 2 3 := #nome : indici di colonna. Per ciascuna delle colonne faccio elenco delle righe
1			3 2 1
2			1 2 3
3			2 0 0 
4			0 3 0
5			0 0 2;





end;
