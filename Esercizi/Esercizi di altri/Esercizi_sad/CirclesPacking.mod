# Esercizio Circles Packing

# DATI

param nC;			# Numero cerchi
set C := 1..nC;		# Insieme dei cerchi
param rC{C};		# Raggio dei cerchi [cm]

# VARIABILI

var xC{C} >= 0;			# posizione X dei cerchi
var yC{C} >= 0;			# posizione Y dei cerchi 
var rgrande >= 0 := 100;		# raggio del cerchio grande[cm]
#var xgrande >= 0 := rgrande;		# posizione X cerchio grande
#var ygrande >= 0 := rgrande;		# posizione Y cerchio grande

# VINCOLI

s.t. nonSovrapposti{i in C, j in C: i <> j}:
	(xC[i]-xC[j])^2 + (yC[i] - yC[j])^2 >= (rC[i] + rC[j])^2;

s.t. dentroCerchioGrande{i in C}:
	(xC[i]-rgrande)^2 + (yC[i] - rgrande)^2 <= (rgrande - rC[i])^2;


# OBIETTIVO

minimize z: rgrande;

####################

data;

param nC := 5;


param rC :=
1 2
2 4 
3 7 
4 6 
5 1;

 
end;
