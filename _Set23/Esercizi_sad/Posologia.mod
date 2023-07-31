# Esercizio Posologia

# DATI

param nO;					# Numero ore
set O := 0..nO;				# Insieme delle ore
param tP{O} default 0;		# Tasso proteina dopo x ore dall'assunzione. [mg/cc]
param lM{O};				# Livello minimo di proteina per ogni fascia (x ore dopo la mezzanotte) [mg/cc]


# VARIABILI

var assunzione{O} >= 0; 				# Assunzione in grammi del farmaco per ogni ora
var livelli{O} >= 0 ;		          	# Livelli  di proteina per ogni ora  
var assumi{O} binary;					# 0 se in quell'ora assume, 1 altrimenti

# VINCOLI

s.t. haAssunto{i in O}:
	assumi[i]*1000 >= assunzione[i];

s.t. livelloDiOgniOra{i in O}:
	sum{j in O } assunzione[j]*tP[(i-j) mod 24] = livelli[i];

s.t. livelloDiOgniOraMinimo{i in O}:
	  lM[i] <= livelli[i];

s.t. massimaAssunzione{i in O}:
	assunzione[i] <= 25;

#s.t. max3Volte:
#	sum{i in O} assumi[i] <= 3;

# OBIETTIVO

#minimize z: sum{i in O} assunzione[i];

minimize z: sum{i in O} assumi[i];

######################

data;

param nO := 23;

param lM :=
 0      5.0
 1      1.0
 2      0.0
 3      0.0
 4      0.0
 5      0.0
 6      4.0
 7     15.0
 8     12.0
 9      5.0
10      4.0
11      3.0
12     25.0
13     30.0
14     25.0
15     15.0
16      5.0
17      4.0
18      3.0
19     25.0
20     30.0
21     25.0
22     20.0
23     10.0;

param tP :=
0              1.5
1              3.0
2              4.0
3              2.5
4              1.9
5              1.4
6              1.0
7              0.7
8              0.5
9              0.3
10             0.2
11             0.1
12             0.0;

end;
