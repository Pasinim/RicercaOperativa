# Esercizio Min-sum-of-squares

# DATI

param nD;			# Numero di dimensioni dello spazio euclideo
param nP;			# Numero punti da partizionare
param nS;			# Numero di sottoinsiemi in cui partizionare i punti
set D := 1..nD;		# Insieme delle dimensioni
set P := 1..nP;		# Insieme dei punti
set S := 1..nS;		# Insieme dei sottoinsiemi
param pos{P,D};		# Coordinate dei punti

# VARIABILI

var a{P,S} binary;	# Assegnamento ad un sottoinsieme
var c{S,D};			# Assegnamento dei centri

# VINCOLI

s.t. unSoloSottonsieme{i in P}:
	sum{j in S} a[i,j] <= 1;

s.t. unSoloSottonsieme1{i in P}:
	sum{j in S} a[i,j] >= 1; 


# OBIETTIVO

minimize z: sum{i in S}( sum{k in P} sum{j in D} (c[i,j] - pos[k,j] )^2*a[k,i] );

data;

param nD := 4;
param nP := 16;
param nS := 3;

param pos:   1	        2 		   3		4 :=
1        25        61        110      -57
2        32       -63         90       50
3        28        25        -14      -34
4       -41       -30         56      -29
5        70       -81        -58       30
6       -97        17        -71      -68
7       103        12        -90       67
8        12       -31        135       65
9       -28       -26         85       21
10       33       -78         84      -92
11      -51        44        -23      -94
12       40       -79        -27       63
13      -99        80         39      -70
14       96       -11        -33       38
15        5         6        -12      -91
16      -40        48        140      100;

end;
