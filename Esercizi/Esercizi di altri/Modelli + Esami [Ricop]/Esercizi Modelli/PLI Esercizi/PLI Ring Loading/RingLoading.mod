# ESERCIZIO PLI : Ring Loading Problem

#DATI

param N;						# Numero di calcolatori
set Nodi := 1..N;				# Insieme dei nodi/calcolatori
param t{Nodi,Nodi};				# Traffico massimo tra ogni coppia di calcolatori [Mb/sec]

# Ogni arco i va da nodo i a nodo i+1 (modulo N)

#VARIABILI
# Una scelta binaria (orario oppure antiorario) per ogni coppia di calcolatori
var x {Nodi,Nodi} binary;		# 1 = orario		0=antiorario, primo indice e' l'origine, il secondo e' la destinazione
var delta;						# Capacita da installare su tutti gli archi [Mb/sec]

#VINCOLI
#Stiamo facendo cicli sugli archi, pero' usiamo l'insieme nodi per fare cicli sugli archi
subject to MinMax {i in Nodi: i<N}:
	delta >=sum {j in Nodi, k in Nodi: (j<=i and k>=i+1) or (k >=i+1 and j>k) or (j<=i and k<j)} t[j,k] * x[j,k] +
			sum {j in Nodi, k in Nodi: (j>=i+1 and k<=i) or (j >=i+1 and k>j) or (k<=i and j<k)} t[j,k] * (1-x[j,k]);

subject to MinMaxSpeciale:
	delta >=sum {j in Nodi, k in Nodi: (k<j)} t[j,k] * x[j,k] +
			sum {j in Nodi, k in Nodi: (k<j)} t[k,j] * (1 - x[k,j]);

#OBIETTIVO
minimize z: delta; 


#####################################
data;
param N := 10;

param t:	1	2	3	4	5	6	7	8	9	10 :=
1			9   7   7   8   7   9   9   6   6  10
2			7   7   7   7   7   8   5   7  10   9
3			7   5   8   8   8  10   6  10   9  10
4			7  10   7  10   9   8   5  10   7   9
5			10  5   6  10   5   8   7   9   8   7
6			6   7   8   7   8  10   9   5   9   7
7			9   5   8   9   7  10   8   9  10   7
8			6   5   9   5   6   8  10   6   9   8
9			7   5   5   8   8   8  10   7   9   7
10			8   5   5   7   8   9   7   6   5   8;

end;
