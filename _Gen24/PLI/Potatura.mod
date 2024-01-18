set P;
set M; #Insieme manodopera
param c{M};
param eff{P}; #Effetto potatura
param manod{P,M}; #Manodopera necessaria [h/albero]
param uB{M}; #Limite superiore manodopera[h]
param lB{P}; #Limite inferiore potatura 

var x{P, M} >= 0; #Numero di alberi potati con una determinata modalita
s.t. limiteMandopera {m in M}: sum{p in P} x[p,m] * manod[p,m] <= uB[m];
s.t. limiteAlberi {p in P}: sum{m in M} x[p,m] >= lB[p];

#Massimizzare efficacia della potatura
maximize z1: sum{p in P, m in M} x[p,m] * eff[p];

#Minimizzare spesa
#minimize z2: sum{p in P, m in M} c[m]*manod[p,m]*x[p];
data;
set P := Pioppo Platano Betulla Olmo;
set M := Manuale Meccanico;
param c :=
Manuale 20
Meccanico 60;
param eff :=
Pioppo  5
Platano 7
Betulla 8
Olmo  15;
param manod : Manuale Meccanico :=
Pioppo 		5 	0.8333
Platano 	10 	2.0000
Betulla 	2.5 1.6667
Olmo	 	1 	0.6667;
param uB :=
Manuale 100
Meccanico 75;
param lB :=
Pioppo   35
Platano  20
Betulla  10
Olmo 	 5;
end;

