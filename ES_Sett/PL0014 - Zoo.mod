#Dati
set A; #insieme animali
set N; #insieme sostanze nutritive
param nP;
param animali {A};
param fabbisogno {A, N}; #fabbisogno giornaliero di ogni esemplare [kg/gg]
set P := 1..nP;
param costo {P}; #prezzo prodotti [$/kg]
param composizione {N, P}; #composizione prodotto [%] 
#Variabili
var x {P} >= 0; #quantità prodotti da acquistare [kg]
var y {N} >= 0; #fabbisogno totale  giornaliero di sostanza nutritiva [kg]

#Vincoli
subj to defy { n in N }:
	y[n] = sum {a in A} animali[a] * fabbisogno[a,n]; #moltiplico il fabbisogno per il numero di animali

subj to fabb {n in N} :
	sum {p in P} x[p] * composizione[n,p]/100 >= y[n];


#Ob: soddisfare a costo minimo le esigenze nutritive degli animali dello zoo.
minimize z:
	sum {p in P} x[p] * costo[p];

data;
param nP := 5;
set A := Antilope Babbuino Canguro Dromedario Elefante Fringuello Giraffa Ippopotamo Koala Leone Muflone Narvalo Orso Pappagallo Rinoceronte Serpente_sonagli Tapiro Upupa Visone Zebra ;

set N := Carne Latte Frutta Verdure Zuccheri Grassi Farine Acqua;

param composizione :	
		   1	   2	   3	   4 	5 :=
Carne     80       5       0       25	50
Latte      0       5       0       0	5
Frutta     0      25      30       5	1
Verdure    5      40      25      10	35
Zuccheri   5       0       0       0	0
Grassi     0       0       0      15	0
Farine     0       0      25       0	0
Acqua     10      25      20      45	0
;

param costo :=
	1	5
	2	2
	3	3
	4	4
	5	0.5;

param fabbisogno:	Carne	Latte	Frutta	Verdure	Zuccheri	Grassi	Farine	Acqua	:=
Antilope   			0.0  	0.0  	0.0  	2.0  	0.2  		0.5  	1.0  	3.0
Babbuino   			1.0  	1.0  	3.0  	0.3  	0.2  		0.2  	0.0  	2.0
Canguro   			0.1  	0.5  	0.1  	1.0  	0.1  		0.3  	0.0  	4.0
Dromedario			0.5  	0.5  	1.0  	0.5  	0.1  		0.5  	0.5  	5.0
Elefante   			0.0  	0.5  	5.0  	9.0  	0.5  		1.0  	1.0  	9.0
Fringuello   		0.0  	0.0  	0.0  	0.0  	0.0  		0.0  	0.1  	0.1
Giraffa   			0.0  	0.0  	0.2  	3.0  	0.0  		0.0  	0.0  	4.0
Ippopotamo   		0.0  	0.0  	8.0  	6.0  	0.5  		1.0  	0.0 	20.0
Koala   			0.0  	1.0  	1.0  	1.0  	0.0  		0.0  	0.2  	0.5
Leone   			5.0  	0.0  	0.0  	0.0  	1.0  		0.5  	0.0  	5.0
Muflone   			0.0  	1.0  	0.0  	5.0  	0.0  		0.0  	0.0  	3.0
Narvalo   			0.0  	0.0  	0.0  	0.0  	0.0  		0.0  	3.0  	0.0
Orso   				5.0  	0.5  	3.0  	1.0  	0.0  		0.0  	0.0 	10.0
Pappagallo   		0.0  	0.0  	0.0  	0.0  	0.0  		0.0  	0.2  	0.5
Rinoceronte   		1.0  	0.0  	0.0 	12.0  	0.0  		2.0  	0.0 	15.0
Serpente_sonagli    0.5  	0.0  	0.0  	0.1  	0.0  		0.0  	0.0  	0.1
Tapiro   			0.0  	0.2  	1.0  	9.0  	0.2  		0.5  	0.0  	6.0
Upupa   			0.0  	0.0  	0.0  	0.5  	0.1  		0.0  	0.5  	1.0
Visone   			0.0  	0.2  	0.5  	3.0  	0.0  		0.0  	1.0  	1.0
Zebra   			0.0  	0.0  	0.0  	5.0  	0.5  		0.2  	0.5  	5.0;


param animali := 
	 Antilope 				1
	 Babbuino               2
	 Canguro                1
	 Dromedario             1
	 Elefante               1
	 Fringuello             8
	 Giraffa                1
	 Ippopotamo             1
	 Koala                  3
	 Leone                  2
	 Muflone                2
	 Narvalo                1
	 Orso                   1
	 Pappagallo             8
	 Rinoceronte            1
	 Serpente_sonagli     	6
	 Tapiro                 1
	 Upupa                  4
	 Visone                 4
	 Zebra                  2
;                         

end;
