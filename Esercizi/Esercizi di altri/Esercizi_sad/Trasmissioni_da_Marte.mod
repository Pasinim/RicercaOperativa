# Esercizio Trasmissioni da Marte

# DATI
param nB;					# banchi di memoria
param nI;					# intervalli di memoria
set B := 1..nB;				# Insieme banchi di memoria
set I := 1..nI;				# Insieme intervalli di memoria
param pD{I,B};				# Produzione dati [Mbit] di ogni strumento per ogni intervallo
param C{B};					# Capacità di memoria per ogni strumento [Mbit]
param O{B};					# Livello iniziale di occupazione	[Mbit]
param D{I};					# Durata intervalli [s]
param BR{I};				# Velocità di trasmissione (bit rate) per ogni intervallo [Kbit/s]

# VARIABILI
var occupazione{I,B} >= 0;		# Occupazione delle memorie per ogni intervallo di tempo [Mbit]
var scaricati{I,B} >= 0;		# Tempo dedicato ad ogni memoria per scaricare in ogni intervallo di tempo [s]
var w;

# VINCOLI

s.t. occupazioneMassima{i in I, j in B}:
	occupazione[i,j] <= C[j] ;

s.t. occupazione0{i in B}:
	occupazione[1,i] = O[i] + pD[1,i] - scaricati[1,i]*BR[1]/1000;

s.t. occupazione1{i in I, j in B : i > 1}:
	occupazione[i-1,j] + pD[i,j] = occupazione[i,j] + scaricati[i,j]*BR[i]/1000;

# Non posso scaricare per più tempo di quanto dura l'intervallo stesso.
s.t. scaricamentoDati{i in I}:
	sum{j in B} scaricati[i,j] <= D[i];

s.t. massimoRapporto{i in I, j in B}:
	occupazione[i,j]/C[j] <= w;

# OBIETTIVO

minimize z: w;

#######################
data;

param nB := 6;
param nI := 9;

param pD: 1    2    3    4    5    6 :=
1         4   11   31    3   18   27
2         6    8   34    4   19   23
3         7   23   38    5   21   19
4         3   31   35    6   15   18
5         3   14   37    7   14   23
6         8    8   35    6   14   24
7         1   10   31    5   14   25
8         3   20   40    4   18   20
9         4   13   28    5   19   13;

param C :=
1         32
2         60
3        100
4         30
5         50
6         80;

param O := 
1         8      
2        15      
3        25      
4         5      
5        16      
6        23;

param:		 D		 BR :=
1          490      195
2          420      160
3          460      180
4          485      195
5          400      160
6          455      180
7          480      195
8          380      160
9          450      180;

end;
