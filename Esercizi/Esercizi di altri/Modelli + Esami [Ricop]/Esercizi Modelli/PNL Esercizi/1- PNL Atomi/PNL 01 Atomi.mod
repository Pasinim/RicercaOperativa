# ESERCIZIO 52 - PNL Atomi 

#DATI

set Atomi := 1..10;		# Insieme degli atomi
param x {Atomi};		# Coordinate x degli atomi 
param y {Atomi};		# Coordinate y degli atomi
param z {Atomi};		# Coordinate z degli atomi
param A {Atomi};		# Parametro A degli atomi
param B {Atomi};		# Parametro B degli atomi

#VARIABILI
#Posizione dell'atomo sonda
var xx;
var yy;
var zz;
# La distanza della sonda da ogni atomo (distanza in quadrato)
var d2 {i in Atomi} = (x[i]-xx)^2 + (y[i]-yy)^2 + (z[i]-zz)^2 ;		

#OBIETTIVO
#Minimizzare l'energia di interazione complessiva tra la sonda e gli atomi
minimize w: sum {i in Atomi} (A[i] / d2[i]^6 - B[i] / d2[i]^3);


###############################
data;

param:  x    y    z		:=
  1     3.2  2.5  4.8
  2     2.1  3.7  8.4
  3     7.5  2.5  5.0
  4     6.6  1.2  4.5
  5     0.8  5.1  5.6
  6     6.3  8.8  3.5
  7     2.4  1.0  3.1
  8     1.2  4.6  9.0
  9     8.5  7.8  1.5
 10     4.1  9.3  0.9;

param:	A		B :=
 1  	1.0		200 
 2	    1.1 	400
 3 	    2.1 	320
 4 	    3.0 	250
 5 	    0.5 	400
 6 		0.2 	200
 7  	0.8 	120
 8  	1.1 	300
 9  	1.5 	100
10  	1.7		500;

end;
