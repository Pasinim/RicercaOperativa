# ESERCIZIO PL - Ferrovie
#La località di origine è indicata con "s"; quella di destinazione con "t".

#DATI
set S := 0..9;						# Le stazioni (s indicato con 0, t indicato con 9)
set M;								# I tipi di merce: A B C
set tratte within S cross S;		# Le tratte
param val {M};						# [Euro/tonnellata]
param lim {S,M};					# Limiti massimi sulla quantità di merce caricabile e scaricabile ogni giorno in ogni stazione
param numeroTreni {tratte};			# Numero di treni/giorno
param numeroVagoni {tratte};		# Numero di vagoni/treno
param capacitaVagoni {tratte};		# La capacità/vagone [ton/vagone]

# VARIABILI
var x {i in S, j in S, M} >= 0;		# quantità di merce M spedita lungo l'arco (i,j) [tonnellate/giorno]

#VINCOLI
#vincoli di conservazione del flusso, ciascuna delle merci bisogna imporre che la quantita entrante in ogni nodo sia uguale alla quantita uscente, fatta eccezione per i due nodi estremi
subject to Flow_Conservation {s in S, m in M: s not in {0,9}}:
	sum {i in S: (i,s) in tratte} x[i,s,m] = sum {j in S: (s,j) in tratte} x[s,j,m];  

#vincolo sulla quantitá trasportabile dall stazione di partenza [ton]
subject to limiteStazionePartenza {m in M}:
	sum {j in S: (0,j) in tratte} x[0,j,m]<= lim[0,m];

#vincoli di capacita', su ogni arco il flusso complessivo non deve superare la capacita' dell'arco
subject to Capacity { (i,j) in tratte}:
	sum {m in M} x[i,j,m] <= numeroTreni[i,j] * numeroVagoni[i,j] * capacitaVagoni[i,j];

#vincoli di capacita' sui nodi, il totale flusso entrante nel o uscente dal nodo sia non superiore al limite dato [ton/giorno]
subject to Node_Capacity { s in S, m in M}:
	sum {i in S: (i,s) in tratte} x[i,s,m]<= lim[s,m];

#OBIETTIVO
#massimizzare il valore complessivo del flusso [euro/giorno]
maximize z: sum {i in S, m in M: (i,9) in tratte} val[m] * x[i,9,m];

#################
data;

set M := A B C;

param val :=
A       80
B       50
C       65; 

set tratte :=
0 1,
0 2,
1 3,
1 4,
2 4,
2 5,
3 6,
3 7,
4 6,
4 7,
4 8,
5 7,
5 8,
6 9,
7 9,
8 9;

param:	numeroTreni	numeroVagoni	capacitaVagoni:=
0,1		4			10				20
0,2		4			8				15
1,3		2			10				20
1,4		3			6				20
2,4		8			2				16
2,5		1			8				16
3,6		5			4				16
3,7		4			6				16
4,6		3			5				16
4,7		3			4				16
4,8		3			5				16
5,7		4			18				10
5,8		4			10				10
6,9		3			9				18
7,9		5			3				20
8,9		2			11				18;

param lim :		A		B		C	:=
0				1000	1000	1000
1				300		1800	1400
2				250		900		100
3				900		650		1400
4				2000	1500	2000
5				1000	1000	1000
6				1200	1200	1400
7				600		700		950
8				300		1700	1900
9				1000	1000	1000;


end;
