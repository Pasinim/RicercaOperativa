# ESERCIZIO 38 - PLI Sudoku

#DATI
param nR;					# Numero righe
set R := 1..nR;				# Insieme delle righe
param nC;					# Numero colonne
set C := 1..nC;				# Insieme delle colonne
set K := 1..9;				# Insieme delle cifra (da 1 a 9)
set MR :=1..3;				# Macrorighe 
set MC :=1..3;				# Macrocolonne 

#VARIABILI
var x {R,C,K} binary;		# Assegnamento tra riga, colonna e cifra

#VINCOLI

# Per ogni cella, abbiamo esattamente una cifra ( una cifra in ogni riga e ogni colonna)
subject to RigaColonna{r in R, c in C}: sum {k in K} x[r,c,k] = 1;

# Su ogni riga, ogni cifra deve comparire esattamente in una colonna (la somma delle variabili in una colonna deve essere 1)
subject to RigaCifra{r in R, k in K}: sum {c in C} x[r,c,k] = 1;

# Per ogni colonna e cifra, la somma su tutte le righe deve essere uguale a 1
subject to ColonnaCifra{c in C, k in K}: sum {r in R} x[r,c,k] = 1;

subject to Quadrato{k in K, h1 in MR, h2 in MC}:
	sum {r in R, c in C: (r >=3*h1-2) and (r<=3*h1) and (c>=3*h2-2) and (c<=3*h2)} x[r,c,k] = 1;

#Fissando le cifre che sappiamo (fissiamo =1 le variabili x)
subject to forzata1: x[1,3,2] = 1;		#nella riga 1, colonna 3 abbiamo la cifra 2
subject to forzata2: x[5,3,5] = 1;		#nella riga 5, colonna 3 abbiamo la cifra 5

#OBIETTIVO
#Non c'e una funzione obiettivo, diventa solo un problema di soddisfacimento dei vincoli

#############################
data;

param nR := 9;
param nC := 9;

end;
