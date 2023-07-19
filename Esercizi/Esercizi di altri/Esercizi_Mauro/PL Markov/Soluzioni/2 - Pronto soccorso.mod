# Es: Pronto soccorso
# DATI

set S;							# Stati possibili ospedale
param T {S,S};					# Probabilità transizioni

# VARIABILI

var x {S} >= 0;					# Probabilità stati ospedale 

# VINCOLI

# Normalizzazione
subject to Sum1: sum {s in S} x[s] = 1;
# Bilanciamento 
subject to Bil {s in S}:
	x[s]*sum {s2 in S} T[s,s2] = sum {s2 in S} x[s2]*T[s2,s];

data;

set S := A B C D E;
param T : 
	A    B    C    D    E :=
A   0 5.32    0    0    0
B   3    0 1.32    4    0
C   0    6    0    0    4
D   0    3    0    0 1.32
E   0    0    0    6    0;
#set S := A B C E;
#param T : 
#	A    B    C    E :=
#A   0 5.32    0    0
#B   3    0 5.32    0
#C   0    6    0    4
#E   0    0    6    0;

end;
