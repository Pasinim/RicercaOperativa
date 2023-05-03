# ESERCIZIO PLI Assegnamento Lineare

#DATI
param N;			# Numero di persone e mansioni (uguale a 10)
set P := 1..N;		# Insieme delle persone
set M := 1..N;		# Insieme delle mansioni
param c {P,M};		# Costo di attribuzione di ogni mansione ad ogni persona

#VARIABILI

var x {P,M} >=0, binary;		#assegnamento della mansione j alla persona i 

#VINCOLI
# i vincoli del problema impongono che ogni persona sia assegnata ad una mansione e viceversa (ogni mansione sia assegnata ad una persona)

# esiste un vincolo per ogni persona
subject to vincolo_persona {i in P}:
	sum {j in M} x[i,j] = 1; 

#esiste un vincolo per ogni mansione
subject to vincolo_mansione {j in M}:
	sum {i in P} x[i,j] = 1; 

#OBIETTIVO
# minimizzare il costo complessivo degli assegnamenti scelti
minimize z: sum {i in P, j in M} x[i,j] * c[i,j];

#########################
data;

param N := 10;

param c: 1		2	3	4	5	6	7	8	9	10 :=
1		 35		24	62	57	81	34	36	12	63	24
2		 72		25	42	25	64	14	24	74	84	15
3		 48		37	62	14	56	94	51	76	11	21
4		 26		26	73	83	15	89	89	21	44	53
5		 62		26	37	26	15	37	24	61	54	13
6		 37		37	76	3	47	52	25	38	61	50
7		 59		98	84	26	47	73	51	54	51	48
8		 60		54	95	50	45	6	82	33	61	72
9		 62		42	68	74	73	12	36	37	38	50
10		 2		52	62	38	95	60	88	25	26	84;

end;
