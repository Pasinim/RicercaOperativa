# Esercizio Segherie

# DATI

param nP;		# Numero punti di raccolta
set P := 1..nP;	# Insieme dei punti di raccolta
param xP{P};	# Posizione X del punto di raccolta, espresso come frazione del lato del quadrato di 100km
param yP{P};    # Posizione Y del punto di raccolta, espresso come frazione del lato del quadrato di 100km
param Q{P};		# Quantità di legname giornaliera [quintali]
param costo;	# Costo di trasporto [Lire/(Km*quintale)]
param nS;		# Numero di segherie
set S := 1..nS; # Insieme delle segherie
param xS{P};	# Posizione X delle segherie possibili, espresso come frazione del lato del quadrato di 100km
param yS{P};	# Posizione Y delle segherie possibili, espresso come frazione del lato del quadrato di 100km
param C{S};		# Costo manutenzione [migliaia di lire]
param CAP{S};	# Capacità giornaliera [quintali]

# VARIABILI

var SS{S} binary;		# Scelta segherie. 1 se costruita, 0 altrimenti
var f{P,S} >= 0;		# Quintali da punto di raccolta a segheria

# VINCOLI

s.t. maxFlusso{i in S}:
	sum{j in P} f[j,i] <= CAP[i]*SS[i];

s.t. tuttaLaLegna{i in P}: 
	sum{j in S} f[i,j] = Q[i];

# OBIETTIVO

minimize z: sum{i in S}C[i]*SS[i] + 
            (sum{i in P, j in S}f[i,j]*sqrt( ( (xP[i]-xS[j])*100)^2 + ( (yP[i]-yS[j])*100)^2 )*costo)/1000; 

data;

param nP := 15;
param costo := 10000;
param nS := 5;

param: xS yS C CAP :=
1 0.25 0.20           3000                 190 
2 0.55 0.25           4500                 240
3 0.90 0.15           3000                 200
4 0.15 0.45           4400                 220
5 0.85 0.55           4600                 190;


param: xP yP Q :=
1 	0.40 0.66 58
2	0.76 0.17 35
3 	0.11 0.47 27
4 	0.65 0.58 42
5	0.18 0.88 60
6 	0.19 0.02 31
7	0.62 0.62 18
8 	0.90 0.17 24
9 	0.66 0.95 36
10 	0.42 1.00 37
11 	0.95 0.12 48
12 	0.16 0.26 39
13 	0.07 0.71 53
14 	0.75 0.43 61
15 	0.30 0.76 29;

end;
