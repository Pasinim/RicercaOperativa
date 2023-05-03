
param nO;
param nP;
param limite;

set O := 1..nO;
set P := 1..nP;


param uB {P}; #upper bound delle posizioni
param irraggiamento{O, P}; #radiazioni assorbite dagli organi adiacenti
param T {P}; #Coefficienti di assorbimento delle radiazioni del tumore [%]
param lim {P}; #Massima radiazione per ogni posizione [grey]
param limOrg{O}; #Limiti massimi per ogni organo

#Variabili

var x{P}>=0;
#Vincoli
#Limite massimo erogabile 
subj to LimiteMax :
	sum {j in P} x[j] <= limite;
	
#Limite massimo erogabile per ciascuna posizione
subj to LimitePosizioni {j in P}:
	x[j] <= lim[j]
	;
subj to LimiteOrgani {i in O}:
	sum { j in P} x[j] * irraggiamento[i, j] <= limOrg[i]
	;
	
	

#Obiettivo
#Massimizzare l'assorbimento delle radiazioni per il tumore
maximize RadiazioneTumore: 
	sum {i in P} x[i] * T[i]
;

	

data;
param nO := 7;
param nP := 5;
param limite := 60;
param irraggiamento: 
					1    2    3    4   5 :=
1					0.1 0.0 0.0 0.1 0.2
2					0.1 0.0 0.15 0.0 0.1
3					0.0 0.1 0.0 0.0 0.0
4					0.0 0.2 0.1 0.1 0.0
5					0.1 0.0 0.2 0.0 0.1
6					0.1 0.3 0.15 0.1 0.1
7					0.2 0.1 0.15 0.0 0.0
;

param T :=	
1	0.4
2	0.3
3	0.25
4	0.7
5	0.5
;

param limOrg :=
1	5.5
2	9
3	6
4	2.4
5	7
6	5.5
7	9.5
;

param lim :=
1 12
2 13
3 10
4 15
5 15
;
end;

