# ESERCIZIO 69 - PNL Piscina nel parco

#DATI
param nA;					# Numero alberi
set A := 1..nA;				# Insieme alberi
# La posizione di ciascuno degli alberi (le coordinate x,y)
param x {A};
param y {A};
param val {A};				# Valore degli alberi
param r;					# Raggio della piscina [metri]
param M;

#VARIABILI
#Posizione centro piscina
var xx;
var yy;
#Abbattimento albero (1=albero abbattuto, 0=albero rimane)
var z {A} binary;

#VINCOLI
# La z deve valere 1 tutte le volte che il punto A capita all'interno della circoferenza
# Per disattivare il vincolo quando z = 1, dobbiamo togliere una quantita' M molto grande quando z vale 1
subject to Esterni {a in A}:
	(x[a]-xx)^2 + (y[a]-yy)^2 >= r^2 - M*z[a];

#OBIETTIVO
minimize valore: sum {a in A} val[a] * z[a];

#################
data;

param nA := 50;
param r := 20;

end;

Il parco è quadrato con lato di metri 100 e lati in direzione N-S ed E-O.

Tabella 1: Posizione degli alberi, in metri, rispetto all angolo S-O del parco
Alb.  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
x     4  6 12 15 15 17 18 21 23 24 26 28 29 31 32 35 36 36 38 41 41 42 44 45 47
y    26 47 23  2 89 72 49 19  3 12 48 91 17 90 27 14 29 34 52 45 24 18 83 18 93

Alb. 26 27 28 28 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
x    48 48 49 50 51 56 58 58 59 61 63 65 68 69 70 75 77 78 79 80 84 86 90 91 96
y    36 29 83 87  2 93 36 68 30 34 82 57 74 58 12 34 59 51 68 61 90  5 78 40 82


Tabella 2: Valore degli alberi
Alb.  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
Val.  9  5  3  3  7  4  2  4  7  9  3  2  1  5  4  7  9  3  2  4  5  7  9  3  2

Alb. 26 27 28 28 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
Val.  5  7  9  5  4  2  4  8  9  4  2  3  4  4  5  6  7  9  9  4  2  5  6  7  8

