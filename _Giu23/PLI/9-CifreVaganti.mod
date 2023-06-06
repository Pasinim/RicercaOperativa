param P := 4;
param S := 8612;
param N := 9;

#4 cifre tutte diverse e senza 0
var x{C, P} binary; #coppia cifra-posizione, indica se la cifra c è nella posizione p
var y{C,P} binary; #coppia cifra-posizione, come sopra ma per il numero iniziale


subj to somma :
	sum{i in P} x[i] = S;

#per ogni posizione deve comprarire una cifra
subj to vincolo {c in C}:
	sum {p in P} x[c,p] = 1;

#non devono esserci cifre ripetite:
subj to cifreVincolo {p in P}:
	sum {c in C} x[c,p] = 1
