# Esercizio PNL 85 - Rettangolo

# DATI
param Npunti;				# Numero dei punti
set N := 1..Npunti;			# Insieme dei punti
param x {N};				# Le coordinate x dei punti
param y {N};				# Le coordinate y dei punti
set R := 0..3;				# Insieme delle rette

# VARIABILI
# Coefficienti delle rette dei lati
var a {R};
var b {R};
var c {R};

# VINCOLI
# Condizioni di normalizzazione dei coefficienti
subject to Norm {j in R}: a[j]^2 + b[j]^2 = 1;

# Condizioni di ortogonalità tra rette consecutive
subject to Ortogonali {j in R, k in R: k = (j+1) mod 4}:
  a[j]*a[k] + b[j]*b[k] = 0;

# Condizioni sul verso dei lati opposti paralleli
subject to Verso_a {j in R, k in R: k=(j+2) mod 4}:
  a[j] = -a[k];
subject to Verso_b {j in R, k in R: k=(j+2) mod 4}:
  b[j] = -b[k];

# Condizioni di copertura dei punti
subject to Copertura {j in R, i in N}:
  a[j]*x[i] + b[j]*y[i] + c[j] >= 0;
  
# OBIETTIVO
# Minimizzare area del rettangolo
minimize z: (c[0]+c[2]) * (c[1]+c[3]);
# oppure, per non usare gli indici esplicitamente,
# sum {j in R: (j mod 2)=0} c[j] * sum {j in R: (j mod 2)=1} c[j]

###########################################
data;

param Npunti := 10;

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
