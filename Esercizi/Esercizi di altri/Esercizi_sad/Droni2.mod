# Esercizio Droni

# DATI

param nP;		# Numero punti
set P := 1..nP;	# Insieme dei punti
param X{P};		# Coordinata X dei punti
param Y{P};		# Coordinata Y dei punti
param r;		# Raggio minimo del drone [unità]
	
# VARIABILI

var a1;
var a2;
var b1 = 1 - a1^2;
var b2 = 1 - a2^2;
var c1;
var c2;
var a3;
var b3 = 1 - a3^2;
var c3;
var a4;
var b4 = 1 - a4^2;
var c4;
var r1 >= r := 4;
var xc >= 0:= 3;
var yc >= 0 := 4;
var y2 >= 10 <= 30 := 13;
var x2 >= 10 <= 30 := 10;
var x1 >= 10 <= 30 := 12;
var y1 >= 10 <= 30 := 11;
var angolo;

# VINCOLI

# Normalizzazioni
#s.t. retta1:
#	a1^2 + b1^2 = 1;
#s.t. retta2: 
#	a2^2 + b2^2 = 1;
#s.t. retta3:
#	a3^2 + b3^2 = 1;
#s.t. retta4:
#	a4^2 + b4^2 = 1;

# Retta che passa per x1 e per il centro della circonferenza
s.t. passaPerCentro:
	a3*xc + b3*yc + c3 = 0;
s.t. passaPer1:
	a3*x1 + b3*y1 + c3 = 0;

# Retta che passa per x2 e per il centro della circonferenza
s.t. passaPerCentro1:
	a4*xc + b4*yc + c4 = 0;
s.t. passaPerB2:
	a4*x2 + b4*y2 + c4 = 0;

s.t. passaPerA:
	a1*X[1] + b1*Y[1] + c1 = 0;

s.t. passaPerB:
	a2*X[2] + b2*Y[2] + c2 = 0;

s.t. passaPerP1:
	a1*x1 + b1*y1 + c1 = 0;
	
s.t. passaPerP2:
	a2*x2 + b2*y2 + c2 = 0;


# Definizione circonferenza
s.t. passaPerCirc:
	(x1-xc)^2+(y1-yc)^2 = r1^2;
	
s.t. passaPerCirc1:
	(x2-xc)^2+(y2-yc)^2 = r1^2;
	
s.t. passaPerCirc2:
	(X[3]-xc)^2+(Y[3]-yc)^2 = r1^2;

# Rette perpendicolari
s.t. perpendicolare1:
	a1*a3 + b1*b3 = 0;

s.t. perpendicolare2:
	a2*a4 + b2*b4 = 0;


#s.t. calcoloAngolo:
#	angolo = 2*asin( sqrt( (x1-x2)^2 + (y1-y2)^2) /2*r1);

# OBIETTIVO

minimize z: sqrt( (X[1]- x1)^2 + (Y[1] - y1)^2 +30) 
          + sqrt( (X[2]-x2)^2 + (Y[2] - y2)^2 +30) ;
          #+ angolo*r1;
#minimize z : sqrt( (x1-x2)^2 + (y1-y2)^2);

############################

data;

param nP := 3;

param: X  Y :=
1	   0  0
2	  20  0 
3     15 15;

param r := 1;

end;
