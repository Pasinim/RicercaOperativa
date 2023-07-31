
param nA := 2; #Numero di aziende figlie
set A := 1..nA;
param nP := 3; #Numero di Prodotti
set P := 1..nP;
param nF := 7; #Numero di filiali
set F := 1..nF;
param fatt{F, P}; #matrice fatturato

#var x{F, A} binary; #Var assegnamento: a quale azienda iglia viene assegnata la filiale
var x {F} binary;			# vale 0 se il filiale F viene assegnato ad AF1, vale 1 se viene assegnato ad AF2
var y {P} >=0;				# fatturato dell'azienda AF1 per ogni prodotto
var yy {P} >=0;				# fatturato dell'azienda AF2 per ogni prodotto
var delta >= 0;

subj to def_y {p in P}:
	y[p] = sum {f in F} fatt[f, p] * (1-x[f]);

subj to def_yy {p in P}:
	yy[p] = sum {f in F} fatt[f, p] * x[f];


# si vuole quindi minimizzare la massima difierenza tra il fatturato di un’azienda
# flglia e quello dell’altra rispetto ad uno stesso prodotto.
minimize z: delta;
subj to ass1 {p in P}:
	delta >= y[p] - yy[p];
	
subj to ass2 {p in P}:
	delta >= yy[p] - y[p];
	
data;
param fatt : 1 2 3 := 
1 83 14 42
2 38 63 56
3 28 24 12
4 59 7 53
5 25 35 83
6 52 86 85
7 59 64 25
;

end;
