# Esercizio Traffico

# DATI

param nN;					# Numero nodi
set N := 1..nN;				# Insieme dei nodi
set E within (N cross N); 	# Insieme degli archi
set tratte within E;
param tB{E};				# Tempo base per ogni arco
param coeffi{E};			# Coefficiente per arco
param traffico{tratte};		# Traffico


# VARIABILI

var veicoli{E,tratte} >= 0;	# Numero veicoli tra due punti per ogni tratta
var tA{E} >= 0;

# VINCOLI

s.t. flussoPariAZero{i in N, j in N, k in N, s in N: (i,j) in tratte and 
			( (k == 1 and s == 3) or (k == 2 and s == 4) or (k == 3 and s == 1)
			or (k == 4 and s == 2) )}:
			veicoli[i,j,k,s] = 0;

s.t. flussoTrattaEntrata{i in N, j in N : (i,j) in tratte}:
     sum{k in N: (i,k) in E} veicoli[i,k,i,j] = traffico[i,j];

s.t. flussoTrattaUscita{i in N, j in N : (i,j) in tratte}:
     sum{k in N: (k,j) in E} veicoli[k,j,i,j] = traffico[i,j];

s.t. conservazioneDelFlusso{k in N,i in N, j in N : (i,j) in tratte}:
	sum{x in N: (k,x) in E} veicoli[k,x,i,j] = sum{x in N: (x,k) in E} veicoli[x,k,i,j];

s.t. tempoSuOgniArcoPerMacchina{k in N, x in N: (k,x) in E}:
	tB[k,x] + coeffi[k,x]*( sum{ i in N, j in N: (i,j) in  tratte}(veicoli[k,x,i,j]))^2
	= tA[k,x];
	
# OBIETTIVO

minimize z: sum{f in N, d in N: (f,d) in tratte }
			 sum{i in N, j in N: (i,j) in E} tA[i,j]*veicoli[i,j,f,d];

######################

data;

param nN := 5;
set E :=  1,2 1,3 1,4 1,5 2,1 2,3 2,4 2,5
		  3,1 3,2 3,4 3,5 4,1 4,2 4,3 4,5
		  5,1 5,2 5,3 5,4;
set tratte := 1,3 2,4 3,1 4,2;

param traffico :=
1,3           60
2,4           80
3,1          120
4,2           50;

param : tB coeffi :=
1,2      20         0.1
1,3       0      	0
1,4      14         0.1
1,5       7         0.2
2,1      20         0.1
2,3      22         0.1
2,4       0        	0
2,5      15         0.2
3,1       0			0
3,2      22         0.1
3,4      15         0.1
3,5      10         0.2
4,1      14         0.1
4,2       0         0
4,3      15         0.1
4,5      10         0.2
5,1       7         0.2
5,2      15         0.2
5,3      10         0.2
5,4      10         0.2;

end;
