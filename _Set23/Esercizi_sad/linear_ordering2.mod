# Esercizio linear ordering

# DATI
param n;			# Numero di nodi del grafo
set N := 1..n;		# Insieme dei nodi
param c {N,N};		# Matrice dei pesi

# VARIABILI

var x{N,N} binary;	# Orientamento arco

# VINCOLI

# meglio + vincoli che poche variabili.
# Aciclicità del grafo
s.t. NoCicli3{i in N, j in N, k in N: i <> j and i <> k and j <> k}:
	x[i,j] + x[j,k] + x[k,i]  <= 2;

# Orientamento archi
s.t. Orientamento{ i in N, j in N: i <j } :
	x[i,j] + x[j,i] = 1;

# OBIETTIVO

minimize z : sum{i in N, j in N: i <> j} c[i,j] * x[i,j];

#################

data;

param n := 7;

param c: 1 2 3 4 5 6 7 :=
1  0  68  81  23  45  20  37
2 12   0  25  51  57  89  78
3 34  27   0  12   9  71  20
4 95  55  42   0   8  23  44
5 60  60  51  34   0   2  40
6  93  22  48  45  24   0  77
7  75  64  36  25  16  21   0;
 
 
end;
