# ESERCIZIO PLI Scaffali

#DATI

param nLibri;				# Numero dei libri
param nScaffali;			# Numero degli scaffali
set L := 1..nLibri;			# Insieme dei libri
set S := 1..nScaffali;		# Insieme degli scaffali
param w {L};				# Larghezza di ogni libro
param h {L};				# Altezza di ogni libro
param W;					# Larghezza della libreria

#VARIABILI
# Il problema decisionale cosiste nel decidere quali libri allocare ad ogni scaffale e quanto deve essere alto ogni scaffale
var x{L,S} binary;			# una variabile binaria per ogni coppia libro-scaffale, assume =1 se il libro viene assegnato allo scaffale
var H {S} >=0;				# indica l'altezza di ogni scaffale

#VINCOLI
#Vincolo che ogni libro sia assegnato ad uno degli scaffali (un vincolo per ogni libro)
subject to Assegnamento_scaffale {i in L}:
	sum {j in S} x[i,j] = 1;

#L'altezza di ogni scaffale deve essere sufficiente ad ospitare i libri ad esso assegnati
subject to Altezza_scaffale {i in L, j in S}:
	H[j] >= h[i] * x[i,j];

#I libri assegnati ad uno scaffale non possono eccedere in larghezza la dimensione della libreria
subject to Dimensione_libreria {j in S}:
	sum {i in L} w[i] * x[i,j] <= W;

#OBIETTIVO
#Minimizzare l'altezza complessiva degli scaffali
minimize z : sum {j in S} H[j];

#################
data;

param nLibri := 15;
param nScaffali := 15;
param W := 50;

param:	 w		 h :=
1		10		 2
2		22		20
3		20		10
4		 5		10
5		 8		 8
6		 7		12
7		15		18
8		11		 9
9		 9		15
10		10		13
11		 2		 8
12		 3		 7
13		12		 7
14		 5		10
15		 1		5;

end;
