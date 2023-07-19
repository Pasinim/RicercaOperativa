# ESERCIZIO 4 - PNL Cerchi impaccati

#DATI
set C := 1..5;			# Insieme cerchi
param r {C};			# I raggi dei cerchi
#Le coordinate del cerchio contenente
param xCerchio;
param yCerchio;

#VARIABILI
#Dove localizzare ciascun cerchio dato

#Le coordinate cartesiane del centro
var x {C};
var y {C};
var z;					# IL raggio del cerchio contenente

#La distanza tra il centro del cerchio e l'origine
var d {i in C} = sqrt( (x[i]-xCerchio)^2 + (y[i]-yCerchio)^2 );

#La distanza tra due cerchi
var dCC {i in C, j in C: i<>j} = sqrt( (x[i]-x[j])^2 + (y[i]-y[j])^2 );

#VINCOLI
#Ogni cerchio sia interno al cerchio contenente
subject to Contenente {i in C}:
	d[i] <= z - r[i];

#I cerchi devono essere non sovrapposti
subject to Non_sovrapposti {i in C, j in C: i<>j}:
	dCC[i,j] >= r[i]+ r[j];

#OBIETTIVO
#Minimizzare il raggio z del cerchio contenente
minimize obj: z;

############################
data;

param xCerchio := 0;
param yCerchio := 0;

param r :=
1	 2
2	 4
3	 7
4	 6
5	 1;

end;
