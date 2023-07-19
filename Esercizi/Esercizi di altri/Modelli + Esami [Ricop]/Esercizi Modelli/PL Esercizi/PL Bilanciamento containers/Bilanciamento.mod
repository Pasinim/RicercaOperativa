#ESERCIZIO PL - Bilanciamento containers (Appello 21 Giungo 2012)

#DATI
param nP;						# Numero porti
set P := 1..nP;					# Insieme porti
set tratte within P cross P;	# Sottoinsieme delle tratte
param capacitaA {tratte};		# Capacita disponibili per i containers vuoti di tipo A
param capacitaB {tratte};		# Capacita disponibili per i containers vuoti di tipo A
param costo {tratte};			# Costo unitario di trasporto di ogni tipo di container
param noleggio;					# Il costo di ogni container noleggiato
param sbilanciamentoA {P};
param sbilanciamentoB {P};

#VARIABILI
var xA {P,P} >=0;			# Flusso di container A da porto i a porto j
var xB {P,P} >=0;			# Flusso di container B da porto i a porto j

#VINCOLI

#Vincoli di ribilanciamento A in ogni porto
subject to Ribilanc_A {j in P}:
	sum {i in P: (i,j) in tratte} (xA[i,j] - xA[j,i]) <= sbilanciamentoA[j];

#Vincoli di ribilanciamento B in ogni porto
subject to Ribilanc_B {j in P}:
	sum {i in P: (i,j) in tratte} (xB[i,j] - xB[j,i]) <= sbilanciamentoB[j];

#Vincoli di capacita A
subject to Capacity_Auno {i in P, j in P: (i,j) in tratte}: 
	xA[i,j] <= capacitaA[i,j];

subject to Capacity_Adue {i in P, j in P: (i,j) in tratte}: 
	xA[j,i] <= capacitaA[i,j];

#Vincoli di capacita B
subject to Capacity_Buno {i in P, j in P: (i,j) in tratte}: 
	xB[i,j] <= capacitaB[i,j];

subject to Capacity_Bdue {i in P, j in P: (i,j) in tratte}: 
	xB[j,i] <= capacitaB[i,j];


#OBIETTIVO
#minimizzare i costi di spostamento
# la somma di tutte le variabili di flusso, pesate ciascuna con il proprio coeff di costo
minimize z: sum {i in P, j in P: (i,j) in tratte} ( (xA[i,j] + xA[j,i] + xB[i,j] +xB[j,i]) * costo[i,j]);

##############
data;

param nP := 8;

set tratte:=
1 4,
2 4,
1 3,
2 8,
4 3,
3 8,
3 5,
8 5,
3 7,
8 6,
8 7,
5 7,
5 6,
6 7;

param:	capacitaA	capacitaB	costo :=
1,4      25          15         150
2,4      18          12         120
1,3      20          10         180
2,8      20          18         200
4,3      10          10         180
3,8       8          13         110
3,5      26           8         230
8,5      15           4         190
3,7      20           5         250
8,6      24          20         270
8,7      28          15         210
5,7      10          20         220
5,6      12          20         110
6,7      10          20         120;

param sbilanciamentoA :=
1	19
2	15
3	-12
4	9
5	-24
6	-2
7	-3
8	-2;

param sbilanciamentoB :=   
1	-12
2	23
3	-9
4	18
5	-2
6	-22
7	-18
8	+22;

param noleggio := 500;

end;
