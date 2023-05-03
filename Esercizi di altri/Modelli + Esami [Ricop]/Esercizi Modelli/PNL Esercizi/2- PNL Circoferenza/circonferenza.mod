# ESERCIZIO 2 - PNL Circonferenza (Caso 1)

#DATI
#Circonferenza di centro C
param xc;		# Coordinata x 
param yc;		# Coordinata y
param r;		# Raggio

#VARIABILI
# Trovare una retta appartenente al fascio di rette dato
#Determinare il punto P in cui la retta e la circonferenza sono tangenti
var xp;
var yp;
var z;

#VINCOLI
#Il problema non ha altri vincoli
subject to Distanza:
	r = sqrt( (xc-xp)^ 2 + (yc-yp)^2 );

#OBIETTIVO
#Massimizzare il valore di z
maximize w: a * xp + b * yp;

######################
data;





end;
