# ESERCIZIO 52 - PNL Atomi 

#DATI

param nAtomi;			# Numero degli atomi
set N := 1..nAtomi;		# Insieme degli atomi

#Le coordinate x,y,z degli atomi
param x {N};
param y {N};
param z {N};

#I coefficienti degli atomi
param A {N};
param B {N};

#VARIABILI
#Decidere dove localizzare il punto di minimo energia (la sonda)
var xx;
var yy;
var zz;

var r {N}>=0;			# La distanza della sonda da ogni atomo
var e {N};				# L'energia di interazione tra la sonda e l'atomo

#VINCOLI

#Vincoli che legano i valori delle variabili r{N} alle variabili (xx,yy,zz)
subject to Distanza {i in N}:
	r[i] = sqrt( (x[i]-xx)^2 + (y[i]-yy)^2 + (z[i]-zz)^2 );

# I valori delle variabili e{N} in funzione delle r{N}
subject to Energia {i in N}:
	e[i] = A[i] / r[i]^12 - B[i] / r[i]^6;

#OBIETTIVO
#Minimizzare l'energia di interazione complessiva tra la sonda e gli atomi
minimize w: sum {i in N} e[i];


###############################
data;

param nAtomi := 10;

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
