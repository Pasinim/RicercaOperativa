#ESERICIZIO 1bis - PL Radioterapia

#DATA
param nO;					# Numero organi
set O := 1..nO;				# Insieme organi
param nP;					# Numero posizioni
set P := 1..nP;				# Insieme posizioni
param m {O};				# Massima intensità di radiazione ammissibile per ogni organo
param r {P};				# massima intensità di radiazione erogabile da ogni posizione
param a {O,P};				# Coefficienti di assorbimento delle radiazioni per gli organi adiacenti
param R;					# Massima quantita di radiazione erogabile complessiva
param perc_tumore {P};		# Coefficienti di assorbimento delle radiazioni per il tumore

#VARIABILI
# Decidere la quantita' di radiazione da erogare da ogni posizione
var x {P}>=0;			# Quantita di radiazione

#VINCOLI
# La radiazione complessiva sia non superiore a R
subject to Total_radiation:
	sum {j in P} x[j] <= R;

# La radiazione erogata da ogni posizione non sia superiore al limite massimo r
subject to Radiazione_Posizione {j in P}:
	x[j] <= r[j];

# La radiazione assorbita da ogni organo non sia superiore al limite massimo m
subject to Radiazione_organo {i in O}:
	sum {j in P} a[i,j] * x[j] <= m[i];

#OBIETTIVO
# Massimizzare la radiazione che colpisce il tumore
maximize z : sum {j in P} perc_tumore[j] * x[j];

###################################
data;
param nO := 7;
param nP := 5;
param R := 60;

param a:    1     2     3     4     5 :=
1           0.1   0.0   0.0   0.1   0.2
2           0.1   0.0   0.15  0.0   0.1
3           0.0   0.1   0.0   0.0   0.0
4           0.0   0.2   0.1   0.1   0.0
5           0.1   0.0   0.2   0.0   0.1
6           0.1   0.3   0.15  0.1   0.1
7           0.2   0.1   0.15  0.0   0.0;

param perc_tumore :=
1	0.4
2	0.3
3	0.25
4	0.7
5	0.5;

param r :=
1	12
2	13
3	10
4	15
5	15;

param m :=
1	5.5
2	9.0
3	6.0
4	2.4
5	7.0
6	5.5
7	9.5;

end;

