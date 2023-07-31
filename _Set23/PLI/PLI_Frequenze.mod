param k := 5;
param nF := 22;
set F := 1..nF;
param freq{F}; 

var x{F} binary; #assegnamento frequenze
subj to incompatibilita{i in F, j in F: i<j and (freq[j]-freq[i] < k)}:
	x[i] + x[j] <= 1;

maximize z:
	sum {i in F} x[i];
data;
param freq :=
1 101
2 103
3 105
4 107
5 109
6 110
7 112
8 114
9 116
10 118
11 121
12 124
13 125
14 128
15 129
16 132
17 133
18 134
19 135
20 136
21 138
22 140;

end;

