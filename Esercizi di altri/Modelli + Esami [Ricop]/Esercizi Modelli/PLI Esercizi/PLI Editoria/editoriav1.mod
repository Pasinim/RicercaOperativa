# ESERCIZIO 10 - PLI Editoria (ottimizzare solo il primo obiettivo z1)

#DATI
param nA;					# Numero articoli
set A := 1..nA;				# Insieme degli articoli
param p {A};				# Numero di pagine di ogni articolo
param u {A};				# Urgenza di ogni articolo (Numero asterischi)
param nF;					# Numero fascicoli
set F := 1..nF;				# Insieme dei fascicoli
param nP;					# Numero di pagine disponibili per fascicolo

#VARIABILI
var x {A,F} binary;			# Variabili di assegnamento: se quel articolo lo assegno a quel fascicolo o no
var U;						# Massimo numero di pagine occupate su un fascicolo
var L;						# Minimo numero di pagine occupate su un fascicolo


#VINCOLI

subject to Assegnamento {a in A}:
	sum{f in F} x[a,f] <= 1;

subject to Capacity {f in F}:
	sum {a in A} p[a] * x[a,f] <= nP;

subject to Urgenza {a in A}:
	sum {f in F} f * x[a,f] <= 4 - u[a];

#altro modo per scrivere l'ultimo vincolo
#subject to Urgenza {a in A: u[a]>=1}:
#	sum {f in F: f + u[a] <=4} x[a,f] = 1;

#OBIETTIVO

#Obiettivo n.1: rinviare il minimo numero di articoli
# dovrei contare il numero di non-assegnamenti, minimizzare quelli rinviati e' come dire massimizzare quelli assegnati
# se ne assegniamo il piu' possibili, ne rinviamo il meno possibili
maximize z1: sum {a in A, f in F} x[a,f];

#Obiettivo n.2: equilibrare i fascicoli
#minimizzare la differenza tra il minimo ed il massimo numero di pagine di pubblicità nei fascicoli
#minimize z2: U - L;
#subject to MaxMin {f in F}: L <= sum {a in A} p[a] * x[a,f];
#subject to MinMax {f in F}: U >= sum {a in A} p[a] * x[a,f];
#subject to NonPeggioramento: sum {a in A, f in F} x[a,f] >= ??;		# <<Valore ottimo di z1>>

######################################
data;

param nA := 12;
param nF := 3;
param nP := 44;

param:     p         u:=
1          5         2
2         11         0
3         17         2
4         10         0
5         18         3 
6          8         0
7         14         0
8          9         1
9         16         1
10        12         0
11        14         0
12        13         0;

end;
