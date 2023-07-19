# ESERCIZIO 3 - PNL Acceleratore

#DATI
#Valori limite della regione rettangolare nel piano cartesiano
param xmin;				# km
param xmax;				# km
param ymin;				# km
param ymax;				# km

param nCitta;			# Numero delle citta
set C := 1..nCitta;		# Insieme delle citta
# Le coordinate del centro
param x {C};
param y {C};
param r {C};			# Il raggio [km]
set A := 1..2;			# Insieme degli anelli

#VARIABILI
#Decidere dove localizzare i due anelli uguali e tangenti
# Le coordinate dei due annelli 
var xx {A};
var yy {A};
var rr {A} >=0;			# Il raggio dei due anelli

#La distanza tra il centro della citta' ed il centro dell'anello
var d {i in C, j in A} = sqrt( (x[i]-xx[j])^2 + (y[i]-yy[j])^2 );

#La distanza tra i centri degli anelli
var dd = sqrt( (rr[1]-rr[2])^2 + (rr[1]-rr[2])^2 );

#VINCOLI
#Nessun anello sia sovrapposto alle citta'
subject to Sovrapposizione {i in C, j in A}:
	d[i,j] >= r[i] + rr[j];

#I due aneli devono essere tangenti, ossia che la distanza tra i loro centri sia pari alla somma dei due raggi
subject to Tangente: dd = rr[1] + rr[2];

#I due anelli devono essere uguali, cioe' i loro raggi devono essere uguali
subject to Raggi_uguali: rr[1] = rr[2];

#Imponiamo che ciascun anello sia contenuto nela regione specificata
subject to Regione1 {j in A}: xx[j] - rr[j] >= xmin;
subject to Regione2 {j in A}: xx[j] + rr[j] <= xmax;
subject to Regione3 {j in A}: yy[j] - rr[j] >= ymin;
subject to Regione4 {j in A}: yy[j] + rr[j] >= ymax;

#OBIETTIVO
# Massimizzare il raggio dell'acceleratore, cioe rr[1] (oppure rr[2] indifferentemente)
maximize w: rr[1];

#################################

data;

param xmin := -100;
param xmax :=  100;
param ymin := -50;
param ymax :=  50;

param nCitta := 16;

param:	x		y     r :=
 1		-80		 30   5
 2 		-87		-15   2
 3		-81		-35   4
 4		-59		 25   4
 5		-25		-30   4
 6		-33		-15   2
 7		-12		  1   5
 8		 -6  	 43   5
 9		  0 	-24   8
10		 10  	 10   9
11		 20 	-15   2
12		 30  	 25   2
13		 41 	-31  10
14		 55  	 15   5
15		 69 	-10  10
16		 80      28   9;

end;
