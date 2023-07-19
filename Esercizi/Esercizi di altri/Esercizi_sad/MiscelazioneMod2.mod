#Dati
param nS;
set Sostanze := 1..nS;
set Benzina;
param Risorse{Sostanze};		#[barili]
param Costo{Sostanze};			#[€/barile]
param Ricavi{Benzina};			#[€/barile]
param Limiti{Sostanze,Benzina};	#

#Variabili

var consumi {Sostanze,Benzina};	#[barili]
var acquisti{Sostanze};


#Vincoli


#Obiettivo
maximize guadagno: sum {i in Benzina} rendimento[i] * acquisti[i]*10;

#########
data;
param nS := 4;
set Benzina := super, normale, verde;
param Risorse:= 
1		3000
2		2000
3		4000
4		1000;

param Costo :=
1		3
2		6
3		4
4		5;

param Ricavi :=
super		5.5
normale		4.5
verde		3.5;

param Limiti: super, normale, verde :=
1 30 50 70
2 60 90 100
3 50 100 100
4 100 100 100;

end;
