# Esercizio orbite

# Dati
param nM;
param nO;
set memorie := 1..nM;
set orbite := 1..nO;
param c{orbite,memorie};			# Dati in input [Mbit]
param durate{orbite};				# Durata TW per le trasmissionisioni [min]
param bitRate;
param cap{memorie};					# Capacità di ogni memoria [Mbit]
param c0{memorie};					# Livello iniziale di occupazione di ogni memoria [Mbit]

# Variabili
var x {o in orbite, m in memorie} >= 0;		# Dati Trasmessi alla fine di ogni orbita [Mbit]
var y {o in orbite, m in memorie} >= 0;		# Dati in memoria alla fine di ogni TW (time window)  [Mbit]
var z {o in orbite, m in memorie} >= 0;		# Dati in memoria dopo la trasmissione e prime della ricezione in ogni TW [Mbit]
var w; # Massimo livello di riempimento [a-dimensionale]

# Vincoli

# Capacità in trasmissione [Mbit]
s.t. limiteOrbite{o in orbite}:
	sum {m in memorie} x[o, m] <= durate[o]*bitRate; 

# subject to  # Finire. Vincoli conservazione del flusso

s.t. capacity {o in orbite, m in memorie}:
	y[o,m] <= cap[m];

s.t. flow_conversation{o in orbite, m in memorie : o > 1}:
	y[o-1,m] = x [o,m]+ z[o,m];

s.t. flow_conversation2{o in orbite, m in memorie}:
	z[o,m] + c[o,m] = y[o,m];

s.t. flow_conversation0{ m in memorie}:
	c0[m] = x[1,m] + z[1,m];

# Obiettivo

minimize maxliv: w;

subject to Minmax {m in memorie, o in orbite}: w >= y[o,m]/cap[m];

##########
data;

param nM := 5;
param nO := 10;

param c : 1 2  3 4 5 :=
1 35 0 80 25 50
2 200 70 100 25 0
3 0 150 0 25 100
4 600 300 0 25 75
5 200 0 210 25 200
6 50 0 85 0 45
7 40 60 50 0 300
8 300 90 20 60 0
9 0 100 100 60 20
10 0 20 100 60 250;

param durate :=
1 45
2 47
3 55
4 45
5 35
6 42
7 30
8 35
9 44
10 40;

param bitRate := 9;

param: cap c0 :=
1 1000 500
2 1200 600
3 1000 500
4 500 250
5 700 350;


end;
