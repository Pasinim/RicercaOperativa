#ESERCIZIO 108 - PLI Ordini (versione 3)

#DATI
param nO;						# Numero ordini
set O := 1..nO;					# Insieme degli ordini
param p {O};					# Processing time di ogni ordine
param d {O};					# Due date di ogni ordine

#VARIABILI
var y {O,O} binary;				# Matrice di assegnamento: y(i,j) = 1 sse ordine "i" in posizione "j"
var tard {O} >=0;				# Tardiness in ogni posizione
var TMAX >=0;					# Massima tardiness
var t {O} >= 0;					# Tempo di inizio in ogni posizione

#VINCOLI
#Vincoli di assegnamento
subject to AssegnaOrdini {i in O}:
	sum {pos in O} y[i,pos] = 1;

subject to AssegnaPosizioni {pos in O}:
	sum {i in O} y[i,pos] = 1;

#Vincolo che esprime l'istante iniziale i
subject to Start {q in O}:
	t[q] = sum {j in O, pos in O: pos<q} p[j] * y[j,pos];

# tardiness e' maggior uguale del ritardo
subject to Tardiness {q in O}:
	tard[q] >= t[q] + sum {i in O} p[i] * y[i,q] - sum {i in O} d[i] * y[i,q];

#OBIETTIVO
# a) minimizzare il ritardo complessivo (cioe’ la somma di tutti gli eventuali ritardi rispetto alle scadenze richieste)
# si chiamano somma tardiness (tempo di completamento - la due date)
minimize z1: sum {q in O} tard[q];

# b) minimizzare il ritardo massimo
minimize z2: TMAX;
subject to MaxTardiness {q in O}:
	TMAX >= tard[q];

################
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
