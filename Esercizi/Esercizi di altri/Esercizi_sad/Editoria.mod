# Esercizio Editoria

# DATI
param p;				# Numero pagine per fascicolo
param an;				# Numero articoli
set a := 1..an;			# Insieme degli articoli
param l{a};				# Lunghezza articoli in pagine.
param u{a};				# Urgenza articolo
param fn;			# Numero fascicoli
set f := 1..fn;		# Insieme dei fascicoli

# VARIABILI

var x{f,a} binary;		# 0 se l'articolo non è nel fascicolo corrispondente, 1 altrimenti.
var maxP >=0;
var minP >=0;
var aPu >= 0;

# VINCOLI

s.t. maxP_def{i in f}:
	p - sum{j in a} x[i,j]*l[j] <= maxP;

s.t. minP_def{i in f}:
	p - sum{j in a} x[i,j]*l[j] >= minP;

s.t. unique{i in a}:
	sum{j in f} x[j,i] <= 1;

s.t. urgenza{i in a}:
	sum{j in f} x[j,i]*(4-j) >= u[i];

s.t. massimePagine{i in f}:
	sum{j in a} x[i,j]*l[j] <= p;

s.t. articoliPubblicati:
	(sum{j in a,i in f} x[i,j] )= aPu;

s.t. w :
	an-aPu = 2;

# OBIETTIVO

minimize z : maxP - minP;

################

data;

param: l, u :=
1	   5  2
2     11  0
3     17  2
4     10  0
5     18  1
6      8  0
7     14  0
8      9  3
9     16  3 
10    12  0
11    14  0
12    13  0;

param fn := 3;
param p := 44;
param an := 12;

end;
