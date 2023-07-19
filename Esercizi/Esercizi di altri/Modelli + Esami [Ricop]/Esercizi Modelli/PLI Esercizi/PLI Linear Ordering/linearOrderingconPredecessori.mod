# ESERCIZIO PLI 36.2 : Linear Ordering 

# RISULTATO: 3 1 7 4 5 6 2

#DATI
param N;							# Numero di nodi del grafo (la dimensione della matrice)
set Nodi := 1..N;					# Insieme dei nodi
param c {Nodi, Nodi};				# Peso degli archi del grafo

#VARIABILI
var x {Nodi, Nodi} binary;			# Precedenza: x[i,j] = 1 sse i precede j nell’ordinamento
var predecessori {Nodi};			# Numero di predecessori del nodo

#VINCOLI
# Vincoli sull’orientamento per ogni coppia (o "i" precede "j", oppure "j" precede "i")
subject to Coppia {i in Nodi, j in Nodi: (i<j) }:
	x[i,j] + x[j,i] = 1;

# Vincoli che proibiscono i cicli di ordine 3
subject to NoCicli {i in Nodi, j in Nodi, k in Nodi: (i<>j) and (j <>k) and (i<>k) }:
	x[i,j] + x[j,k] + x[k,i] <= 2;

# Dice quanti sono i predecessori di quel nodo
subject to Conta_predecessori {j in Nodi}:
	predecessori[j] = sum {i in Nodi: i<>j} x[i,j];

#OBIETTIVO
#Minimizzare i costi degli archi orientati secondo le precedenze
minimize z : sum {i in Nodi, j in Nodi} c[i,j] * x[i,j];

#########################
data;

param N:= 7;

param c:	1	2	3	4	5	6	7 :=
1			0	68	81	23	45	20	37
2			12	0	25	51	57	89	78
3			34	27	0	12	9	71	20
4			95	55	42	0	8	23	44
5			60	60	51	34	0	2	40
6			93	22	48	45	24	0	77
7			75	64	36	25	16	21	0;

end;
