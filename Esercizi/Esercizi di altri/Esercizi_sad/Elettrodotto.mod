# Esercizio Elettrodotto

# DATI

param nP;					# Numero di paesi
set Paesi := 1..nP;			# Insieme dei paesi
param x{Paesi};		# Ascissa di ogni paese [km]
param y{Paesi};		# Ordinata di ogni paese [km]
param Dmax;			# Distanza limite dal paese [km]
param pred{i in Paesi: i <> 1};	# Predecessore di ogni paese
param epsilon := 0.01;

# VARIABILI

# Coordinate delle cabine di trasformazione [km]
var xc{i in Paesi} := x[i] + epsilon;
var yc{i in Paesi} := y[i] + epsilon;
var dist_cp{i in Paesi: i > 1}  = sqrt( (xc[i] - x[i])^2 + (yc[i] - y[i])^2);
var dist_e{i in Paesi: i > 1}  = sqrt((xc[i] - xc[pred[i]])^2 + (yc[i] - yc[pred[i]])^2);

# = è una definizione.

# VINCOLI

s.t. xc1: xc[1] = x[1];
s.t. yc1: yc[1] = y[1];

s.t. Distanza_limite_sup{i in Paesi: i > 1}:
	dist_cp[i] <= Dmax;
s.t. Distanza_limite_inf{i in Paesi: i > 1}:
	dist_cp [i] >= epsilon;

#s.t. CabinaAx: xc[1] = x[1];
#s.t. CabinaAy: yc[1] = y[1];

/*
# Distanza tra nodi dell'elettrodotto
s.t. Distanza_e{i in Paesi : i > 2}:
	dist_e[i]^2 = (xc[i] - xc[pred[i]])^2 + (yc[i] - yc[pred[i]])^2;

s.t. Distanza_e2:
	dist_e[1]^2 = (xc[2] - x[1])^2 + (yc[2] - y[1])^2;
*/

s.t. Distanza_limite{i in Paesi: i > 1}:
	dist_cp[i] <= Dmax;

# OBIETTIVO

#minimize Tizio: sum{i in Paesi: i > 1} dist_cp[i];
#minimize Caio:  sum{i in Paesi: i > 1} dist_e[i]; 
minimize Sempronio: sum{i in Paesi: i > 1} (1.5*dist_cp[i] + dist_e[i]);

#####################

data;

param nP := 16;
param:	x	y :=
1	0	0
2	4	8
3	10	12
4	15	12
5	22	28
6	31	30
7	40	34
8	42	46
9	50	50
10	25	15
11	32	15
12	37	10
13	46	13
14	31	38
15	28	45
16	35	54;

param pred :=
2	1
3	2
4	3
5	4
6	5
7	6
8	7
9	8
10	4
11	10
12	11
13	12
14	6
15	14
16	15;

param Dmax := 2;

end;
