# Gioco coi numeri

# DATI
set P := 1..9;				# Posizioni
param cifre{P}in 0..9;		# Vettore di cifre
set E := 0..2;				# Esponente di 10 per ogni posizione

# VARIABILI
var x {P,E} binary;

# VINCOLI
s.t. Assign_cifre{p in P} :
	sum {e in E} x[p,e] = 1;

s.t. Esponenti{e in E, p in P: p < 9 and e >0}:
	x[p,e] <= x[p+1,e-1];

s.t. Ultima : x[9,0] = 1;

s.t. Somma:
	sum {p in P, e in E} cifre[p] * 10^e * x[p,e] <= 1000;

# OBIETTIVO

maximize z: sum {p in P, e in E} cifre[p] * 10^e * x[p,e] ;

#################
data;

param cifre :=
1 9
2 8 
3 7
4 6
5 5
6 4
7 3
8 2
9 1;

end;
