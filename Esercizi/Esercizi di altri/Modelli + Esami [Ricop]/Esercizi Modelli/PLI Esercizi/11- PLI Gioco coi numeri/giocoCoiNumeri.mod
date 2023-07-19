# ESERCIZIO Gioco coi numeri

# Risultato: 9 + 8 + 7 + 654 + 321 = 999

#DATI
param nP;								# Numero di posizioni
set P := 1..nP;							# Insieme delle posizioni
param c{P};								# Le cifre (associa una cifra ad ogni posizione)
param N;								# La soglia
param nW := ceil(log(N)/log(10));		# Numero di pesi
set W := 0..nW;							# Insieme di pesi che va da 0 al numero di pesi

#VARIABILI
var x{P,W} binary;						#variabili di assegnamento binaria, una riga per ogni posizione, una colona per ogni peso
var n <=N;								#variabile che rappresenta il numero, deve essere minore della soglia N (nell'esempio N = 1000)

#VINCOLI
#Vincolo di assegnamento
subject to Assign {p in P}:
	sum { w in W} x[p,w] = 1;

#Vincolo sulle posizioni dei pesi
subject to PosizioneDeiPesi {p in P, w in W: (p<nP) and (w>0)}:
	x[p,w] <= x[p+1, w-1];

#Vincolo sull'ultima posizione, ultima posizione deve essere per forza un unita'
subject to UltimaPosizione: 
	x[nP,0] = 1;

#Valore del numero
subject to Numero:
	n = sum {p in P} c[p] * sum {w in W} 10^w  * x[p,w];

#OBIETTIVO
maximize z: n;


###########################
data;

param nP := 9;
param c :=
1	9
2	8
3	7
4	6
5	5
6	4
7	3
8	2
9	1;

param N := 1000;

end;
