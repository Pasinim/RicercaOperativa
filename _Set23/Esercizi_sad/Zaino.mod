# Esercizio Zaino

# cover clique gomory mir m sono dei parametri per la risoluzione
# parte dalla radice l'ottimizzatore del continuo.
# 13-esima colonna 0 del tableau, non contata.
# Controlla lo scaling (non vuole numeri troppo grandi o piccoli nel modello)
# Costruisce la base iniziale
# Risolve il rilassamento continuo, quindi trova una variabile frazionaria (tutte = a 0 ed una in base)
# Inizia l'ottimizzazione intera.
# Branch and bound. Usa certi step del simplesso duale. perchè ogni volta che genera un figlio a partire del padre il figlio è una restrizione del padre. 
# Genera vari tagli, tra cui un taglio di mset(?) inequality
# Dopo tutti i tagli, fa branching e ricomincia da capo.
# n passi pivot, bound inferiore (in questo caso primale), bound superiore (in questo caso duale).

# DATI

param n;			# Numero oggetti
set N := 1..n;		# Insieme oggetti
param a {N};		# Volumi
param c {N};		# Valori
param b;			# Capacità

# VARIABILI

# var x{N}  >= 0;
# var x{N}  >= 0, integer;# Numero di confezioni indivisibili

var x {N} binary ;	# Selezione oggetti

# VINCOLI

# MAI SCRIVERE NELLA CONDIZIONE DI SOMMA VARIABILE = A QUALCOSA. Un test sulle variabili non può verificarlo.

# Vincoli di capacità
subject to Capacity:
	sum {i in N} a[i] * x[i] <= b;

# OBIETTIVO

# Massimizzare valore complessivo

maximize z: sum {i in N} c[i] * x[i];

###############

data;

param n := 120;
param : a c :=
1	41	16
2	39	19
3	45	19
4	28	12
5	56	22
6	58	29
7	37	18
8	63	26
9	49	22
10	33	14
11	42	19
12	52	25
13	41	16
14	39	19
15	45	19
16	28	12
17	56	22
18	58	29
19	37	18
20	63	26
21	49	22
22	33	14
23	42	19
24	52	25
25	41	16
26	39	19
27	45	19
28	28	12
29	56	22
30	58	29
31	37	18
32	63	26
33	49	22
34	33	14
35	42	19
36	52	25
37	41	16
38	39	19
39	45	1
40	28	12
41	56	22
42	58	29
43	37	18
44	63	26
45	49	22
46	33	14
47	42	19
48	52	25
49	41	16
50	39	19
51	45	19
52	28	12
53	56	2
54	58	29
55	37	18
56	63	26
57	49	22
58	33	14
59	42	19
60	52	25
61	41	16
62	39	19
63	45	19
64	28	12
65	56	22
66	58	29
67	37	18
68	63	26
69	49	22
70	33	14
71	42	19
72	52	25
73	41	16
74	39	19
75	45	19
76	28	12
77	56	22
78	58	29
79	36	112
80	63	26
81	41	22
82	33	14
83	42	19
84	52	25
85	41	121
86	39	19
87	45	19
88	28	120
89	56	22
90	5	29
91	37	18
92	63	26
93	9	22
94	33	14
95	42	19
96	1	25
97	41	16
98	39	19
99	415	19
100	28	12
101	12	22
102	51	29
103	10	18
104	63	26
105	41	22
106	33	14
107	42	19
108	52	25
109	41	16
110	39	19
111	45	19
112	28	12
113	56	22
114	58	29
115	37	18
116	63	26
117	49	22
118	33	14
119	42	19
120	52	25;

param b := 3151;
end;
