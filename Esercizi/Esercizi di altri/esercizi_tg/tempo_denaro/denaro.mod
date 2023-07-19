# Esercizio "il tempo e'denaro"

# DATI
param nP;
param nC;

set P := 1..nP;
set C := 1..nC;

param c {P};	# ricavi [$/u]	
param t {P};	# tempo di assemblaggio [hu/u]

param a {C,P};	# coefficienti tecnologici [pz/u]
param b {C};	# disponibilità componenti [pz/mese]
# param epsilon;	# termine noto per analisi parametrica [hu/m]


# VARIABILI
var x {P} >= 0;	# produzione [u/m]
var f1;			# ricavi [$/m]
var f2;			# manodopera[hu/m]

# VINCOLI
# vincolo sul consumo di componenti [pz/m]
subject to Consumi {i in C}:
	sum {j in P} a[i,j] * x[j] <= b[i];
	
# vincolo sul consumo di manodopera [hu/m]
subject to Manodopera:
	sum {j in P} t[j] * x[j] <= f2;
	
subject to Def1: f1 = sum {j in P} c[j] * x[j];

	
# OBIETTIVO
# Massimizzazione dei profitti [$/m]
maximize z: f1 - 1000* f2;
#subject to Parametric: f1 >= epsilon;



############################################
data;

#param epsilon := 7848;

param nP := 3;
param nC := 3;


param c :=
    1      1200
    2      1300
    3      1200;


param t :=
   1        1
   2        1
   3        1;


param a: 	 1       2       3 :=

   1         10      12      14
   2          5       7       6
   3         10      15       9;


param b :=
   1       91
   2       40
   3       59;

