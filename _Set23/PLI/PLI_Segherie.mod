param nV := 15;
param nS := 5; #segherie
set S := 1..nS; 
set V := 1..nV; #Punti di raccolta
param l := 100; #lato del quadrato[km]
set E within V cross V;
param x_raccolta{V}; #coordinate[x]  dei punti di raccolta
param y_raccolta{V}; #coordinate[y]  dei punti di raccolta
param x_segherie{S}; #coordinate[x]  segherie
param y_segherie{S}; #coordinate[y]  segherie
param q{V};
param costiManutenzione{S}; #[l/gg]
param capacita{S}; #[quintali/gg]
param costiTrasporto := 10000; #prezzo al km [l/km]

var y{S} binary;
var x{V, S} binary; #indica se la segheria è aperta oppur eno

subj to copertura {v in V}:
	sum {s in S} x[v,s] * x_raccolta[v] * y_raccolta[v] >= 1;


data;
param : x_segherie y_segherie costiManutenzione capacita:=
1 0.25 0.20	3000  190
2 0.55 0.25  4500  240 
3 0.90 0.15  3000  200
4 0.15 0.45  4400  220 
5 0.85 0.55  4600  190
;
 
param:  x_raccolta      y_raccolta       q :=
1       0.40    0.66     58
2       0.76    0.17     35
3       0.11    0.47     27
4       0.65    0.58     42
5       0.18    0.88     60
6       0.19    0.02     31
7       0.62    0.62     18
8       0.90    0.17     24
9       0.66    0.95     36
10      0.42    1.00     37
11      0.95    0.12     48
12      0.16    0.26     39
13      0.07    0.71     53
14      0.75    0.43     61
15      0.30    0.76     29;

end;

 