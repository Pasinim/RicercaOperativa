param nS;
param nB;
set sostanza := 1..nS;
set benzina := 1..nB;

param risorse{sostanza}; #[barili/gg]
param profitto{benzina}; #[euro/barile]
param prezzo{sostanza}; #[euro/barile]
param lower_b {sostanza, benzina}; #[% di sostanza]
param upper_b {sostanza, benzina}; #[% di sostanza]

#VARIABILI
var x {sostanza, benzina} >= 0;
var z {s in sostanza} >= 0, <= risorse[s]; #quantita consumata di ogni sostanza [barili/gg]
#è necessario introdurre una variabile ausiliaria per memorizzare la quantità totale prodotta di benzina, 
#in modo tale da verificare se i bound sono rispettati
var y{benzina} >= 0; #quantita totale di benzina prodotta [barili/gg]



#VINCOLI
subject to sostanzaUsate {s in sostanza}: #definisco la variabile ausiliaria y ovvero il totale delle sostanze utilizzate
	sum {b in benzina} x[s,b] = z[s];
	
subject to benzinaProdotta{b in benzina}:
	sum {s in sostanza} x[s,b] = y[s]; #definisco y che è il totale della benzina prodotta

#percentuali
subject to lowerB {s in sostanza, b in benzina}:
	x[s, b] >= lower_b[s,b] * y[b]; #devo calcoalre la percentuale

subject to upperB {s in sostanza, b in benzina}:
	x[s, b] <= upper_b[s,b] * y[b]; 


#OBIETTIVO
#massimizzare il guadagno
maximize z:
	sum {b in benzina, s in sostanza} x[b,s] * (profitto[b] - prezzo[b]); 

maximize z:
	sum {b in benzina} y[b] * (profitto[b] - prezzo[b]);


data;
param nS := 4;
param nB := 3;
param risorse :=
A 3000
B 2000
C 4000
D 1000
;

param profitto :=
S 5.5
N 4.5
V 3.5
;

param prezzo :=
A 3
B 6
C 4
D 5
;

param lower_b: S N V :=
A 0 0 0
B 40 10 0
C 0  0  0
D 0  0  0
;

param upper_b: S N V :=
A  30  50  70
B 100 100 100
C 50 100  100
D  0  0    0
;

end;

