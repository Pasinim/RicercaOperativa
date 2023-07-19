# Esercizio Lamine

# DATI

param l;			# Lunghezza della lamina madre in metri
param w;			# Larghezza della lamina madre in metri
param nC;			# Numero clienti
set C := 1..nC;		# Insieme dei clienti
param nL{C};		# Numero lamine richieste da ogni cliente
param lL{C};		# Larghezza di ogni lamina
param nLA := ceil(3*(sum{c in C} nL[c]*lL[c])/w);
set lA := 1..nLA;

# VARIABILI

var laminaUtilizzata{lA} binary;
var lamine{C,lA} integer >= 0;

# VINCOLI

s.t. soddisfa{c in C}:
	sum{i in lA} lamine[c,i] = nL[c];

s.t. laminaMaxLarghezza{i in lA}:
	sum{c in C} lamine[c,i]*lL[c] <= w*laminaUtilizzata[i];

s.t. CSB{ i in lA : i < nLA}:
	laminaUtilizzata[i] >= laminaUtilizzata[i+1];


# OBIETTIVO

minimize z: sum{ i in lA} laminaUtilizzata[i];



###################################

data;

param l := 100;
param w := 4;
param nC := 9;

param: nL lL :=
   1           3             0.40
   2           2             1.30
   3           1             2.50
   4           2             1.25
   5           3             0.50
   6           1             1.75
   7           2             1.20
   8           1             1.10
   9           1             0.45;

end;
