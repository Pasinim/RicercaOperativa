#ESERCIZIO 10 - PNL Robot

#DATI
param nR;				# Numero di robot
set R := 1..nR;			# Insieme dei robot
param r {R};		# I raggi d'azione [cm]

#VARIABILI
# Coordinate dei robot [cm]
var x {R};
var y {R};

#VINCOLI
# La distanza tra i due robot >= della somma dei raggi
subject to no_Overlap {i in R, j in R: i<j}:
	(x[i]-x[j])^2 + (y[i]-y[j])^2 >= (r[i] + r[j])^2;

#OBIETTIVO
# Minimizzare la somma di tutte le distanze tra i robot 
minimize z : sum {i in R, j in R: i<j} sqrt((x[i]-x[j])^2 + (y[i]-y[j])^2);

###################################
data;

param nR := 6;

param r :=
1      120
2       80
3      100 
4       70
5       45
6      120;
 
#Inizializziamo le variabili
 var:	x		y :=
 1		-100	200
 2		-200	300
 3		300		400
 4		-400	-500
 5		500		-600
 6		600		700;
 
 
end;
