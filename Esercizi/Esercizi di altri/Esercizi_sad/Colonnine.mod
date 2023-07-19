# Esame Colonnine

# DATI

param nR;			# Numero righe della griglia
param nC;			# Numero colonne della griglia
set R := 1..nR;		# Insieme delle righe
set C := 1..nC;		# Insieme delle colonne
param dom{R,C};		# Domanda in numero di macchine di ogni cella della griglia
param nT;			# Numero tipi delle colonnine
set T := 1..nT;		# Insieme delle colonnine
param cap{T};		# Capacità delle colonnine [n° macchine servibili simultaneamente]
param costo{T};		# Costo delle colonnine [K €]
param budget;		# Budget disponibile [K€]

# VARIABILI

var a{R,C,T} binary  ;# 1 se c'è una colonnina di quel tipo, 0 altrimenti.
var c{R,C,R,C} >= 0 integer;# Quanta domanda della cella è soddisfatta dall'altra cella.

# VINCOLI

# Assumo che ci sia una sola colonnina per ogni cella
s.t. unaSolaColonnina{i in R, j in C}:
	sum{k in T} a[i,j,k] <= 1;

# Soddisfazione massima
s.t. sodd{i in R, j in C}:
	sum{r in R, s in C} c[i,j,r,s] <= dom[i,j];

# Celle adiacenti
s.t. soloCelleAdiacenti{r in R, s in C, r1 in R, s1 in C: abs(r-r1) > 1 or abs(s -s1)  > 1}:
	c[r,s,r1,s1] = 0;

# Limite Colonnina
s.t. limite{r in R,s in C}:
	sum{r1 in R, s1 in C} c[r1,s1,r,s] = sum{t in T} a[r,s,t]*cap[t];

# Budget disponibile

s.t. budgetMassimoUsabile:
	sum{i in R, s in C, j in T} costo[j]*a[i,s,j] <= budget;

# OBIETTIVO

maximize z: sum{r in R, s in C, r1 in R, s1 in C}  c[r,s,r1,s1];

########################

data;

param nR := 16;
param nC := 9;
param nT := 2;
param budget := 1200;

param costo :=
1	50
2	100;

param cap :=
1 1
2 3;

param dom : 1	2	3	4	5	6	7	8	9 :=
1		0	0	2	0	0	0	1	0	1
2		1	0	0	0	0	1	0	0	0
3		0	1	0	2	0	0	0	0	0
4		1	0	0	0	0	1	0	0	0
5		0	0	1	0	0	0	0	0	2
6		1	0	0	0	0	1	0	0	0
7		0	0	0	1	0	0	0	0	0
8		0	1	0	0	0	0	0	0	1
9		0	0	0	1	0	2	0	0	0
10		0	0	0	0	0	0	0	0	1
11		1	1	0	0	0	0	0	0	0
12		0	0	0	1	0	2	0	0	1
13		1	0	0	0	0	0	0	0	0
14		0	0	0	1	0	1	0	1	0
15		1	0	0	0	0	0	0	0	1
16		1	0	2	0	0	0	2	0	0;


end;
