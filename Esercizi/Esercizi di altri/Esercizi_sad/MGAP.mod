# Esercizio MGAP

# DATI

param nJ;				# Numero di job
param nM;				# Numero macchine
set J := 1..nJ;			# Insieme dei job
set M := 1..nM;			# Insieme delle macchine
param cS1{J,M};			# Consumo della macchina [s] livello 1
param cS2{J,M};			# Consumo della macchina [s] livello 2
param cC1{J,M};			# Costo della macchina [€] livello 1
param cC2{J,M};			# Costo della macchina [€] livello 2
param CAP;				# Capacità macchine
param nL;				# Numero livelli
set L := 1..nL;			# Insieme dei livelli

# VARIABILI

var a1{M,J} binary;
var a2{M,J} binary;

# VINCOLI

s.t. unSoloJob{i in J}:
	sum{j in M} (a1[j,i]+a2[j,i]) = 1;

s.t. tempoTotale{i in M}:
	sum{j in J} (a1[i,j]*cS1[j,i] + cS2[j,i]*a2[i,j])	<= CAP;

# OBIETTIVO

minimize z: sum{i in M,j in J} (a1[i,j]*cC1[j,i] + a2[i,j]*cC2[j,i]);

#################

data;

param nJ := 6;
param nM := 4;

param cS1 : 1       2       3       4:=
 1         5     7     8    10 
 2         6     9    10     5 
 3         7     8    13     7 
 4        15    12    16    13 
 5         2     1     3     2  
 6         8     9     7     8 ;

param cS2 : 1 		2  3  4:=
1			8		12   13 15
2		   11		20   14  8
3		   14       12   17 13
4          18       14   18 16
5           5        4    7  5
6          11       13   13 14;

param cC1 : 1      2       3       4 :=
 1        34   31    22    33 
 2        25   23    20    20 
 3        19   18    16    15  
 4        28   25    18    12  
 5        31   38    29    30 
 6         6    8     9    10 ;


param cC2: 1  2   3  4 :=
1     25   18  10 22
2     18   15  13 15
3     14   13  10  9
4     26   20   9  6
5     25   30  23 27
6      3    4   5  7;

param CAP := 20;

end;
