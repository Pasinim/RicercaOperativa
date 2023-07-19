# ESERCIZIO n5 - PNL Localizzazione

#DATI
set P := 1..9;			#Insieme dei punti
#Le coordinate cartesiane dei punti
param x {P};
param y {P};

#VARIABILI
#Decidere dove localizzare i 3 punti richiesti, indicati da M (mediana), C (centro) e B (baricentro)
#Le coordinate della mediana
var xm;
var ym;
#Le coordinate del centro
var xc;
var yc;
#Le coordinate del baricentro
var xb;
var yb;

#VINCOLI
#Il problema non ha vincoli

#OBIETTIVO
#Sono date 3 funzioni obiettivo, una per ogni punto da localizzare

#########################
data;


param:	x		y	:=
1 		342 	456
2 		456 	 54
3 		342 	 45
4 		435 	768
5 		432 	435
6 		345 	234
7 		 45 	546
8 		765 	 56
9 		234 	 87;

end;
