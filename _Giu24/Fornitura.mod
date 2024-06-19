set P;
set I;
param nT;
set T:= 1..nT;
param costi{T, P};
param costiConservazione{P};
param cc := 7100; #Capacita cella[dm3]
param fm := 300; #Fornitura minima [kg]
param comp{I, P}; #Composizione
param v{I}; #Volume ingredienti
param qMin{T};
param qMax{T}; #Limite massimo quantita trasportabile [kg]



data;
set P := A B;
set I := X Y Z;
param costi: A B :=
1 12 15
2 8 11.5
3 10 12;

param costiConservazione :=
A 1.8
B 0.4;

param comp:	A	B := 
X .20 .50
Y .60 .10
Z .20 .40
;

param v :=
X 20
Y 35
Z 15
;

param: qMin qMax := 
1 65 135
2 70 135
3 50 135
;
end;

