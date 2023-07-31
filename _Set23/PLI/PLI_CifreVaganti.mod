param nP := 4; #numero di posizioni 
param nC := 9; #numero cifre
set P := 1..nP;
set C := 1..nC;
param S := 8612;
var x{C, P} binary; #var ass numero originale
var y{C, P} binary; #var ass del numero modificato
var X >= 0; #Valore del numero originale
var Y >= 0; #Valore del numero modificato

data;
subj to cifra {p in P}:
	sum{c in C} x[c,p] <= 1;
subj to cifra2 {p in P}:
	sum{c in C} y[c,p] <= 1;
subj to cifredivese {c in C}
	sum {p in P} x[c,p] <= 1;
	
end;
