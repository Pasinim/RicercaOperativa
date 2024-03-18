# DATI
param nS;
param nT;
set S := 1..nS;
set T := 1..nT;
param w {S,T};

# VARIABILI
var x {S,T} binary;

# OBIETTIVO
maximize z: sum {s in S, t in T} w[s,t] * x[s,t];

# VINCOLI
subject to AssignS {s in S}:
  sum {t in T} x[s,t] <= 1;
subject to AssignT {t in T}:
  sum {s in S} x[s,t] <= 1;
subject to NonCrossing {s1 in S, s2 in T, t1 in T, t2 in T: s1<s2 and t1>t2}:
  x[s1,t1] + x[s2,t2] <= 1;

#################
data;
param nS := 6;
param nT := 6;

param w:	1	2	3	4	5	6	:=
1			1	10	15	47	68	130
2			9	4	7	18	40	98
3			15	10	5	10	23	82
4			45	18	9	8	14	50
5			67	50	31	24	13	29
6			131	100	82	50	26	14;

end;
