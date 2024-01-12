set O := 1..5;
set D := 1..5;
param costo{O, D}; #[e/qu]
param offerta{O}; #[q/gg]
param domanda{D}; #[q/gg]
param costoUnitario := 50;
#param capMax := 100; #[q]

var x{O, D} >= 0;
var capMax >= 0;
var prezzoCondotte >= 0;

s.t. fabbisogno{d in D}:
	sum {o in O} x[o,d] = domanda[d];
s.t. limiteOfferta {o in O}:
	sum {d in D} x[o,d] <= offerta[o];

s.t. capacitaMassima{o in O, d in D}:
	 x[o, d] <= capMax;
	 
s.t. prezzoUnitario{d in D}:
	sum {o in O} x[o,d] * costoUnitario = prezzoCondotte;

minimize z:
	sum {o in O, d in D} x[o,d] * costo[o,d] ;
	
	
#Trovare la capacità minima
#minimize z:
#	capMax;

# se ogni unità di capacità delle condotte costa 50 Euro/giorno, qual è la capacità ottima e qual è il costo corrispondente

data;
param domanda :=
1 410
2 200
3 400
4 315
5 300
;

param offerta := 
1 340
2 290
3 310
4 325
5 360
;
param costo:
   1 2 3 4 5 :=
1 15 18 23 31 16
2 27 19 14 28 31
3 20 15 12 25 15
4 17 18 24 23 25
5 26 17 17 17 28
;
end;
