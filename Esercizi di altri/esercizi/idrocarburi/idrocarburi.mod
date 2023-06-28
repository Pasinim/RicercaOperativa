

# Esercizio idrocarburi


# DATI
set Benzine;
set Sostanze;

param b {Sostanze}; # quantita disponibili [barili/giorno]
param p {Sostanze}; # prezzo di acquisto delle sostanze [$/barile]
param c {Benzine};  # prezzo di ventita delle benzine [$/barile]
param fmin {Sostanze,Benzine}; # frazione minima di ogni sostanza in ogni benzina
param fmax {Sostanze,Benzine};# frazione massima di ogni sostanza in ogni benzina


# VARIABILI
#var f {i in Sostanze,j in Benzine} >= fmin[i,j], <= fmax[i,j]; # frazione di sostanza i in benzina j
# quantità di sostanza i in benzina j [barili/giorno]

var x {i in Sostanze, j in Benzine} >= 0;
var totb {Benzine}; # produzione di ogni benzina[barili/giorno]
var tots {Sostanze};# consumo totale di ogni sostanza

# VINCOLI
# definizione totale di benzine e totale sostanze [barili/giorno]
subject to Tot_b {j in Benzine}: totb[j] = sum {i in Sostanze} x[i,j] ;
subject to Tot_s {i in Sostanze}: tots[i] = sum {j in Benzine} x[i,j] ;


# massimo consumo di sostanze [barili/giorno]
subject to Consumi {i in Sostanze}:
   sum {j in Benzine} x[i,j] <= b[i];

# frazione minima per ogni sostanza e per ogni benzina [barile/giorno]
subject to Frazione_minima {i in Sostanze, j in Benzine}:
   x[i,j] >= fmin[i,j] * totb[j];

# frazione massima per ogni sostanza e per ogni benzina [barile/giorno]
subject to Frazione_massima {i in Sostanze, j in Benzine}:
   x[i,j] <= fmax[i,j] * totb[j];

# Obbiettivo

# massimizzare i profitti [$/giorno]
maximize z: sum{j in Benzine} c[j]*totb[j] - sum{i in Sostanze} p[i]*tots[i];


#####################
data;
set Benzine  := Super Normale Verde;
set Sostanze := A  B  C  D;


param :       b         p  :=
A			3000		3
B			2000		6
C			4000		4
D			1000		5;

param       c :=
Super		5.5
Normale		4.5
Verde		3.5;


param fmin:	Super	Normale	Verde :=
A	        0.0	    0.0	    0.0
B	        0.4	    0.1 	0.0
C	        0.0	    0.0 	0.0
D	        0.0	    0.0 	0.0;

param fmax:	Super	Normale	Verde :=
A	        0.3	    0.5	    0.7
B	        1.0 	1.0 	1.0
C	        0.5	    1.0 	1.0
D	        1.0	    1.0 	1.0;

end;
