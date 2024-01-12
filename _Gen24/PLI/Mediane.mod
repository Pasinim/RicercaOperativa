
set O := 1..7; #Insieme origini 
set D := 1..10; #Insieme destinazioni
#param budget := 100;
param prezzo{O};
param dist{O, D}; #distanza tra le citta e i magazzini [km]

var x{O, D} binary; #Variabile di assegnamento, m rifornisce C
var y{O} binary;
var d_max >= 0;

#OB: Minimizzare la massima distanza
minimize z: d_max;

#Ob: Minimizzare il costo di trasporto complessivo, ossia minimizzare la distanza complessiva
#minimize z: sum{o in O, d in D} x[o,d] * dist[o,d]; 

#È necessario selezionare solamente 2 magazzini
s.t. magazzini_selezionati:
	sum{o in O} y[o] = 2;
	
s.t. def_max {o in O, d in D}:
	d_max>=dist[o,d] * x[o,d];
	
#Ogni destinazione deve essere rifornita solamente da un origine
s.t. assegnamento {d in D}: 
	sum{o in O} x[o,d] = 1;
data;
param dist : 1 2 3 4 5 6 7 8 9 10 :=
1 0 565 401 529 295 720 550 817 891 539
2 565 0 210 474 799 665 760 936 1008 979
3 401 210 0 309 635 500 674 771 949 838
4 529 474 309 0 375 194 377 465 643 579
5 295 799 635 375 0 411 259 394 599 293
6 720 665 500 194 411 0 281 861 450 570
7 817 936 771 465 394 861 117 0 220 378
;

param prezzo := 
1 40
2 50
3 40
4 40
5 40
6 40
7 60
;
end;
