# Esercizio Evacuazione

# DATI

param nR;		# Numero strutture ricettive
param nT;		# Numero rifugi temporanei
set R := 1..nR; # Insieme strutture ricettive
set T := 1..nT; # Inieme rifugi temporanei
param CAP{R};	# Capienza strutture ricettive
param RIF{T};	# Numero rifugiati per rifugio
param CS{T,R};	# Costo spostamento per persona [€/persona]
param TS{T,R};	# Tempo spostamento per persona [h/persona]
param CT;		# Capacità massima per spostamento

# VARIABILI

var s{T,R} >= 0 <= CT;		# Numero persone trasportate da un rifugio ad una struttura ricettiva [persona]
var te{T,R} >= 0;			# Tempo necessario ad effettuare lo spostamento [h]
var maxTempo >= 0;
var eta;

# VINCOLI

s.t. personeDaTrasportare{ i in T}:
	sum{j in R} s[i,j] = RIF[i]; 

s.t. massimoRifugio{i in R}:
	sum{j in T} s[j,i] <= CAP[i];

s.t. tempo{i in T,j in R}:
	s[i,j]*TS[i,j] = te[i,j];

s.t. massimoTempo{ i in T, j in R}:
	maxTempo >= te[i,j];

#s.t. tempo1:
#	maxTempo <= 120 ;

#s.t. costo:
 #   1250000 >= sum{i in T, j in R} s[i,j]*CS[i,j];

#s.t. etaDef1:
 #eta = sum{i in T, j in R} s[i,j]*CS[i,j] / 1250000;
 
#s.t. etaDef2:
# eta = maxTempo/120;
 

# OBIETTIVO

#minimize z: sum{i in T, j in R} s[i,j]*CS[i,j];

minimize z: sum{i in T, j in R} s[i,j]*CS[i,j] + maxTempo*500;


data;

param nR := 6;
param nT := 3;
param CAP :=
1     500
2     650
3     550
4     550
5     550
6     400;
param RIF :=
1  850
2 1250
3  900;
param CS : 1    2    3    4    5    6 :=
 1   250  350  300  380  310  340
 2   280  420  450  390  375  350
 3   360  410  420  400  380  290;
 
param TS : 1    2    3    4    5    6 :=
 1   0.20 0.35 0.40 0.25 0.25 0.30 
 2   0.35 0.50 0.45 0.35 0.45 0.40 
 3   0.25 0.35 0.45 0.40 0.30 0.40;

param CT := 400;

end;
