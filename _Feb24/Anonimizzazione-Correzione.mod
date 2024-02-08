# Esercizio Anonimizzazione
# DATI
reset;
param nP;
set P := 1..nP;
param nA;
set A := 1..nA;
param K;
param nC := floor (nP/K);
set C := 1..nC;
param v {P,A};

# VARIABILI
var w {P,C} binary;			# Variabili di assegnamento
var y {C,A};				# Attributi di ogni rappresentante di cluster
# Distanza tra ogni persona ed ogni rappr. di cluster
var d {p in P,c in C} = sqrt(sum {a in A} (v[p,a]-y[c,a])^2);

# VINCOLI
# Vincoli di assegnamento
subject to Assign {p in P}: sum {c in C} w[p,c] = 1;
# Vincoli di cardinalità dei clusters
subject to Cardinality {c in C}: sum {p in P} w[p,c] >= K;
  
# OBIETTIVI
# Obiettivo 1: Min somma distanze tra ogni persona ed il rappr. del suo cluster
minimize z1: sum {p in P,c in C} d[p,c] * w[p,c];

# Obiettivo 2: Min max distanza tra ogni persona ed il rappr. del suo cluster
#var alpha;
#minimize z2: alpha;
#subject to Minmax2 {p in P,c in C}: alpha >= d[p,c] * w[p,c];

# Obiettivo 3: Min somma dist^2 tra ogni persona ed il rappr. del suo cluster
#minimize z3: sum {p in P,c in C} d[p,c]^2 * w[p,c];

# Obiettivo 4: Min max diff in modulo tra attriibuto di perona e attributo del suo rappr.
#var beta;
#minimize z2: beta;
##subject to Minmax4a {p in P,c in C,a in A}: beta >= ( v[p,a] - y[c,a]) * w[p,c];
#subject to Minmax4b {p in P,c in C,a in A}: beta >= (-v[p,a] + y[c,a]) * w[p,c];

###############################################
data;
param nP := 30;
param nA := 5;
param K := 4;
param v: 1	2	3	4	5 :=
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
solve;
display z1, d;
end;
