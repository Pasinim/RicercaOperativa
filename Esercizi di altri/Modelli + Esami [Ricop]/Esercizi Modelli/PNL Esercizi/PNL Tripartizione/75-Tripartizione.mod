# Esercizio PNL 75 - Tripartizione 

# DATI
set S := 0..2;				# Insieme dei clusters e delle rette
param N {j in S};			# Numero di punti in ogni cluster
set P {j in S} := 1..N[j];	# Insieme dei punti di ogni cluster
# Cooordinate dei punti di ogni cluster
param x {j in S,P[j]};
param y {j in S,P[j]};

# VARIABILI
# Origine delle semirette
var xx := -0.1;
var yy := 0;
# Parametri delle semirette
# Ogni semiretta j separa sottoinsiemi (j+1) mod 3 e (j+2) mod 3
var a {S};
var b {S};
var c {S};

# Costante "large enough"
param M := 999;
# Variabili binarie per disattivare i vincoli disgiuntivi 
var w1 binary;
var w2 binary;
var w3 binary;
var w4 binary;

# VINCOLI
# Normalizzazione dei coefficienti delle tre rette
subject to Norm {j in S}:
  a[j]^2 + b[j]^2 = 1;

# Passaggio delle tre rette per il punto comune
subject to Passaggio {j in S}:
  a[j] * xx + b[j] * yy + c[j] = 0;

# Separazione dei punti
subject to Separa1 {j in S, k in S, i in P[k]: k = (j+1) mod 3}:
  a[j] * x[k,i] + b[j] * y[k,i] + c[j] >= 0;
subject to Separa2 {j in S, k in S, i in P[k]: k = (j+2) mod 3}:
  a[j] * x[k,i] + b[j] * y[k,i] + c[j] <= 0;

# Vincoli versione 3: punto comune nel quadrato
#subject to minxx: xx >= -1;
#subject to maxxx: xx <=  1;
#subject to minyy: yy >= -1;
#subject to maxyy: yy <=  1;

# Vincoli versione 4: punto comune fuori dal quadrato
subject to Dx: xx >=  1 -M*w1;
subject to Sx: xx <= -1 +M*w2;
subject to Up: yy >=  1 -M*w3;
subject to Dn: yy <= -1 +M*w4;
subject to Disgiunzione:
  w1 + w2 + w3 + w4 <= 3;

# OBIETTIVO
# Versione 1 e 4: punto comune il più vicino possibile a O
minimize z1: xx^2 + yy^2;
# Versione 2 e 3: punto comune il più lontano possibile da O
#maximize z2: xx^2 + yy^2;

###########################
data;

param N :=
0	8
1   6
2  12;

param x :=
[0,1] -5
[0,2] 10
[0,3]  5
[0,4]  3
[0,5] -1
[0,6] -2
[0,7]  2
[0,8] 10

[1,1] -10
[1,2]  -4
[1,3] -19
[1,4] -11
[1,5]  -7
[1,6] -12

[2,1]  -3
[2,2]  -1
[2,3]   1
[2,4]  -2
[2,5]  11
[2,6]   2
[2,7]   3
[2,8]   0 
[2,9]   1
[2,10]  2
[2,11] -3
[2,12] -4;

param y :=
[0,1] 12
[0,2]  8
[0,3]  5
[0,4]  0
[0,5]  3
[0,6]  9
[0,7] 10
[0,8]  6

[1,1]  2
[1,2]  3
[1,3] 15
[1,4]  0
[1,5] -3
[1,6] -9

[2,1]  -6
[2,2]  -8
[2,3]  -5
[2,4]  -9
[2,5]  -1
[2,6]  -9
[2,7]   0
[2,8]  -2
[2,9]  -8
[2,10] -2
[2,11] -6
[2,12] -9;

# Inizializzazione dei coefficienti delle rette per aiutare il solutore
var:    a   b   c :=
0      -1   1   0
1       0  -1   0 
2       2   1   0;

end;


