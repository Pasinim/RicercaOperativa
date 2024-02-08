reset;
param nP;
set P := 1..nP;
set A;
param k := 4;
param db{P, A};
param nC := floor (nP/k); #Numero massimo di cluster
set C := 1..nC;

var w{P, C} binary; #Assegna una persona ad un cluster
var x{C, A}; #Dfinsice il rappresentatne del cluster
var d{P, C}; #distanza persona - rappesentante del cluter
var maxVal >= 0;
s.t. def_distanza {p in P, c in C}: d[p,c] =  sqrt(sum {a in A} (db[p,a] - x[c,a])^2);
#s.t. assegnazioneRappresentante {c in C}: sum {p in P} x[p,c] = 1;
s.t. assegnazionePersone {p in P}: sum {c in C} w[p,c] = 1;
s.t. maxPersoneCluster {c in C}: sum {p in P} w[p,c] >= k;
#Ip A
minimize z1: sum {p in P, c in C} d[p,c]*w[p,c];
#Ip B: Minimizzare la massima distanza tra un individuo ed il rappresentante del suo cluster.
s.t. def_maxVal{p in P, c in C}: maxVal >= d[p, c]*w[p,c];
#minimize z1: maxVal;
#Ip C: Minimizzare la somma dei quadrati delle distanze 
#tra ogni individuo ed il rappresentante del suo cluster
#minimize z3: sum {p in P,c in C} d[p,c]^2 * w[p,c];
#Ip D:Minimizzare la massima differenza in valore assoluto tra
# un attributo di un individuo e lo stesso attributo del rappresentante 
# del suo cluster.
var maxDiff;
s.t. def_maxDiff{c in C, p in P, a in A}: maxDiff >= (db[p,a]*w[p,c] - x[c,a]);
s.t. def_maxDiff2{c in C, p in P, a in A}: maxDiff >= -(db[p,a]*w[p,c] - x[c,a]);
minimize z4: maxDiff;

data;

param nP := 30;
set A := A1 A2 A3 A4 A5;
param db :
	A1	A2	A3	A4	A5 :=
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
30	23	66	93	27	40;


display z1, d, maxDiff;
end;

