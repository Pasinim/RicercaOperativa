#Dati
set h := 1..24;
set h2 := 1..12; 
set f := 1..2; #insieme dei farmaci
param uB; #[mg/cc]
param lB {h}; #quantità minima di Y per ogni ora [mg/cc]
param e {h2, f}; #tasso di proteina dopo tot h
param P {h2}; #Prismil [mg/cc] di proteina per ogni grammo assunto
param C {h2}; #Ciindren [mg/cc] di proteina per ogni grammo assunto
param pP; #Prezzo prisim [$/g]
param pC; #prezzo cilindren [$/g]
#Variabili
var x{h, f} >= 0; #quanittà di farmaci assunti durante il giorno [g]
var y{h} >= lB[h], <= uB;


#Vincoli
subj to Y_in_h {i in h}:
	y[i] = sum {j in h2, k in f} 
#Ob: 
#	a) minimizzare la quantità di sostanza complessiva da assumere oppure...
#	b) minimizzare il costo della cura


data;
param pP := 0.7;
param pC := 0.95;

param e: P	C :=
	1	1.5 2.5
	2	3	4
	3	4	5.5
	4	2.5	4
	5	1.9	3
	6	1	.7
	7	.7	.4
	8	.5	.2
	9	.3	0
	10	.2	0
	11	.1	0
	12	0	0
	;


param uB := 45;

param lB :=
	1	5
	2	1
	3	0
	4	0
	5	0
	6	0
	7	4
	8	15
	9	12
	10	5
	11	4
	12	3
	13	25
	14	30	
	15	25	
	16	15
	17	5
	18	4
	19	3
	20	25
	21	30
	22	25
	23	20
	24 	10
;

end;
