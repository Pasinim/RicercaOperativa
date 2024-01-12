param nF := 5; 
param nL := 6;
set F := 1..nF; #Insieme delle fonti di pattume
set L := 1..nL;
param maxC := 4;
param time {L, F}; #Tempo di raggiungimento per ogni cestino [s]
param q{F}; #quantità monnezza [kg/gg]
param c := 20; #Capacità massima [kg]

var x{L} binary; #Variabile di assegnamento, 1 sse nel luogo L viene posto un cestino
var y{F, L} binary; #Indica dove l'utente butta la spazzatura, da F a L
var s{F,L} >=0; #Quantita di spazzatura gettata da F a L 

#Tutta la spazzatura deve essere gettata
s.t. spazzatura{f in F}: sum{l in L} s[f,l] = q[f];
#La quantità di spazzatura gettata in un cestino non può superare la capacità massima
s.t. capacita_max {f in F}:
	sum {l in L} s[f,l] <= c;
	

s.t. cestini: sum {l in L} x[l] = maxC;
s.t. coerenza {l in L, f in F}: y[f,l] <= x[l];
minimize z {f in F}:
	sum{l in L} y[f,l] * time[l,f];
data;
param q :=
1 12
2  8
3  8
4 15
5 12
;
param time : 
	1	2	3	4	5 :=
1	4 20 20 35 40
2   20  5 10 20 20 
3   20  5  8 20 20
4   20  8  5 25 25
5   40 15 12 10 12
6   40 15 20  8  2
;
end;

