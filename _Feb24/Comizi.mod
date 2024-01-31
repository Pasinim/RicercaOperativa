#reset;
param nC; 
set C := 1..nC;
set T := 1..2; #Insieme dei tipi di compizi
param dista{C};
param audience{C, T}; 
param v := 100; #[km/h]
param tf := 0.5; #Tempo fisso per ogni sosta {h]
param tTot := 16;
param tComizio{T}; #Tempo comizio [h]

var x {C, T} binary; #Variabile binaria che indica in quale citta andare e che tipo di comizio tenere
var tempoFisso >= 0;
var tempoComizio >= 0;
var tempoStrada >= 0;

s.t. def_tempoFisso: sum {c in C, t in T} x[c,t] * tf = tempoFisso;
s.t. def_tempoComizio: sum {c in C, t in T} x[c,t] * tComizio[t] = tempoComizio;
#s.t. def_tempoStrada: sum{c in C, t in T} x[c,t] * dista[c]/v = tempoStrada; 
s.t. def_tempoStrada{c in C}: tempoStrada * v >= dista[c] * sum{t in T} x[c,t]; 
s.t. tempoTotale:
	tempoFisso + tempoComizio + tempoStrada <= tTot;
s.t. assegnamentoComizio{c in C}: sum {t in T} x[c,t] <= 1;	
#s.t. tempoTotale {t in T}: 
 #  sum {c in C} x[c,t] * (tComizio[t] + tf) 
 #  	+ sum{c in C: c > 1} (x[c,t] * dista[c] - x[c-1,t] *dista[c-1])/v <= tTot;
#Devo calcolare anche il tempo di viaggio

maximize z :
	sum {c in C, t in T} x[c,t] * audience[c,t];
data;
param nC := 25;
param tComizio :=
1   1
2   1.5;
param dista := 
  1	   0			
  2	  12			
  3	  25			
  4	  31			
  5	  46			
  6	  60			
  7	  72			
  8	  89			
  9	 110			
  10  127		
  11  142		
  12	 160			
  13	 166			
  14	 170			
  15	 180			
  16	 193			
  17	 211			
  18	 218			
 19	 230			
  20	 244			
  21	 263			
  22	 280			
  23	 285			
  24	 292			
  25	 298;

param audience :
1	2 := 
1 120	  140  
2 80	  200
3 60	  100
4 400	  450
5 200	  250
6 10	   30
7 500	  550
8 90	  110
9 50	   80
10 300	  330
11 10	   50
12 60	   90
13 230	  280
14 190	  240
15 100	  150
16 100	  110
17 100	  180
18 200	  300
19 80	  180
20 10	   20
21 80	  150
22 90	  100
23 120	  130
24 500	  650
25 400	  490;
#solve;
#display x, tempoTotale,z ;
#display tempoStrada, tempoFisso, tempoComizio;
end;
