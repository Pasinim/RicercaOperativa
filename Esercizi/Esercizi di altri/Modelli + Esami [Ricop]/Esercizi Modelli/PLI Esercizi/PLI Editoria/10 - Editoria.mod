# ESERCIZIO PLI - Editoria

#DATI
# Dati sugli articoli
param nA;								# Numero di articoli
set Articoli := 1..nA;					# Insieme degli articoli
param lungh {Articoli};					# Lunghezza di ogni articolo
param urgenza {Articoli};				# Urgenza di ogni articolo [0= non urgente...3=molto urgente]
# Dati sui fascicoli
param nF;								# Numero di fascicoli
set Fascicoli := 1..nF;					# Insieme di fascicoli
param capac;							# Numero di pagine disponibili su ogni fascicolo

#VARIABILI
var x {Articoli, Fascicoli} binary;		# Variabili binarie di assegnamento degli articoli ai fascicoli
var l;									# Minimo numero di pagine occupate su un fascicolo
var u;									# Massimo numero di pagine occupate su un fascicolo

#VINCOLI
#Vincoli di capacita di ogni fascicolo
subject to Capacity {f in Fascicoli}: 
	sum {a in Articoli} lungh[a] * x[a,f] <= capac;

#Vincoli di assegnamento (ogni articolo puo' essere pubblicato non piu' di 1 volta, oppure puo' essere anche rimandato quindi 0)
subject to Assegnamento {a in Articoli}:
	sum {f in Fascicoli} x[a,f] <= 1;

#Vincoli di incompatibilita' (far in modo che gli articoli piu' urgenti siano per forza assegnati ai fascicoli iniziali)
subject to Urgenti {a in Articoli: urgenza[a]>0}:
	sum {f in Fascicoli: f <= 4-urgenza[a]} x[a,f] = 1;

#OBIETTIVO
#Obiettivo 1: Massimizzare numero di articoli non rinviati
maximize z1: sum {a in Articoli, f in Fascicoli} x[a,f];

#Obiettivo 2: Minimizzare la differenza tra il minimo e il massimo numero di pagine di pubblicita' nei fascicoli
#minimize z2: u - l;
#subject to maxMin {f in Fascicoli}: l <= sum {a in Articoli} lungh[a] * x[a,f];
#subject to minMax {f in Fascicoli}: u >= sum {a in Articoli} lungh[a] * x[a,f];
#subject to nonPeggioramento: sum {a in Articoli, f in Fascicoli} x[a,f] >= 10; 		#<<valore ottimo di z1>>

#######################
data;

param nA := 12;
param nF := 3;
param capac := 44;

param lungh:=
1          5
2         11
3         17
4         10
5         18
6          8
7         14
8          9
9         16
10        12
11        14
12        13;

param urgenza :=
1         2
2         0
3         2
4         0
5         3 
6         0
7         0
8         1
9         1
10        0
11        0
12        0;

end;
