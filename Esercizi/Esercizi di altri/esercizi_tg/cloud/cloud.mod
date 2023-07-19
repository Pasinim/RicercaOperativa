# ESERCIZIO CLOUD

param n;
set S := 1..n;
param cf {S};	# costo fisso per tutto l anno[$] 
param cv {S};	# costo variabile [$/h]
param epsilon;
 
# VARIABILI
var costo; # costo [$]
var q;	# domanda [h]

# VINCOLI
# vincoli per linearizzare
subject to Minimo {i in S}:
	costo <= cf[i] + cv[i] * q;

# OBIETTIVO
maximize z: costo;
subject to Parametric: q <= epsilon;

data;

param epsilon := 5479;

param n := 4;

param : cf 	   cv :=

1 		1560   0.128
2 		1280   0.192
3 		552	   0.312
4		0	   0.640;


end;
