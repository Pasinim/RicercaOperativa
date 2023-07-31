# Esercizio Inviti a cena

# DATI

param n; 		# Numero di vertici
set N := 1..n;	# Insieme dei vertici
param w{N};		# Peso di ogni vertice
#param m;		# Numero di edege nel grafo
param A {N,N} binary default 0;
#set E within N cross N;	# Insieme degli edege

# VARIABILI
var x{N} binary;# Selezione dei vertici

# VINCOLI

#s.t. incompatibility{i in N , j in N: not((i,j) in E or (j,i) in E) and i < j}: # i <j elimina gli autoanelli
#	x[i] + x[j] <= 1;

s.t. incompatibility{i in N, j in N: (A[i,j] = 1 or A[j,i] = 1) and (i<>j)}: 
	x[i] + x[j] <= 1;

# OBIETTIVO

maximize z: sum {i in N} w[i] * x[i];

##################

data;

param n := 8;
#param m := 13;
param w :=
1 100
2 100
3 90 
4 85
5 50 
6 20
7 15
8 10;

/*set E := 
 (1,2) (1,3)
 (2,3) (3,4) (2,4)
 (2,5) 
 (3,6)
 (4,7)
 (5,7) (6,7)
 (5,6) (5,8) (6,8);
*/

# A DEFINIBILE ANCHE SOLAMENTE PER LE COPPIE INTERESSATE tipo (1,2) 1 ETC...
param A : 1 2 3 4 5 6 7 8 :=
1		  . 1 1 . . . . .
2		  . . 1 1 1 . . .
3		  . . . 1 . 1 . .
4		  . . . . . . 1 .
5		  . . . . . 1 1 1
6		  . . . . . . 1 1
7		  . . . . . . . .
8		  . . . . . . . .;
end;
