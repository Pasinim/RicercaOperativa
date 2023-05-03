#ESERCIZIO 108 - PLI Ordini

#DATI
param nO;						#Numero ordini
set O := 1..nO;					#Insieme degli ordini
param p {O};					#Processing time di ogni ordine (tempo di lavorazione)
param d {O};					#Due date di ogni ordine (scadenza)


#VARIABILI
var x {O,O} binary;				# Matrice di precedenze: x(i,j)=1 sse "i" precede "j"
var c {O};						# Completion time di ogni ordine (tempo di completamento)
var t {O} >=0;					# Tardiness di ogni ordine
var TMAX >=0;					# Massima tardiness
var predecessori {O};			# Numero di predecessori di quel ordine

#VINCOLI
#Proibizione di cicli di ordine 3
subject to NoLoop3 {i in O, j in O, k in O: (i<>j) and (j<>k)and (i<>k)}:
	x[i,j] + x[j,k] + x[k,i] <=2;

#Nessun ordine precede se stesso
subject to noDiag {i in O}:
	x[i,i] = 0;

#Vincolo sull'orientamento degli archi, per ogni coppia di nodi (o "i precede j", o "j precede i")
subject to Preced {i in O, j in O: i<>j}:
	x[i,j] + x[j,i] = 1;

subject to Completion {i in O}:
	c[i] = sum {j in O} p[j] * x[j,i] + p[i];

# tardiness e' maggior uguale del ritardo
subject to Tardiness {i in O}:
	t[i] >= c[i] - d[i];

# Dice quanti sono i predecessori di quel ordine
subject to Conta_predecessori {j in O}:
	predecessori[j] = sum {i in O: i<>j} x[i,j];

#OBIETTIVO
# a) minimizzare il ritardo complessivo (cioe’ la somma di tutti gli eventuali ritardi rispetto alle scadenze richieste)
# si chiamano somma tardiness (tempo di completamento - la due date)
minimize z1: sum {i in O} t[i];


# b) minimizzare il ritardo massimo
minimize z2: TMAX;
subject to MaxTardiness {i in O}:
	TMAX >= t[i];

####################
data;
param nO := 10;

param:			 p						  d :=
1				24						 50
2				12						 50
3				30						 90
4				15						 70
5				18						 50
6				 7						 80
7				 8						100
8				15						 90
9				14						120
10				22						150;

end;
