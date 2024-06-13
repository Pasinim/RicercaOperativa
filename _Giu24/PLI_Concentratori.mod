param nS := 6;
set S := 1..nS;
set C := 1..2;
param costi{S, S};
param domanda{S};
param capacita{S};

var x{S, S} binary; #Indica a quale concentratore è assegnata la stazione
var y{S} binary; #Indica se 



#Ogni stazione assegnata ad un concentratore
s.t. assegnamento{s in S}: 
	sum {s2 in S} x[s,s2]>=1;
s.t. assegnamentoZ:
	sum {s in S} y[s] = 2;
#Definiione capacità massima. La capacità massima dpende da dove si trova il concentratore
s.t. maxCapacita {c in S}:
	sum{s in S} domanda[s]	<= y[c] * capacita[c];
minimize costo:
	sum {s1 in S, s2 in S} costi[s1, s2] * domanda[s1] * x[s1,s2];
	

data;
param costi: 1	2	3	4	5	6 :=
1 12 45 18 27 19 18
2 38 34 18 28 34 28
3 11 10 15 34 23 10
4 37 39 31 28 29 21
5 15 34 11 20 28 15
6 12 30 20 18 27 24;

param domanda :=
1 100
2 150
3 100
4 200
5 200
6 300;

param capacita :=
1 650
2 500
3 550
4 450
5 550
6 600
;


end;

