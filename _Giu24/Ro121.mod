#Coordinate partenza
param xP := 5;
param yP := 20;
#Coordinate arrivo
param xA := 25;
param yA := 8;
param N := 3; #Numero di stati da sorvolare
set R := 0..N; #Insieme stati da sorvolare
set C := 1..N; #Confini da sorvolare
param c{S}; #Costo unitario di sorvolo 
set P {c in C} := 0..nS[c]; #Insieme punti di discontinuita. Il numero di pu nti è diverso per il numero di segmenti


data;
param c :=
   1		1.5
   2		0.8
   3		1.4;

end;

