# Esercizio Produzione

# DATI

set mesi := 1..12;				# Insieme dei mesi.
set prodotti;					# Insieme dei prodotti.
param cprod{mesi,prodotti};		# Costi di produzione per ogni mese per prodotto [€/u].
param cstoc{mesi};				# Costi di stoccaggio per unità di prodotto in ogni mese [€/u].
param cap{mesi,prodotti};		# Capacità produttiva per ogni mese per prodotto [u].
param domanda {mesi,prodotti};	# Domanda per ogni mese di ogni prodotto [u].
param capMagazzino;				# Capacità del magazzino [u].

# VARIABILI

var produzione{mesi,prodotti} >= 0;			# Produzione per ogni mese di ogni prodotto [u].
var magazzino{mesi,prodotti} >= 0;			# Contenuto del magazzino in ogni mese per ogni prodotto [u].

# VINCOLI

# VINCOLO MASSIMA PRODUZIONE POSSIBILE PER OGNI MESE PER PRODOTTO.
s.t. maxProduzione{i in  mesi, j in prodotti}:
	produzione[i,j] <= cap[i,j];

# VINCOLO MAX OCCUPAZIONE DEL MAGAZZINO PER OGNI MESE
s.t. maxMagazzino{i in mesi}:
	sum{j in prodotti} magazzino[i,j] <= capMagazzino;

# VINCOLO DI FLUSSO PER IL MAGAZZINO
s.t. contenutoMagazzino{ j in prodotti, i in mesi : i <> 1}:
	(produzione[i,j]+magazzino[i-1,j])- domanda[i,j] = magazzino[i,j];

s.t. contenutoMagazzino0{j in prodotti}:
	produzione[1,j] - domanda[1,j] = magazzino[1,j];

# VINCOLO SODDISFAZIONE DOMANDA PER OGNI MESE
s.t. produzioneMensile{i in mesi, j in prodotti: i > 1}:
	produzione[i,j] + magazzino[i-1,j] >= domanda[i,j];

# OBIETTIVO

minimize z : sum{i in mesi, j in prodotti}(cprod[i,j]*produzione[i,j] + (magazzino[i,j])*cstoc[i]);

######################

data;

set prodotti := X Y;

param cprod :	   X            Y :=
1          		 125          240
2         		 140          245
3            	 140          230
4        	   	 150          230
5           	 130          225
6 			     120          220
7                100          215
8                170          240
9                135          225
10               145          235
11               160          240
12               175          250;

param cstoc := 
1           45
2           45
3           40
4           25
5           20
6           10
7           10
8           10
9           15
10          25
11          35
12          40;



param cap: 		   X            Y :=
1               2400         1000
2               2300          900
3               2500         1000
4               2500         1000
5               2450         1000
6               2550         1000
7               2300          900
8               1200          400
9               2200         1000
10              2500         1000
11              2500         1000
12              1800          700;


param domanda:     X            Y :=
1               1800          500
2               1700          400
3               1800          500
4               1800          600
5               1900          700
6               2300          800
7               2500          900
8               2500         1000
9               2000          800
10              1800          800
11              1700          800
12              2000         1000;

param capMagazzino := 2500;

end;

