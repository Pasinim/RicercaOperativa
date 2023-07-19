# Esercizio Classificatore

# Dati

param n;
set N := 1..n;
param x{N};
param y{N};
param k{N};
param M := 2*max{i in N, j in N} sqrt((x[i] - x[j]) ^ 2 + (y[i]-y[j])^2);

# Variabili

var a;
var b;
var c;
var w{N} binary; # w = 1 consente la missclassification del punto
var delta >= 0;

# a cosenod ell'angolo della retta
# b cambiato di segno è il seno dell'angolo
# c distanza dall'origine cambiata di segno

# Vincoli

s.t. Norm : a^2 + b^2 = 1;
# voglio trascurare meno vincoli possibili
s.t. Punti0{i in N : k[i] = 0}:
	a*x[i] + b*y[i] + c <= -delta +  M * w[i];
s.t. Punti1{i in N : k[i] = 1}:
	a*x[i] + b*y[i] + c >= delta - M * w[i];

s.t.  MisClassif :
	sum{i in N} w[i] <= 5; # Valore ottimo del primo obiettivo

# Obiettivo

maximize z2 : delta;
 

#########################

data;

param n := 20;

param : x y k :=
  1    12   29     1
  2    16   26     1
  3    24   25     1
  4     8    7     1
  5    30   50     1
  6    11   41     1
  7     5    2     1
  8     6   11     1
  9    40   12     1
 10    23   27     1
 11    21   43     1
 12    51   18     1
 13     2   36     0
 14     2   33     0
 15    11    6     0
 16    33    7     0
 17    28   45     0
 18    25   42     0
 19    20   50     0
 20    20   18     0;
 
end;
