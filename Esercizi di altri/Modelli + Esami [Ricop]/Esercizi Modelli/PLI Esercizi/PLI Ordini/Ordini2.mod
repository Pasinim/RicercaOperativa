#ESERCIZIO 108 - PLI Ordini v2 (altro metodo)

#DATI
param nO;						# Numero ordini
set O := 1..nO;					# Insieme degli ordini
param p {O};					# Processing time di ogni ordine
param d {O};					# Due date di ogni ordine
param M;						# Costante molto grande

#VARIABILI
var x {O,O} binary;				# Matrice di precedenze: x(i,j)=1 sse "i" precede "j"
var c {O};						# Completion time di ogni ordine (tempo di completamento)
var tard {O} >=0;				# Tardiness di ogni ordine
var TMAX >=0;					# Massima tardiness
var t {O} >= 0;					# Tempo di inizio di esecuzione per ogni ordine

#VINCOLI
#Nessun ordine precede se stesso
subject to noDiag {i in O}:
	x[i,i] = 0;

#Vincolo sull'orientamento degli archi, per ogni coppia di nodi (o "i precede j", o "j precede i")
subject to Preced {i in O, j in O: i<>j}:
	x[i,j] + x[j,i] = 1;

#Vincoli disgiuntivi per eleminare i cicli
subject to Disj {i in O, j in O: i<>j}:
	t[i] + p[i] <= t[j] + M * x[j,i];

# Sta volta completion time = starting time + processing time
subject to Completion {i in O}:
	c[i] = t[i] + p[i];

# tardiness e' maggior uguale del ritardo
subject to Tardiness {i in O}:
	tard[i] >= c[i] - d[i];

#OBIETTIVO
# a) minimizzare il ritardo complessivo (cioe’ la somma di tutti gli eventuali ritardi rispetto alle scadenze richieste)
# si chiamano somma tardiness (tempo di completamento - la due date)
minimize z1: sum {i in O} tard[i];


# b) minimizzare il ritardo massimo
minimize z2: TMAX;
subject to MaxTardiness {i in O}:
	TMAX >= tard[i];

################
data;
param nO := 10;
param M := 9999;

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
