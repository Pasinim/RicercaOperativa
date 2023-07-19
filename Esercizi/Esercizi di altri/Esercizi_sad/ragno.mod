# Esercizio Ragno (PNL)

# DATI
set N := 0..2;
param xa {N};		# cm
param ya {N};		# cm
param za {N};		# cm
param Amin; 		# cmq


# VARIABILI

var xv {i in N} := xa[i];				# cm
var yv {i in N} := ya[i];				# cm
var zv {i in N}	:= za[i];				# cm

var lato{i in N} := 
				  sqrt((xv[(i+1) mod 3] - xv[(i+2) mod 3])^2 
				  + (yv[(i+1) mod 3] - yv[(i+2) mod 3])^2 
				  + (zv[(i+1) mod 3] - zv[(i+2) mod 3])^2);
				  	# Lunghezza del lato [cm]
				  	
var p := sum{i in N} lato[i] /2;				# Semiperimetro [cm]
var link{i in N} = sqrt((xv[i] - xv[i])^2 
				+ (yv[i] - yv[i])^2 
				+ (zv[i] - zv[i])^2);		# Collegamenti degli appigli[cm]

# VINCOLI

# Definizione dell'area del triangolo [cm^2]
s.t. Area:
	p*(p-lato[0])*(p-lato[1])*(p-lato[2]) >= Amin^2;


# OBIETTIVO

# Minimizzare lunghezza struttura portante[cm]
minimize w: sum{i in N} (lato[i] + link[i]);

###########################
data;

param:  xa  ya  za :=
0		30  50  50
1 		60  10  45 
2 		40  30  10;

param Amin := 100;
end;

