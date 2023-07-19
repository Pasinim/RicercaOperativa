# Esercizio n.1 bis: Radioterapia
# Dati

param o;			# Nr. organi + 1 (tumore)
param p;			# Nr. posizioni
param R;			# Radiazione massima generale [Gray]
set O := 0..o-1;		# Tumore+Organi
set P := 1..p;		# Posizioni
param max_o {O};	# Radiazione massima x organo [Gray]
param max_p {P};	# Radiazione massima x posizione [Gray]
param perc {O,P};	# % assorbita dall'organo O in posizione P

# Variabili

var x {P} >=0 ;		# Quantità di radiazioni per ogni posizione [Gray]

# Vincoli

subject to Max_pos {i in P}:					# Radiazioni massime x posizione
	x[i] <= max_p[i];

subject to Max_org {i in O: i<>0}:
	sum {j in P} x[j]*perc[i,j] <= max_o[i];	# Radiazioni massime x organo
	
subject to Max_tot:								# Radiazioni massime totali
	sum {i in P} x[i] <= R;

# Obiettivo

maximize z:
	sum {i in P} x[i]*perc[0,i];

#########################

data;

param o := 8;
param p := 5;
param R := 60;
param max_o :=  
	1     5.5
	2     9
	3     6
	4     2.4
	5     7
	6     5.5
	7     9.5;
param max_p :=
	1	12
	2	13
	3	10
	4	15
	5	15;
param perc:
		  1 	   2 		3 		  4 	   5 :=
	0   0.4      0.3      0.25      0.7      0.5
	1   0.1      0.0      0.0       0.1      0.2
	2   0.1      0.0      0.15      0.0      0.1
	3   0.0      0.1      0.0       0.0      0.0
	4   0.0      0.2      0.1       0.1      0.0
	5   0.1      0.0      0.2       0.0      0.1
	6   0.1      0.3      0.15      0.1      0.1
	7   0.2      0.1      0.15      0.0      0.0;

end;
