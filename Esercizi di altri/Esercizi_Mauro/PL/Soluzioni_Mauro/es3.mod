# Esercizio 3: Cereali

# Dati

param t;					# Nr. terreni
set T := 1..t;				# Terreni
param dim {T};				# Dimensioni terreni [acri]
param c;					# Nr. cereali
set C := 1..c;				# Cereali
param profitti {C};			# Profitti x tipo cereale [€/q]
param occupazione {T,C};	# Occupazione cereali in terreno [acri]
param acqua {C};			# Acqua utilizzata da cereale [m^3]
param max_acqua;			# Volume massimo acqua [m^3]

# Variabili

var Cereali {T,C} >= 0;	# Quantità cereali coltivati [q]

# Vincoli

# Spazio massimo utilizzabile dai cereali
subject to Max_area {i in T}:
	sum {j in C} Cereali[i,j]*occupazione[i,j] <= dim[i];

# Acqua massima utilizzabile dai cereali
subject to Max_acqua:
	sum {i in T, j in C} Cereali[i,j]*acqua[j] <= max_acqua;

# Obiettivo

maximize z:
	sum {i in T, j in C} Cereali[i,j]*profitti[j];

##################

data;

param t := 2;
param c := 6;
param dim :=
	1	200
	2	400;
param profitti :=
	1	48
	2	62
	3	28
	4	36
	5	122
	6	94;
param occupazione :
		1       2       3       4       5       6 :=
	1	0.02    0.03    0.02    0.016   0.05    0.04
	2	0.02    0.034   0.024   0.02    0.06    0.034;
param acqua :=
	1	     120
	2	     160
	3	     100
	4	     140
	5	     215
	6	     180;
param max_acqua := 400000;

end;
