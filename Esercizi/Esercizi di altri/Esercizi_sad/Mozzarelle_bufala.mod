# Esercizio Mozzarelle di bufala

# DATI
param nA;			# Numero allevamenti
set A := 1..nA;		# Insieme degli allevamenti
param xA{A};		# Posizione coordinata X degli allevamenti
param yA{A};		# Posizione coordinata Y degli allevamenti
param P{A};			# Produzione degli allevamenti [quintali/giorno]
param nC;			# Numero caseifici
set C := 1..nC;		# Insieme dei caseifici
param cap{C};		# Capacità dei caseifici [quintali/giorno]
param xC{C};		#  Posizione coordinata X dei caseifici
param yC{C};		#  Posizione coordinata Y dei caseifici
param r;			# Resa del latte in mozzarelle
param nV;			# Numero punti vendita
set V := 1..nV;		# Insieme dei punti vendita
param pVc{V};		# Catena di ogni punto vendita
param xV{V};		# Posizione coordinata X dei punti vendita
param yV{V};		# Posizione coordinata Y dei punti vendita
param nCa;			# Numero di catene
set Ca := 1..nCa;	# Insieme delle catene

# VARIABILI

var AC{A,C} >= 0;		# Quintali di latte trasportati da ogni allevamento ad ogni caseificio
var CP{C,V}	>= 0;		# Quintali di mozzarella trasportati da ogni caseificio ad ogni punto vendita
var tot;

# VINCOLI

s.t. trasportoLatte{i in A}:
	P[i] = sum{j in C} AC[i,j];

s.t. trasportoMozzarelle{i in C}:
	r*sum{j in A} AC[j,i] = sum{j in V} CP[i,j];

s.t. totale:
	tot = r*sum{i in A}  P[i];

s.t. maxPuntoVendita{i in V}:
	sum{j in C} CP[j,i] <= tot*7/100;

s.t. maxCatena{i in Ca}:
	sum{k in C,j in V: pVc[j] = i} CP[k,j] >= tot*20/100;

s.t. maxCap{i in C}:
	sum{j in A} AC[j,i] <= cap[i];

# OBIETTIVO

minimize z: sum{i in A, j in C} AC[i,j]*(sqrt( (xA[i] - xC[j])^2 + (yA[i] - yC[j])^2 ))
			+ sum{i in V, j in C} CP[j,i]*(sqrt( (xV[i] - xC[j])^2 + (yV[i] - yC[j])^2 ))*1.5;


#####################

data;

param nA := 10;
param nV := 20;
param nC := 2;
param nCa := 4;
param r := 0.3;

param :    xC    yC   cap :=
    1       60  120    1600
    2      140  150    1800;
/*3       76  128
    4       42  141
    5       90  166
    6       85   98
    7       31  102*/

param:   xA   yA    P :=
1        30  140  320
2        25  150  460
3        30  200  190
4        42  220  400
5        58  180  380
6        21  165  440
7        14  133  280
8        68  112  200
9        70   85  295
10       51  190  145;

param:  		xV  yV  	pVc :=
     1         24   164     1
     2         30   206     2
     3         42   180     3
     4         45   140     1
     5         56   150     3
     6         69   199     1
     7         75   130     2
     8         78   240     4
     9         91   195     1
    10        104   178     2
    11        124   135     3
    12        126   148     3
    13        146   210     1
    14        150   240     2
    15        152   176     1
    16        168   231     3
    17        170   142     4
    18        180   190     4
    19        195   224     2
    20        210   171     1;
	


end;
