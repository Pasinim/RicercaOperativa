#DATI 
param nP;		#Il numero di prodotti per animali
set P:=1..nP;	#L'insieme dei prodotti per gli animali
set S;			#L'insieme delle sostanze nutritive
set A;			#L'insieme degli animali dello zoo
param f{A,S};	#Il fabbisogno di sotanze nutrituve che ogni animale deve assumere [Kg]
param c{P};		#Il costo di ciascun prodotto[€/Kg]
param q{A};		#Le quantità presenti allo zoo di ogni animale
param s{S,P};	#Le percentuali delle sostanze nei prodotti[%]
#VARIABILI
var x{P}>=0;	#quntità acquistata di ogni prodotto[Kg]

#VINCOLI
#Di ogni sostanza, ne serve pari alla somma per tutti gli animali
subj to Cibo{j in S}: sum{i in A} (f[i,j]*q[i]) <= sum{k in P}(s[j,k]/100*x[k]);

#OBIETTIVO
#minimizzare i costi per il nutrimento degli animali
minimize z: sum{i in P} x[i]*c[i];

data;

param nP:=5;

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

param s :	1	2	3	4	5:=
Carne		80	5	0	25	50
Latte 		0	5	0	0	5
Frutta 		0	25	30	5	10
Verdura 	5	40	25	10	35
Zuccheri 	5	0	0	0	0
Grassi 		0	0	0	15	0
Farine 		0	0	25	0	0
Acqua		10	25	20	45	0;

param f : Carne Latte Frutta Verdura Zuccheri Grassi Farine Acqua :=
Antilope	0	0		0		2		0.2		0.5		1	3
Babbuiono	1	1		3		0.3		0.2		0.2		0	2
Canguro		0.1	0.5		0.1		1		0.1		0.3		0	4
Dromedario	0.5	0.5		1		0.5		0.1		0.5		0.5	5
Elefante	0	0.5		5		9		0.5		1		1	9
Fringuello	0	0		0		0		0		0		0.1	0.1
Giraffa		0	0	0.2	3	0	0	0	4
Ippopotamo	0	0	8	6	0.5	1	0	20
Koala		0	1	1	1	0	0	0.2	0.5 
Leone		5	0	0	0	1	0.5	0	5
Muflone		0	1	0	5	0	0	0	3
Narvalo		0	0	0	0	0	0	3	0
Orso		5	0.5	3	1	0	0	0	10
Pappagallo	0	0	0	0	0	0	0.2	0.5
Rinoceronte	1	0	0	12	0	2	0	15
Serpente	0.5	0	0	0.1	0	0	0	0.1
Tapiro		0	0.2	1	9	0.1	0.5	0	6
Upupa		0	0	0	0.5	0.1	0	0.5	1
Visone		0	0.2	0.5	3	0	0	1	1
Zebra		0	0	0	5	0.5	0.2	0.5	5;


param c :=
1	5
2	2
3	3
4	4
5	0.5;
end;
