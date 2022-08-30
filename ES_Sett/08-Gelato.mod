#Dati
set m := 1..4;
param domanda {m}; #[tonn]
param offerta {m}; #[tonn]
param prezzo {m}; #[$/ton]
param costo {m}; #[$/ton]

#Vincoli
var x {m} >= 0; #quantità prodotta ogni mese 
var eccedenza {m} >=0 ;

#Variabili
subject to limite {i in m}:
	x[i] <= offerta[i];
	
subj to richiesta_giugno:
	x[1] - eccedenza[1] >= domanda[1];

subject to richiesta {i in m : i > 1}:
	(x[i] - eccedenza[i]) + eccedenza[i-1] >= domanda[i];

#Ob: quantità di gelato da produrre minimizzxando i costi
# costo totale: costo immagazzinamento + costi degli ingredienti
minimize Z:
	sum {i in m} (costo[i] * eccedenza[i] + prezzo[i] * x[i]);


data;


param costo :=
1 2000
2 3000
3 2000
4 3000
;

param prezzo :=
1 34
2 36
3 32
4 38
;

param domanda :=
1 200
2 300
3 500
4 400
;

param offerta :=
1 400
2 500
3 300
4 500
;

end;
