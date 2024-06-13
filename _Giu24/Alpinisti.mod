
param nN := 20;
set N := 1..nN; #Insieme degli alpinisti
param nK := 4 ; #Numero di squadre da comporre
param nS := 3; 
set K := 1..nK; #insieme delle squadre
set S := 1..nS; #insieme delle skills

param l{S}; #Livelli minimi di skills richiesti per ogni squadra 
param skills{N,S}; #matrice skills allpinisti
param rischio{N}; #indice di rischio individuale

var x{N, K} binary; #Indica a quale squadra assegnare l'alpinista
s.t. assegnamento {n in N}:
	sum {k in K} x[n,k] <= 1;
s.t. livelloMinimo {s in S, k in K}:
	sum {n in N} x[n,k] * skills[n, s] >= l[s];
#Le squadre devono essere composte da 4 alpinisti
s.t. riempimentoSquadre {k in K}:
	sum {n in N} x[n,k] = 4;
minimize livelloischio:
	sum {n in N, k in K} rischio[n] * x[n,k];

data;
param l := 
1 16
2 16
3 16
;

param skills: 1 2 3 :=
1 3 2 5
2 3 2 5
3 4 5 4
4 4 5 5
5 2 4 4
6 1 4 4
7 2 5 3
8 5 5 3
9 4 5 4
10 5 3 5
11 3 2 5
12 3 5 4
13 4 5 5
14 4 5 4
15 5 4 2
16 5 4 2
17 5 4 3
18 3 1 4
19 4 3 5
20 5 5 4
;

param rischio := 
1 0.21
2 0.15
3 0.12
4 0.11
5 0.12
6 0.14
7 0.08
8 0.10
9 0.05
10 0.19
11 0.13
12 0.01
13 0.07
14 0.15
15 0.18
16 0.16
17 0.09
18 0.08
19 0.02
20 0.10
;

end;
