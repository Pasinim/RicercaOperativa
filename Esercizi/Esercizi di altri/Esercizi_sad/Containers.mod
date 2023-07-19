# Esercizio Containers

# DATI

param n;			# Numero di tipi di oggetti
set N := 1..n;		# Insieme dei tipi di oggetti
param numero{N};	# Numero di oggetti da trasportare per ogni tipo
param volume{N};	# Volume degli oggetti per ogni tipo
param nT; 			# Numero di tipi di containers
set T := 1..nT;		# Tipi di containers
param cap{T};			# Capacità dei containers
param m{k in T} := ceil(sum{ i in N} volume[i]*numero[i]/cap[k])+2; # Se potessimo frazionare gli oggetti, quello che avremmo. Aggiungo un numero perchè quello di prima è un lower bound. Abbiamo aggiunto 5 che è un numero a caso messo a buon senso guardando l'ordine di grandezza dei dati.

# Si può partire dal lower bound, finché il solutore ci dice no feasible solution, aggiungiamo qualcosa.
set C{k in T} := 1..m[k];		# Insieme dei containers
	# VETTORE DI INSIEMI.
# VARIABILI

var y {k in T,C[k]} binary;	# Uso dei containers: 1= usato 0= non usato
var x {N,k in T,C[k]} >= 0 integer;		# Numero di oggetti di ogni tipo in ogni container.
var slack{k in T, C[k]} >= 0;
	## integer è per dire intera.
# VINCOLI

# Vincoli di capacità per ogni container.
subject to Capacity {k in T,j in C[k]}:
	sum{i in N} volume[i]*x[i,k,j] + slack[k,j] = cap[k] * y[k,j];

# Vincolo sul trasporto di tutti gli oggetti.
subject to Assegnamento {i in N}:
	sum{k in T, j in C[k]} x[i,k,j] = numero[i];

# Symmetry breaking constraints 

s.t. SBC{k in T,j in C[k]: j > 1 } :
	y[k,j] <= y[k,j-1];

# Numero di container ammessi
s.t. NContainer:
	sum{k in T, j in C[k]} y [k,j] = 6; # Valore ottimo funzione obiettivo principale.

# moltiplicare variabili fa perdere la linearità del modello

#subject to xy{i in N, j in C}:
#	x[i,j] <= y[j] * numero[i]; # confronto intero e binario non va bene. C'è bisogno di un trucchetto. Se non moltiplichiamo per numero[i] , allora staremmo dicendo che ogni x[i,j] deve essere minore di 1.

# OBIETTIVO

#minimize z: sum{j in C} y[j];

# mnimizzare la capacità non utilizzata.

minimize z2: sum{k in T, j in C[k]} slack[k,j];

################

data;

param n := 10;
param nT := 3;

param:  numero     ,   volume :=
1          68               30
2          90               25
3          10              200 
4          48               40
5          28              105
6          70              150
7          56               18
8          10              250
9          45               54
10         12               67;


param cap := 
1 5000
2 3000
3 4000;


end;

#3000 o 4000
