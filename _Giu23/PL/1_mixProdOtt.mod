# Dati
param nP; #numero di modelli
param nR; #numero di reparti
set P :=  1..nP; #insieme dei prodotto
set R := 1..nR; #insieme dei reparti

#Mi servono due vettori e due matric i

param b {R}; #Risorse dispobilel h/sett]
param c {P}; #profitto
param a {R, P}; #Tempi di lavorazione [h/unita]

#Varaibili
var x{P} >= 0;

#Vincoli
#Massimo consumo di risorse in ogni reparto [h/sett]
subject to Consumi {i in R}: 
	sum {j in P} a[i,j] * x[j]  <= b[i];
#Ob
#Massimizzare il profitto
maximize z: 
sum {i in P} c[i] * x[i]
;


###
data;

param nR := 5;
param nP := 3;
param b := 
1	120
2	80
3	96
4	102
5	40
;

param c :=
1	840
2	1120
3	1200
;

param a : 1 2 3 :=
1		  3 2 1
2		  1 2 3
3		  2 0 0
4		  0	3 0
5		  0 0 2 
;

end;
