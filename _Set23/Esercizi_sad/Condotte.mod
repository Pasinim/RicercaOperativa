# Esercizio condotte

# DATI

param nO;			# Numero luoghi di origine
param nD;			# Numero luoghi di destinazione
set O := 1..nO;
set D := 1..nD;
param c{O,D};		# Costo di trasporto [€/quintale]
param of{O};		# Quantità prodotte da ogni luogo [Quintali/giorno]
param do{D};		# Domanda di ogni ogni luogo [Quintali/giorno]

# VARIABILI

var trasp{O,D} >= 0;# Quantità trasportate ogni giorno in quintali.
var cap;

# VINCOLI

s.t. massimoQuantita{i in O}:
	sum{j in D} trasp[i,j] <= of[i];

s.t. domandaSodd{i in D}:
	sum{j in O} trasp[j,i] >= do[i];


s.t. maxcap{i in O, j in D}:
	trasp[i,j] <= cap;

#s.t. capi:
#	cap >= 0;

# OBIETTIVO

minimize z: sum{i in O, j in D} trasp[i,j]*c[i,j] ;#+ cap*50;

##############

data;

param nO := 5;
param nD := 5;

param do :=
1        410
2        200
3        400
4        315
5        300;

param of :=
1      340
2      290
3      310
4      325
5      360;

param c : 1 2 3 4 5 :=
1 15  18  23  31  16  
2 27  19  14  28  31  
3 20  15  12  25  15  
4 17  18  24  23  25  
5 26  17  17  17  28;

end;
