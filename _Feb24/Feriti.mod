reset ;
param nT;
set T := 1..nT;
param nP;
set P := 1..nP;
param nO;
set O := 1..nO;
param time{T, O}; #Tempo di percorrenza [min]
param cap{P, O}; #capacita [u]
param minTime{T, P}; #Tempo di percorrenza minimo per tipo di paziente
param triage{T, P}; #Pazienti per ogni tipo di triage[u]
param pazTot{P}; #totale pazienti

var x{T, O, P} >= 0;
s.t. capacita {p in P, o in O}:
	sum {t in T} x[t,o,p] <= cap[p,o];
s.t. assegnamento {t in T, p in P}:
	sum {o in O} x[t,o,p] = triage[t,p];
var maxSovraccarico >=0;
s.t. def_maxSovraccarico {o in O}:
	maxSovraccarico >=( sum {t in T, p in P} x[t,o,p]) /(sum{t in T, p in P}  triage[t,p] /nO);

#A:Minimizzare ritardo relativo medio
#minimize z: 
#	sum {p in P, t in T, o in O} x[t,o,p] * time[t,o]/minTime[t,p];
#Ob: B minimizzare il massimo sovraccarico
minimize z: maxSovraccarico;
data;
param nT := 6;
param nO := 8;
param nP := 3;
param pazTot := 1 90 2 20 3 70;
param minTime :
	1	2	3:=
1	10	10	10
2	5	5	5
3	10	10	10
4	15	15	15
5	20	20	20
6	20	20	20;

param time : 
1   2   3   4   5   6   7   8 :=
1      10  12  15  20  32  36  40  50
2      14   8   5  10  30  38  40  48
3      21  22  10  10  32  25  25  40
4      24  22  15  15  20  15  25  45
5      30  30  25  28  27  22  20  30
6      32  35  30  30  28  25  20  20;

param cap :
        1   2   3   4   5   6   7   8 :=
1      12  10   8  10  15  20  20  20
2       5   0   2   0   8   0   0  10
3      15   8  11   5  20  18  13   0;

param triage:
          1   2   3 :=
  1       3   0   5
  2      11   1   6
  3      23   9   0
  4      12   5  12
  5      19   2  19
  6      22   3  28;
  
solve;
display z;
end;

