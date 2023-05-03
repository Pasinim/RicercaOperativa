#ESERCIZIO PL 1.4 - Zoo

#DATI 
set A;					# L'insieme degli animali dello zoo
param q{A};				# Le quantità presenti allo zoo di ogni animale
param nP;				# Il numero di prodotti alimentari per animali
set P:=1..nP;			# L'insieme dei prodotti alimentari per gli animali
set S;					# L'insieme delle sostanze nutritive
param f{A,S};			# Il fabbisogno di sostanze nutritive che ogni animale deve assumere [Kg]
param c{P};				# Il costo di ciascun prodotto [€/Kg]
param perc{S,P};		# Le percentuali delle sostanze nei prodotti [%]

#VARIABILI
var x {P} >= 0;			# Quantità acquistata di ogni prodotto [Kg]

#VINCOLI

#la quantità di sostanze nutritive acquistate sia sufficiente a soddisfare il fabbisogno complessivo degli animali
subject to Cibo {s in S}: 
	sum {p in P} (x[p] * perc[s,p]/100) >= sum {a in A} (f[a,s] * q[a]);

#primo membro: la quantità di sostanza nutritiva acquistata
# dato dalla somma pesata delle variabili x(p) moltiplicate per la percentuale di sostanza nutritiva nel prodotto

#secondo membro: la somma del fabbisogno giornaliero di quella sostanza 
#ottenuto sommando tutti i fabbisogni giornalieri degli animali dello zoo, opportunamente moltiplicati per il numero di esemplari di ciascun animale

#OBIETTIVO
#minimizzare i costi per il nutrimento degli animali dello zoo
minimize z: sum {i in P} x[i] * c[i];

###############################
data;

param nP:=4;

set A := Antilope Babbuiono Canguro Dromedario Elefante Fringuello Giraffa Ippopotamo Koala Leone Muflone Narvalo Orso Pappagallo Rinoceronte Serpente Tapiro Upupa Visone Zebra;

set S := Carne Latte Frutta Verdura Zuccheri Grassi Farine Acqua;

param q :=
Antilope	1
Babbuiono	2
Canguro		1
Dromedario	1
Elefante	1
Fringuello	8
Giraffa		1
Ippopotamo	1
Koala		3 
Leone		2
Muflone		2
Narvalo		1
Orso		1
Pappagallo	8
Rinoceronte	1
Serpente	6
Tapiro		1
Upupa		4
Visone		4
Zebra		2;

param perc: 1	2	3	4:=
Carne		80	5	0	25
Latte 		0	5	0	0
Frutta 		0	25	30	5
Verdura 	5	40	25	10
Zuccheri 	5	0	0	0
Grassi 		0	0	0	15
Farine 		0	0	25	0
Acqua		10	25	20	45;

param f : Carne Latte Frutta Verdura Zuccheri Grassi Farine Acqua :=
Antilope	0.0	0.0		0.0		2.0		0.2		0.5		1.0	3.0
Babbuiono	1.0	1.0		3.0		0.3		0.2		0.2		0.0	2.0
Canguro		0.1	0.5		0.1		1.0		0.1		0.3		0.0	4.0
Dromedario	0.5	0.5		1.0		0.5		0.1		0.5		0.5	5.0
Elefante	0.0	0.5		5.0		9.0		0.5		1.0		1.0	9.0
Fringuello	0.0	0.0		0.0		0.0		0.0		0.0		0.1	0.1
Giraffa		0.0	0.0		0.2		3.0		0.0		0.0		0.0	4.0
Ippopotamo	0.0	0.0		8.0		6.0		0.5		1.0		0.0	20.0
Koala		0.0	1.0		1.0		1.0		0.0		0.0		0.2	0.5 
Leone		5.0	0.0		0.0		0.0		1.0		0.5		0.0	5.0
Muflone		0.0	1.0		0.0		5.0		0.0		0.0		0.0	3.0
Narvalo		0.0	0.0		0.0		0.0		0.0		0.0		3.0	0.0
Orso		5.0	0.5		3.0		1.0		0.0		0.0		0.0	10.0
Pappagallo	0.0	0.0		0.0		0.0		0.0		0.0		0.2	0.5
Rinoceronte	1.0	0.0		0.0		12		0.0		2.0		0.0	15.0
Serpente	0.5	0.0		0.0		0.1		0.0		0.0		0.0	0.1
Tapiro		0.0	0.2		1.0		9.0		0.1		0.5		0.0	6.0
Upupa		0.0	0.0		0.0		0.5		0.1		0.0		0.5	1.0
Visone		0.0	0.2		0.5		3.0		0.0		0.0		1.0	1.0
Zebra		0.0	0.0		0.0		5.0		0.5		0.2		0.5	5.0;

param c :=
1	5
2	2
3	3
4	4;

end;
