# Esercizio Mars Express

# DATI
param nO;
param nM;
set Orbite := 1..nO;
set Memorie := 1..nM;
param a {Orbite,Memorie};
param d {Orbite};
param c {Memorie};
param y0 {Memorie};
param bitrate;

# VARIABILI
var x {Orbite,Memorie} >=0;                 # Quantità di dati scaricati da ogni memoria in ogni orbita [Mbit]
var y {Orbite,m in Memorie} >=0, <=c[m];    # Quantità dati in memoria dopo ogni orbita [Mbit]
var z {Orbite,Memorie} >=0;                 # Quantità di dati dopo trasmissione prima di input [Mbit]
var w;

# VINCOLI
subject to Flow_conservation_1 {o in Orbite, m in Memorie: o>1}:
  y[o-1,m] - x[o,m] = z[o,m];
subject to Prima_orbita {m in Memorie}:
  y0[m] - x[1,m] = z[1,m];
subject to Flow_conservation_2 {o in Orbite, m in Memorie}:
  z[o,m] + a[o,m] = y[o,m];

subject to Capacity_orbite {o in Orbite}:
  sum {m in Memorie} x[o,m] <= d[o]*bitrate;

# OBIETTIVO
minimize maxliv: w;
subject to minmax {o in Orbite, m in Memorie}:
  w >= y[o,m]/c[m];

#####
data;
#####

param nO := 10;
param nM := 5;

param a :	1	2	3	4	5	:=
	1		35	0	80	25	50	
	2		200	70	100	25	0	
	3		0	150	0	25	100	
	4		600	300	0	25	75	
	5		200	0	210	25	200	
	6		50	0	85	0	45	
	7		40	60	50	0	300	
	8		300	90	20	60	0	
	9		0	100	100	60	20	
	10		0	20	100	60	250;

param d :=
1	45
2	47
3	55
4	45
5	35
6	42
7	30
8	35
9	44
10	40;

param : c 	y0:=
1	1000	500
2	1200	600
3	1000	500
4	 500	250
5	 700	350;

param bitrate := 9.00;

end;
