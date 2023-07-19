#ESERCIZIO 85 - PNL Rettangolo

#DATI
set N := 1..10;             # Insieme dei punti
param x {N};                # Coordinate x dei punti
param y {N};                # Coordinate y dei punti
set R := 0..3 ;             # Insieme delle rette

#VARIABILI
# Coefficienti delle 4 rette dei lati 
var a {R};
var b {R};
var c {R};
# I lati del rettangolo
var L1;
var L2;

#VINCOLI
# Condizioni di normalizzazione
subject to Normalizzazione {j in R}: a[j]^ 2 + b[j]^2 = 1;

# Condizioni di ortogonalita' tra rette consecutive
subject to Ortogonali {j in R, k in R: k = (j+1) mod 4}:
 a[j]*a[k] + b[j]*b[k] = 0;

# Condizioni di copertura dei punti
subject to Copertura {j in R, i in N}:
 a[j]*x[i] + b[j]*y[i] + c[j] <= 0; 

# Valori assoluti
subject to minMax02: L1 >= c[0] - c[2];
subject to minMax20: L1 >= c[2] - c[0];
subject to minMax13: L2 >= c[1] - c[3];
subject to minMax31: L2 >= c[3] - c[1];

#OBIETTIVO
# Minimizzare area
minimize z: L1 * L2;

#################
data;

param:   x   y :=
 1		-7	-2
 2		-3	 5
 3		-4	-5
 4		10	 5
 5		11	 2
 6		 6	 9
 7		 0	-6
 8		-6	 2
 9		 9	 0
10		-7	 0;

var:     a   	   b     	 c :=
0       0.7071    0.7071	10
1       0.7071   -0.7071	10
2      -0.7071   -0.7071	20
3	   -0.7071    0.7071	10;

end;

