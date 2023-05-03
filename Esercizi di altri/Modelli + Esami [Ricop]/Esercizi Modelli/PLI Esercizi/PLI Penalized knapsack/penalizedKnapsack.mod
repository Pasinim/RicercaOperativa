#ESERCIZIO PLI Penalized Knapsack

#DATI
param nO;								# Numero di oggetti
set Oggetti := 1..nO;					# Insieme degli oggetti
param valore {Oggetti};					# Valore degli oggetti
param volume {Oggetti};					# Volume degli oggetti
param penalty {Oggetti};				# Penalita' degli oggetti
param capacity;							# La capacita disponibile

#VARIABILI
var x {Oggetti} binary;			# Oggetto selezionato dentro lo zaino oppure no
var delta;						# Massima penalty tra gli oggetti scelti

#VINCOLI
#Vincolo di capacita'
subject to Capacity:
	sum{o in Oggetti} volume[o] * x[o] <= capacity;

#OBIETTIVO
# Massimizzare valore diminuito della penalty
maximize z: sum {o in Oggetti} valore[o] * x[o] - delta;
# delta deve essere maggior uguale alla penalty dell'oggetto "o" se l'oggetto "o" viene scelto
# questi vincoli e' come se non ci fossero per gli oggetti non-scelti
subject to minMax {o in Oggetti}: delta >= penalty[o] * x[o];

###################
data;

param nO := 30;

param:	valore	volume	penalty :=
1		27		10		34
2		41		58		59
3		23		97		87
4		32		23		34
5		39		19		40
6		8		5		29
7		50		71		84
8		2		94		67
9		30		81		53
10		54		92		48
11		85		74		53
12		2		3		85
13		23		41		37
14		18		57		49
15		73		12		85
16		41		47		37
17		78		10		90
18		32		25		57
19		18		61		62
20		23		23		34
21		34		74		75
22		58		28		88
23		12		62		43
24		31		35		75
25		63		63		93
26		14		49		75
27		13		13		39
28		87		95		58
29		56		87		37
30		32		23		6;

param capacity := 1000;

end;
