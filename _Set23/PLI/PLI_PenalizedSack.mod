
param nO := 30;
set O := 1..nO;
param val{O};
param vol{O};
param pen{O};
param cMax := 1000;
#Variabii
var x{O} binary; # 1 sse l'oggetto viene preso
var maxP >= 0;
#Vincoli
subj to def_maxP {o in O}:
	maxP >= pen[o] * x[o];
subj to maxVol:
	sum {o in O} x[o] * vol[o] <= cMax;
#Ob
maximize z:
	sum {o in O} x[o] * val[o] - maxP;



data;
param val := 
1  27
2  41
3  23
4  32
5  39
6   8
7  50
8   2
9  30
10 54
11 85
12  2
13 23
14 18
15 73
16 41
17 78
18 32
19 18
20 23
21 34
22 58
23 12
24 31
25 63
26 14
27 13
28 87
29 56
30 32;

param vol :=
1  10
2  58
3  97
4  23
5  19
6   5
7  71
8  94
9  81
10 92
11 74
12  3
13 41
14 57
15 12
16 47
17 10
18 25
19 61
20 23
21 74
22 28
23 62
24 35
25 63
26 49
27 13
28 95
29 87
30 23;

param pen :=
1  34
2  59
3  87
4  34
5  40
6  29
7  84
8  67
9  53
10 48
11 53
12 85
13 37
14 49
15 85
16 37
17 90
18 57
19 62
20 34
21 75
22 88
23 43
24 75
25 93
26 75
27 39
28 58
29 37
30  6;
end;


