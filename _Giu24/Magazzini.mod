param nM := 2;
param nT := 10;
set M := 1..nM; #Insieme dei magazzini
set T := 1..nT; #insieme dei terminali
set O; #isnieme origini
set D; #insieme destinazioni
param distanze{O, D};
param budget := 100;
param c {O};

var x{O, D} binary; #Indica se la destinazione è servita dal magazzino
var maxDistanza >= 0;
s.t. assegnamento {d in D}:	
	sum {o in O} x[o,d] >= 1;
s.t. numeroMagazzini {d in D}:
	sum {o in O} x[o,d] <= 2;
s.t. def_maxDistanza {o in O, d in D}:
	maxDistanza>= distanze[o,d] * x[o,d];
s.t. costoATtivazione {d in D}:
	sum {o in O} x[o,d] * c[o] <= budget;
## minimize z: maxDistanza;

#minimizzare il costo di trasporto complessivo
minimize z:
	sum {o in O, d in D} x[o,d] * distanze[o,d];
data;
set D := Tolosa Nizza Marsiglia Lione Limoges Digione Orleans Parigi Lille Nantes;
set O := Tolosa Nizza Marsiglia Lione Limoges Digione Parigi;

param distanze: Tolosa Nizza Marsiglia Lione Limoges Digione Orleans Parigi Lille Nantes :=
Tolosa 0 565 401 529 295 720 550 817 891 539
Nizza 565 0 210 474 799 665 760 936 1008 979
Marsiglia 401 210 0 309 635 500 674 771 949 838
Lione 529 474 309 0 375 194 377 465 643 579
Limoges 295 799 635 375 0 411 259 394 599 293
Digione 720 665 500 194 411 0 281 861 450 570
Parigi 817 936 771 465 394 861 117 0 220 378
;
param c :=
Tolosa 40
Nizza 50
Marsiglia 40
Lione 40
Limoges 40
Digione 40
Parigi 60
;
end;
