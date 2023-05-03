#ESERCIZIO 37 - PNL Classificatore automatico

#DATI
param nP;						# Numero di punti
set P := 1..nP;					# Insieme dei punti
param x {P};					# Le coordinate x dei punti
param y {P};					# Le coordinate y dei punti
param label {P};				# Vero = 1, Falso = 0
param M := max {i in P, j in P} sqrt ((x[i]-x[j])^2 + (y[i]-y[j])^2);		# M grande

#VARIABILI
# Parametri della retta nel piano
var a;
var b;
var c;
var w {P} binary;			# w = 1 per misclassification

#VINCOLI
# Normalizzazione dei coefficienti
subject to Normalizzazione:
	a^2 + b^2 = 1;

# Separazione dei punti (tutti punti con la label 1 capino da una parta, quelli con la label 2 capino dall'altra parte)
subject to Separazione0 {i in P: label[i] = 0}:
	a * x[i] + b * y[i] + c <= M * w[i];
subject to Separazione1 {i in P: label[i] = 1}:
	a * x[i] + b * y[i] + c >= -M * w[i];

#OBIETTIVO
# Minimizzare il numero dei punti che cadano dalla parte sbagliata
minimize z: sum {i in P} w[i];

##################################
data;

param nP := 20;

param:  x    y    label :=
 1     12   29     1
 2     16   26     1
 3     24   25     1
 4      8    7     1
 5     30   50     1
 6     11   41     1
 7      5    2     1
 8      6   11     1
 9     40   12     1
10     23   27     1
11     21   43     1
12     51   18     1
13      2   36     0
14      2   33     0
15     11    6     0
16     33    7     0
17     28   45     0
18     25   42     0
19     20   50     0
20     20   18     0;

 # Inizializziamo a, b e c
 var a := 0.7;
 var b := -0.7;
 var c := 0;
 
 end;
 