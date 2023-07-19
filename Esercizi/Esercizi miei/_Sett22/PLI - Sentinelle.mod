#Esercizio PLI 4 - Sentinelle
#dati
param n; #Numero incroci
set N := 1..n;
set E within N cross N; #definisco l'insieme degli edge, un sottoinsieme (within) del prodotto cartesiano di tutte le coppie di N\

#Variabili
var x {N} binary;

#Ob: Cerco il minor numero possibile di vertici, facendo in modo che i nodi del grafo siano sorvegliati - devo minimizzae la cardinatlià del dominating set

minimize z: 
	sum {i in N} x[i];

#Vincoli: Ogni incrocio deve essere sorvegliato:
subj to Sorvegliato { i in N}:
	x[i] + sum {j in N: (i, j) in E or (j,i) in E} x[j] >= 1;  #affinchè ogni incorocio sia sorvegliato ogni nodo deve avere una sentinella in i OPPURE c'è una sentinella nei nodi adiacenti



data;

param n := 30;
set E :=  #la virgola separa una coppia dall'altra
1	2,
1	3,
1	4,
2	30,
3	13,
3	16,
4	5,
4	6,
4	24,
5	6,
5	8,
5	13,
6	7,
7	9,
7	10,
8	9,
8	12,
8	13,
8	27,
9	10,
9	27,
10	11,
11	23,
11	29,
12	18,
12	27,
13	14,
14	15,
14	18,
15	16,
15	17,
18	19,
18	28,
20	21,
20	22,
20	29,
24	25,
24	26,
27	29,
;

end;
