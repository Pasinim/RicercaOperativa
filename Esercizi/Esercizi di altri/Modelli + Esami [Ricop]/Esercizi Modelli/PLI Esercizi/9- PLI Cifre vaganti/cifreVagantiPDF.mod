# ESERCIZIO PLI Cifre Vaganti (pdf version)

# DATI
set N := 1..9;				# Insieme delle cifre
set P := 1..4;				# Insieme di posizioni
param S;					# La somma
set Speciale within N;		# Sottoinsieme delle cifre (le 4 cifre che compaiono nella somma sono 1 2 6 8)

# VARIABILI
var x{N,P} binary;			# Vale 1 se la cifra N compare in posizione P del PRIMO numero
var y{N,P} binary;			# Vale 1 se la cifra N compare in posizione P del SECONDO numero
var X;						# Il valore del primo numero (originale)
var Y;						# Il valore del secondo numero (modificato)

#VINCOLI
# Vincolo che in ogni posizione di X e Y compaia esattamente una cifra
subject to CifraUnicaX {j in P}:
	sum {i in N} x[i,j] = 1;
subject to CifraUnicaY {j in P}:
	sum {i in N} y[i,j] = 1;

#Vincolo che nessuna cifra compaia piu' di una volta
subject to CifraNonPiuDiUnaVolta {i in N}:
	sum{j in P} x[i,j] <=1;

#Le espressioni dei numeri X e Y in funzione delle variabili x e y sono:
subject to NumeroX:
	X = sum {j in P, i in N} x[i,j] * i * 10^(j-1);

subject to NumeroY:
	Y = sum {j in P, i in N} y[i,j] * i * 10^(j-1);

#Non resta che imporre X + Y = S e la relazione tra i numeri datta dallo scambio di cifre descritto

# La somma di X + Y = S (8612)
subject to Somma:
	X + Y = S;

#Le migliaia in X sono le decine in Y
subject to Migliaia:
	sum{i in N} i * x[i,4] = sum {i in N} i * y[i,2];

#Le centinaia in X sono le unita in Y
subject to Centinaia:
	sum{i in N} i * x[i,3] = sum {i in N} i * y[i,1];

#Le decine in X sono le centinaia in Y
subject to Decine:
	sum{i in N} i * x[i,2] = sum {i in N} i * y[i,3];

#Le unita in X sono le migliaia in Y
subject to Unita:
	sum{i in N} i * x[i,1] = sum {i in N} i * y[i,4];

# 2 delle 4 cifre che formano il totale compaiono anche nei numeri sommati ( basta imporrlo solo su un numero )
subject to Speciali:
	sum{p in P, c in Speciale} x[c,p] = 2;

#OBIETIVO
# Il problema non ha una funzione obiettivo, e' un problema di esistenza non di ottimizzazione

######################
data;

param S := 8612;
set Speciale := 1 2 6 8;

end;
