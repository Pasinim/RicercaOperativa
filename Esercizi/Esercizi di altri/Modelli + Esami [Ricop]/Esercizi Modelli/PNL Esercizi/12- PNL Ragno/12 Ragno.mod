# ESERCIZIO 12 - PNL Ragno

#DATI
set N := 0..2;					# Insieme degli appigli/vertici del triangolo
#Coordinate degli appigli
param x {N};
param y {N};
param z {N};
param A;						# Area minima richiesta

#VARIABILI
#Coordinate dei vertici del triangolo
var xx {N};
var yy {N};
var zz {N};
#Lunghezze dei lati
var lato {i in N} = sqrt( (xx[(i+1) mod 3] - xx[(i+2) mod 3])^2 + 
						  (yy[(i+1) mod 3] - yy[(i+2) mod 3])^2 +
						  (zz[(i+1) mod 3] - zz[(i+2) mod 3])^2 
						 );

#Semiperimetro
var p = sum {i in N} lato[i] / 2;

#VINCOLI
# Definizione e vincolo sull'area del triangolo
subject to AreaMinimia:
	p * (p-lato[0]) * (p-lato[1]) * (p-lato[2]) >= A^2;

#OBIETTIVO
minimize w: sum {i in N} lato[i] +
			sum {i in N} sqrt ( (xx[i]-x[i])^2 + (yy[i]-y[i])^2 + (zz[i]-z[i])^2 );


####################
data;

param:	x	y	z :=
0		30	50	50
1		60	10	45
2		40	30	10;

param A := 100;

end;
