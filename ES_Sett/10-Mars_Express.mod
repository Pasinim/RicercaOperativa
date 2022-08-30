#Dati
set nO;
set nD;
param dati {nO, nD}; #quantita di dati previsti in ingresso [Mbit]
param t {nO}; #finestra disponibile per la trasmissione dei dati [minuti]
param v; #velocità di trasmissione [Mbit/minuto]
param c {nD}; #capacità memoria [Mbit]
param r {nD}; #riempimento iniziale memoria [Mbit]

#Variabili
var x {nO, nD} >= 0; #dati scaricati per ogni orbita [Mbit]
var y {nO, nD} >= 0; #dati rimasti in memoria dopo ogni orbita [Mbit]
var z {nO, nD} >= 0; #Dati presenti dopo input [Mbit]
#ad ogni orbita si svuotano i dati e poi si registrano altri dati


#Vincoli
subject to riempimento_max_1orbita {j in nD}:
	x[1,j] <= c[j] - r[j];

subject to riempimento_max {j in nD, i in nO : i > 1}:
	x[i, j] <= c[j];
	
subject to trasferimento_massimo {i in nO}:
	sum {j in nD} x[i, j] <= v * t[i];


#Ob: Minimizzare il massimo livello di riempimento della memoria dei dispositivi


data;

set nO := 1..10;
set nD := 1..5;
param v := 9;

param : c	r :=
	1 1000 500
	2 1200 600
	3 1000 500
	4 500 250
	5 700 350
	;
	
param dati :   1	2	3	4	5 :=
			1 	35	 0	80	25	50
			2	200	70	100 25 	0
			3 	0 150 0 25 100
			4 	600 300 0 25 75
			5 	200 0 210 25 200
			6 	50 0 85 0 45
			7 	40 60 50 0 300
			8 	300 90 20 60 0
			9 	0 100 100 60 20
			10 	0 20 100 60 250
			;
			
param t :=
		1 45
		2 47
		3 55
		4 45
		5 35
		6 42
		7 30
		8 35
		9 44
		10 40
;
end;
