# ESERCIZIO Containers Caso 1

#DATI
param nC;				# Numero dei containers
param nO;				# Numero degli oggetti
set C := 1..nC;			# Insieme dei containers
set O := 1..nO;			# Insieme degli oggetti
param p{O};				# Il peso di ogni oggetto
param P;				# La capacita in peso dei containers

#VARIABILI
# Il problema decisionale consiste nel decidere quali containers usare e quali oggetti assegnare ad ogni container usato
var y {C} binary;		# Una variabile binaria per ogni container, assume valore =1 se il container viene usato
var x {O,C} binary;		# Una variabile binaria per ogni coppia oggetto-container. Assume = 1 se oggetto O viene assegnato al container C

#VINCOLI
# I vincoli impongono che ogni oggetto sia assegnato ad uno dei containers
subject to Assegnamento {i in O}:
	sum {j in C} x[i,j] = 1;

#Gli assegnamenti indicati dalle  variabili x vengano fatti solo per i containers usati e che i vincoli di capacita siano soddisfati:
subject to Capacita {j in C}:
	sum {i in O} p[i] * x[i,j] <= P * y[j];

#OBIETTIVO
minimize z : sum {j in C} y[j];

###########################
data;

param nC := 4;
param nO := 15;

param p :=
1		10
2		24
3		18
4		 7 
5		 7
6		 6
7		16
8		11
9		 8
10		11
11		 1
12		 6
13		15
14		 8
15		 2;

param P := 50;
end;
