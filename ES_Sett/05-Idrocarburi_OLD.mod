#Dati
set sostanza;
set benzina;
param quantita {sostanza}; #[BARILE/GG]
param percentuali_lower {sostanza, benzina};
param percentuali_upper {sostanza, benzina};
param prezzo {sostanza}; #[$/BARILE]
param profitto {benzina}; #[$/BARILE]

#Variabili
var x {sostanza, benzina} >= 0;
var z {s in sostanza} >= 0, <= quantita[s]; #quantita consumata per ogni sostanza [BARILE/GG]
var totale {benzina} >= 0; #quantita totale di benzina prodotta

#Vincoli
subject to tot {b in benzina}:
	sum {s in sostanza} x[s, b] = totale[b];
	
subject to lower_bound {s in sostanza, b in benzina}:
	x[s, b]  >= percentuali_lower[s,b] * totale[b];
	
subject to upper_bound {s in sostanza, b in benzina}:
	x[s, b] <= percentuali_lower[s,b] * totale[b];

#quantità disponibili al gg: (devo fare riferimento alla benzina perchè devo calcolare le sostanze consumate per ogni tipo di benzina)
subject to risorse_disponibili {s in sostanza}: 
	sum {b in benzina} x[s, b] = z[s];
	
#Ob: Massimizzare il profittop
maximize w:
	sum {b in benzina, s in sostanza} x[s, b] * (profitto[b] - prezzo[s]); #perchè nn moltiplico per il totale di benzina prodotta? 


data;
set sostanza := A B C D;
set benzina := SUPER NORMALE VERDE;
param quantita :=
A	3000
B	2000
C	4000
D	1000
;

param prezzo :=
A	3
B	6
C	4
D	5
;

param profitto :=
SUPER	5.5
NORMALE	4.5
VERDE	3.5
;

param percentuali_upper :
	SUPER	NORMALE	VERDE :=
A	.3		.5		.7
B	1		1		1
C	.5		1		1
D	1		1		1
;

param percentuali_lower :
	SUPER	NORMALE	VERDE :=
A	0		0		0
B	.40		.10		0
C	0		0		0
D	0		0		0
;

end;