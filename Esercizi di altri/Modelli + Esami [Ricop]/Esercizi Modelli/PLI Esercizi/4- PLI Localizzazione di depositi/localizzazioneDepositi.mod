# ESERCIZIO PLI Localizzazione di depositi (Mixed Integer Programming)

#DATI
param nDepositi;				# Numero dei depositi
param nUtenti;					# Numero degli utenti
set D := 1..nDepositi;			# Insieme dei depositi
set U := 1..nUtenti;			# Insieme degli utenti
param c {D,U};					# Il costo di trasporto della merce dal deposito D all'utente U [denaro/peso]
param q {D};					# La capacita' del deposito [peso]
param d {U};					# La domanda di ogni utente [peso]
param k {D};					# Costi fissi di esercizio dei depositi [denaro]

#VARIABILI
# Decidere quali depositi usare e quanta merce trasportare da ogni deposito ad ogni utente
var y {D} binary;				# assume valore 1 se il deposito D viene usato 
var x {U,D} >= 0;				# quantita' di merce trasportata

#VINCOLI
# La domanda di ogni utente sia soddisfatta, sommando i contributi provenienti dai diversi depositi [peso]
subject to Domanda {i in U}:
	sum {j in D} x[i,j] = d[i];

# Necessario imporre che i trasporti avvengano utilizzando i depositi aperti e che da ogni deposito
# non esca una quantita di merce superiore alla sua capacita' [peso]
subject to Capacita {j in D}:
	sum {i in U} x[i,j] <= q[j] * y[j];

#OBIETTIVO
# Si vuole minimizzare il costo complessivo che e' dato dai costi di trasporto + i costi fissi di esercizio [denaro]
minimize z : sum {j in D, i in U} c[j,i] * x[i,j] + sum {j in D} k[j] * y[j];

####################
data;

param nDepositi := 5;
param nUtenti := 10;

param c: 	 1	 2		 3		4		5		6		 7		 8		 9		10 :=
1 			35	24		62		57		81		34		36		12		63		24
2 			72	25		42		25		64		14		24		74		84		15
3 			48	37		62		14		56		94		51		76		11		21
4 			26	26		73		83		15		89		89		21		44		53
5 			62	26		37		26		15		37		24		61		54		13;

param:   k		  q :=
1		35		175
2		32		126
3		38		110
4		38		 92
5		41		155;

param d :=
1		35
2		28
3		49
4		37
5		40
6		26
7		31
8		48
9		28
10		36;

end;
