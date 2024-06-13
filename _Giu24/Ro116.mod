param nP := 30;
param K := 4;	
set P := 1..nP;
set A := 1..5; #insieme degli attributi
param nC := nP/K;
set C := 1..nC; #Insieme dei cluster
param db {P, A};


var y{P, C} binary; #Indica se la persona p appartiene al cluster c
var x{A, C} binary; #indica il valore dell'attributo A per il rappresentante C
var d{P, C}; #distanza di p dal rappresentante

s.t. def_d {p in P, c in C}:
	d[p,c] = sqrt(sum {a in A} (x[a, c] - db[p,a])^2);
#Ogni persona deve essere assegnata ad un cluster:
s.t. assegnamento {p in P}:
	sum {c in C} y[p,c] = 1;
#Ogni cluster deve avere almeno k individui
s.t. appartenenzaCluster {c in C}:
	sum{p in P} y[p,c] >= 4;
	
s.t. rappresentante {c in C}:
	sum{p in P} x[p, c] = 1;
# Minimizzare la somma delle distanze tra ogni individuo ed il rappresentante del suo cluster.
minimize p1 {c in C, r in P}:
	sqrt(sum {p in P} (y[p,c] * db[p,c] - db[r, c] * x[r,c]))^2;

data;
param db : 1	2	3	4	5 :=
1	54	52	100	96	100
2	32	56	36	60	55
3	78	58	7	45	81
4	89	91	46	6	13
5	28	14	66	43	37
6	63	87	82	88	42
7	59	84	92	40	25
8	62	71	46	74	22
9	73	76	85	5	82
10	27	80	30	35	52
11	57	90	58	49	37
12	50	43	72	96	56
13	4	86	98	57	41
14	6	63	49	25	3
15	80	63	95	80	35
16	39	79	74	70	49
17	20	97	7	1	58
18	58	92	99	59	70
19	4	45	3	18	16
20	40	26	5	42	8
21	80	17	68	44	65
22	46	49	15	26	53
23	73	10	7	99	7
24	64	15	33	22	52
25	48	12	46	56	17
26	8	67	51	31	91
27	51	41	85	67	63
28	4	7	92	45	89
29	64	28	47	25	54
30	23	66	93	27	40
;
end;
