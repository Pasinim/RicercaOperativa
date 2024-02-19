# Esercizio Davies Bouldin index

# DATI
param N;
set Punti := 1..N;
param x {Punti};
param y {Punti};
param K;
set Clusters := 1..K;

# VARIABILI
var xx {Clusters};
var yy {Clusters};
var w {Punti,Clusters} binary;

# VAR. AUSILIARIE
var S {c in Clusters} = sqrt(1/(sum {p in Punti} w[p,c]) * sum {p in Punti} w[p,c] * ((xx[c]-x[p])^2 + (yy[c]-y[p])^2));
var M {c1 in Clusters, c2 in Clusters} = sqrt((xx[c1]-xx[c2])^2+(yy[c1]-yy[c2])^2);
var R {c1 in Clusters, c2 in Clusters: c1<>c2} = (S[c1] + S[c2]) / M[c1,c2];
var D {Clusters};

# VINCOLI
# Definizione di D
subject to MaxD {c1 in Clusters, c2 in Clusters: c2<>c1}:
  D[c1] >= R[c1,c2];

# Vincoli di assegnamento
subject to Assign {p in Punti}:
  sum {c in Clusters} w[p,c] = 1;

# Vincoli sulla cardinalità dei clusters
subject to Card {c in Clusters}:
  sum {p in Punti} w[p,c] >= 1;

# OBIETTIVO
minimize z: 1/N * sum {c in Clusters} D[c];

#############################
data;
param N := 20;
param K :=  5;

param:	x	y	:=
1		24	 9
2		16	33
3		 8	32
4		42	31
5		40	45
6		41	89
7		13	71
8		37	64
9		34	66
10		50	58
11		91	43
12		68	27
13		63	29
14		61	45
15		54	50
16		62	79
17		65	75
18		80	81
19		85	67
20		51 	56;

end;
