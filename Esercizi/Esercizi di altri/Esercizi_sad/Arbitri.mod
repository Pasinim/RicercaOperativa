# Esercizio Arbitri


# DATI

param nS;				# Numero squadre
set S := 1..nS;			# Squadre
param nG := nS-1;		# Numero giornate
set G := 1..nG;			# Insieme delle giornate
param nP := nS/2;		# Numero partite per giornata
set P := 1..nP;			# Insieme delle partite
param c{G,P,S} binary default 0;			# Calendario
set A := 1..3;

# VARIABILI

var arbitri{A,G,P} binary;# 1 se l'arbitro arbitra la partita.
var nV{A,S};			  # Numero volte che un arbitro viene assegnato ad una squadra.
var maxnV;
var minnV;

# VINCOLI

s.t. unArbitro{i in G, k in P}:
	sum{j in A} arbitri[j,i,k] = 1;

s.t. unaPartita{i in G, k in A}:
 	sum{j in P} arbitri[k,i,j] <= 1;

s.t. valorenV{i in A, j in S}:
	sum{k in G, w in P} arbitri[i,k,w]*c[k,w,j] = nV[i,j];

s.t. massimonV{i in A,j in S}:
	nV[i,j] <= maxnV;

s.t. minimonV{i in A,j in S}:
	nV[i,j] >= minnV;

# OBIETTIVO

minimize z: maxnV - minnV;


##########################

data;

param nS := 6;

param c :=
[1,1,1] 1
[1,1,6] 1
[1,2,2] 1
[1,2,5] 1
[1,3,3] 1
[1,3,4] 1

[2,1,1] 1
[2,1,4] 1
[2,2,2] 1
[2,2,6] 1
[2,3,3] 1
[2,3,5] 1

[3,1,1] 1
[3,1,2] 1
[3,2,3] 1
[3,2,6] 1
[3,3,4] 1
[3,3,5] 1

[4,1,1] 1
[4,1,5] 1
[4,2,2] 1
[4,2,3] 1
[4,3,4] 1
[4,3,6] 1

[5,1,1] 1
[5,1,3] 1
[5,2,2] 1
[5,2,4] 1
[5,3,5] 1
[5,3,6] 1;


/*param c :=

1	1 0 0 0 0 1
	0 1 0 0 1 0
	0 0 1 1 0 0

2	1 0 0 1 0 0
	0 1 0 0 0 1
	0 0 1 0 1 0

3	1 1 0 0 0 0
	0 0 1 0 0 1
	0 0 0 1 1 0

4	1 0 0 0 1 0
	0 1 1 0 0 0
	0 0 0 1 0 1

5	1 0 1 0 0 0
	0 1 0 1 0 0
	0 0 0 0 1 1;
	*/

end;
