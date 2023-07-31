# Esercizio Missione

# La politica di equità costa 21 (134-113).
# Non si perde equità

# DATI

param nS;			# Numero scienziati
set S := 1..nS;		# Insieme degli scienziati
param nO;			# Numero oggetti
set O := 1..nO;		# Insieme degli oggetti
param sO{S,O};		# Spazio occupato per ogni oggetto degli scienziati
param vO{S,O};		# Valore di ogni oggetto per scienziato
param cap;			# Capacità massima zaino sherpa

# VARIABILI

var porta{S,O} binary;	# 1 se quell'oggetto dello scienziato è portato, 0 altrimenti
var minValore >= 0;
var valore;

# VINCOLI

s.t. massimaOccupazione:
	sum{s in S, o in O} porta[s,o]*sO[s,o] <= cap;

s.t. minimoValore{s in S}:
	sum{o in O} porta[s,o]*vO[s,o] >= minValore;

s.t. valoreTotale:
	sum{s in S, o in O} vO[s,o]*porta[s,o] = valore;

# OBIETTIVO

# Prima funzione obiettivo, valore 25, variabile 'valore' vale 113.
#maximize z : minValore;

# Seconda funzione obiettivo, valore 134
maximize z:  sum{s in S, o in O} vO[s,o]*porta[s,o];

########################

data;

param nS := 4;
param nO := 6;
param cap := 100;

param sO: 1 2 3 4 5 6 :=
1     	35 48 12 26 29 40
2     	18 17 41 36 28 15
3      	33 20 14 12  8 27
4      	20 28 31 35  7 15;

param vO: 1 2 3 4 5 6 :=
1     	31 40 19 25 33 41
2      	17 25 36 32 30 19
3      	25 28 12 18 10 29
4      	15 18 30 27 10 12;

end;
