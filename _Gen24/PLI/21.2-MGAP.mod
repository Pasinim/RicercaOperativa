param nM := 4;
param nJ := 6;
set J := 1..nJ; #Numero jobs
set M := 1..nM; #Numero macchine
set T := 1..2; #Numero livelli
param cap := 20; #Capacita di ogni macchina

param time{T, J , M }; #Tempo impiegato da m per svolgere j
param c {T, J, M};


#Assegnare n Jobs a m macchine
var y {T, J, M} binary; #Variabile di assegnamento

#Ogni lavoro deve essere assegnato
s.t. assegnamento {j in J}:
	sum {t in T, m in M} y[t,j,m] >= 1;

#ogni macchina deve fare solo un lavoro contemporaneamento
#s.t. asegnamentoMacchina{m in M}:
#	sum {t in T, j in J} y[t, j,m] <= 1;

s.t. capacita {m in M}:
	sum {t in T, j in J} time[t,j,m] * y[t,j,m] <= cap;

#Costo complessivo minimo
minimize z:
	sum {t in T, m in M, j in J} y[t, j, m] * c[t,j,m];

data;

param c :=
1 1 1 34
1 1 2 31
1 1 3 22
1 1 4 33
2 1 1 25
2 1 2 18
2 1 3 10
2 1 4 22
1 2 1 25
1 2 2 23
1 2 3 20
1 2 4 20
2 2 1 18
2 2 2 15
2 2 3 13
2 2 4 15
1 3 1 7
1 3 2 8
1 3 3 13
1 3 4 7
2 3 1 14
2 3 2 12
2 3 3 17
2 3 4 13
1 4 1 15
1 4 2 12
1 4 3 16
1 4 4 13
2 4 1 18
2 4 2 14
2 4 3 18
2 4 4 16
1 5 1 2
1 5 2 1
1 5 3 3
1 5 4 2
2 5 1 5
2 5 2 4
2 5 3 7
2 5 4 5
1 6 1 8
1 6 2 9
1 6 3 7
1 6 4 8
2 6 1 11
2 6 2 13
2 6 3 13
2 6 4 14
;



param time :=
1 1 1 5
1 1 2 7
1 1 3 8
1 1 4 10
1 2 1 8
1 2 2 12
1 2 3 13
1 2 4 15
2 1 1 6
2 1 2 9
2 1 3 10
2 1 4 5
2 2 1 11
2 2 2 20
2 2 3 14
2 2 4 8
1 3 1 7
1 3 2 8
1 3 3 13
1 3 4 7
1 4 1 15
1 4 2 12
1 4 3 16
1 4 4 13
2 3 1 14
2 3 2 12
2 3 3 17
2 3 4 13
2 4 1 18
2 4 2 14
2 4 3 18
2 4 4 16
1 5 1 2
1 5 2 1
1 5 3 3
1 5 4 2
2 5 1 5
2 5 2 4
2 5 3 7
2 5 4 5
1 6 1 8
1 6 2 9
1 6 3 7
1 6 4 8
2 6 1 11
2 6 2 13
2 6 3 13
2 6 4 14
;

end;


