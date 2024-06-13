# ESERCIZIO 10 - PLI Editoria

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
#maximize z1: sum {a in A, f in F} x[a,f];

#Obiettivo n.2: equilibrare i fascicoli
#minimizzare la differenza tra il minimo ed il massimo numero di pagine di pubblicit� nei fascicoli
minimize z2: U - L;
subject to MaxMin {f in F}: L <= sum {a in A} p[a] * x[a,f];
subject to MinMax {f in F}: U >= sum {a in A} p[a] * x[a,f];
#subject to NonPeggioramento: sum {a in A, f in F} x[a,f] >= ??;		# <<Valore ottimo di z1>>

######################################
data;

param nA := 12;
param nF := 3;
param nP := 44;

    1   2   3   4
A   0   1   0   0
B   0   0   1   0
C   0   1   0   0
D   0   1   0   0
E   1   0   0   0
F   0   1   0   0
G   0   0   0   1
H   1   0   0   0
I   0   0   1   0
J   0   0   0   1
K   0   0   0   1
L   1   0   1   0


      1   2   3
1     1   0   0
2     1   0   0
3     0   0   0
4     1   0   0
5     1   0   0
6     0   1   0
7     0   1   0
8     0   1   0
9     0   0   1
10    0   1   0
11    0   0   1
12    0   0   1


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
