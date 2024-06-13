param nP := 20;
set P := 1..nP;
param K := 5;
param x{P};#ascisse
param y{P}; #odrinate
set clusters:= 1..K;

#asxisse e ordinaate per il centroide di ogni clusters
var xx{clusters}; 
var yy{clusters};
var w{P, clusters} binary;

var S{k in clusters} = sqrt(1/(sum {p in P} w[p,k]) * sum {p in P} w[p,k] * ((xx[p] - x[p])^2 +  (yy[p] - y[p])^2));
var M{h in clusters, k in clusters} = sqrt((xx[h] - xx[k])^2 + (yy[k] - y[k])^2);
var R {h in clusters, k in clusters}  = (S[h] + S[k]) / M[h,k];
var D {clusters}

s.t. def_maxD {h in clusters, k in clusters: c1<>c2}:
	D[c1] >= R[c1, c2];
data;

param: x y := 
1 24 9
2 16 33
3 8 32
4 42 31
5 40 45
6 41 89
7 13 71
8 37 64
9 34 66
10 50 58
11 91 43
12 68 27
13 63 29
14 61 45
15 54 50
16 62 79
17 65 75
18 80 81
19 85 67
20 51 56;
end;

