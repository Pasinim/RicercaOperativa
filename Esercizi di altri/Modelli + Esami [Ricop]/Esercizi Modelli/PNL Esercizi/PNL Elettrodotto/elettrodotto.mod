#ESERCIZIO 67 - PNL Elettrodotto

#DATI
param nP;						# Numero paesi
set Paesi := 1..nP;				# Insieme dei paesi
param x {Paesi};				# Coordinate cartesiane delle centraline nei paesi [km]
param y {Paesi}; 				# Coordinate cartesiane delle centraline nei paesi [km]
param dist_lim;					# Distanza limite consentita tra la cabina di trasformazione e la centralina nel paese [km]
param pred {Paesi};				# I predecessori di ogni paese

#VARIABILI
# Posizione cabine di trasformazione
# Decidere dove localizzare le cabine di ogni paese
var xc {i in Paesi} := x[i];
var yc {i in Paesi} := y[i];

#VINCOLI
# Le dobbiamo mettere piu' vicine alla centralina del paese
# Vincolo sulla massima distanza limite tra cabine e centraline
subject to Distanza_limite {i in Paesi}:
	(x[i]-xc[i])^2 + (y[i]-yc[i])^2 <= dist_lim^2;

#OBIETTIVO
#minimize zTizio: sum {i in Paesi} sqrt((x[i]-xc[i])^2 + (y[i]-yc[i])^2);

# La somma di tutti i segmenti dell'elettrodotto (da ogni cabina alla successiva)
minimize zCaio: sum {i in Paesi: i <> 1} sqrt((xc[i]-xc[pred[i]])^2 + (yc[i]-yc[pred[i]])^2);

##############################
data;

param nP := 16;

param:	x	y	:=
1		0	0
2		4	8
3		10	12
4		15	12
5		22	28
6		31	30
7		40	34
8		42	46
9		50	50
10		25	15
11		32	15
12		37	10
13		46	13
14		31	38
15		28	45
16		35	54;

param pred :=
1	1
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

param dist_lim := 2;

end;
