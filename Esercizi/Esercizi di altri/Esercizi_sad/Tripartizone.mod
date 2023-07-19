# Esercizio Tripartizione

# DATI

param nPP;				# Numero punti del primo sottoinsieme 
param nPS;				# Numero punti del secondo sottoinsieme 
param nPT;				# Numero punti del terzo sottoinsieme 
set pP := 1..nPP;		# Insieme dei punti del primo sottoinsieme
set pS := 1..nPS;		# Insieme dei punti del secondo sottoinsieme
set pT := 1..nPT;		# Insieme dei punti del terzo sottoinsieme
param xP{pP};			# Coordinate x  per ogni punto del primo sottoinsieme
param yP{pP};			# Coordinate y  per ogni punto del primo sottoinsieme
param xS{pP};			# Coordinate x  per ogni punto del secondo sottoinsieme
param yS{pP};			# Coordinate y  per ogni punto del secondo sottoinsieme
param xT{pP};			# Coordinate x  per ogni punto del terzo sottoinsieme
param yT{pP};			# Coordinate y  per ogni punto del terzo sottoinsieme
param nC := 2;			# Numero coefficienti della retta
set C := 0..nC;			# Insieme dei coefficienti

# VARIABILI

var c1{C};				# Coefficienti retta 1
var c2{C};				# Coefficienti retta 2
var c3{C};				# Coefficienti retta 3
var xP;					# Punto di intersezione, coordinata delle x
var yP;					# Punto di intersezione, coordinata delle y

# VINCOLI

# Mi assicura che sia una retta
s.t. normalizzazione1:
	c1[1]^2 + c1[0]^2 = 1;
s.t. normalizzazione2:
	c2[1]^2 + c2[0]^2 = 1;
s.t. normalizzazione3:
	c3[1]^2 + c3[0]^2 = 1;


# Forza le rette ad intersecarsi in un punto
s.t. intersezione1:
	c1[0]*xP + c1[1]*yP + c1[2] = 0;
s.t. intersezione2:
	c2[0]*xP + c2[1]*yP + c2[2] = 0;
s.t. intersezione3:
	c3[0]*xP + c3[1]*yP + c3[2] = 0;

# VINCOLO DA FARE: Divisione degli insiemi da parte delle rette.



# OBIETTIVO

######################
data;


param nPP := 8;
param nPS := 6;
param nPT := 12;


param: xP 	yP := 
1  	   -5   12
2  	   10    8
3   	5    5
4   	3    0
5  	   -1    3
6  	   -2    9
7       2   10
8      10    6;

param: xS   yS :=
1 	  -10    2
2      -4    3
3     -19   15
4     -11    0
5      -7   -3
6     -12   -9;

param: xT   yT :=
1      -3   -6
2      -1   -8
3       1   -5
4      -2   -9
5      11   -1
6       2   -9
7       3    0
8       0   -2
9       1   -8
10      2   -2
11     -3   -6
12     -4   -9;



end;
