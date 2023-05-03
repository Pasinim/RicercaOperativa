#DATI
param nP;		#il numero di punti
param nD;		#il numero di dimensioni
param nS;		#il numero di sottinsiemi
set P:=1..nP;	#l'insieme dei punti
set D:=1..nD;	#insieme delle dimensioni
set S:=1..nS;	#i sottoinsiemi
param c{P, D};	#coordinate del punto

#VARIABILI
var x{P,S}binary;	#assegnamento di punto ad un sotto-insieme
var r{S,D};			#identifica il punto rappresentativo
var costo{S};		#il costo di ogni sottoinsieme

#VINCOLI

#tutti i punti devono appartenere ad uno e un solo sotto-insieme
subject to Assign{p in P}: sum{s in S} x[p,s]=1;


#calcolo del costo
subj to Costo{s in S}: costo[s] = sum{d in D, p in P} (	x[p,s] * (c[p,d]-r[s,d])^2 ) ;


#OBBIETTIVO
#minimizzare il costo dei sottoinsiemi
minimize w: sum{s in S} costo[s];


data;

param nP:=16;
param nS:= 3;
param nD:= 4;

param c:  1    		2   	   3   	    4	:=
  1      25        61        110      -57
  2      32       -63         90       50
  3      28        25        -14      -34
  4     -41       -30         56      -29
  5      70       -81        -58       30
  6     -97        17        -71      -68
  7     103        12        -90       67
  8      12       -31        135       65
  9     -28       -26         85       21
 10      33       -78         84      -92
 11     -51        44        -23      -94
 12      40       -79        -27       63
 13     -99        80         39      -70
 14      96       -11        -33       38
 15       5         6        -12      -91
 16     -40        48        140      100;



end;