# ESERCIZIO 04 - PLI Sentinelle 

#DATI
param n;					# Numero di incroci
set N := 1..n;				# Insieme dei nodi
set E within N cross N;		# Elenco degli edge (E e' un sottoinsieme del prodotto cartesiano N x N)

#VARIABILI
#Decidere se il nodo fa o non fa parte del dominating set
var x {N} binary;			# Selezione, se c'e o non c'e una sentinella in quel nodo

#VINCOLI
# Ogni incrocio deve essere sorvegliato (abbiamo un vincolo per ogni incrocio)
subject to Sorvegliato {i in N} : 
	x[i] + sum {j in N: (i,j) in E or (j,i) in E} x[j] >= 1;

# Ogni incrocio puo' essere sorvegliato in 2 modi: o c'e una sentinella li' e quindi x[i] = 1
# oppure c'e una sentinella in qualcuno dei nodi adiacenti quindi la somma su tutti 
# i nodi adiacenti delle x[j]  su tutti i "j" adiacenti almeno qualcuna di queste e' 1

#OBIETTIVO
# Scegliere il minor numero possibile delle sentinelle (Minimizzare la cardinalita' del dominating set)
minimize z : sum {i in N} x[i];

#####################
data;

param n := 30;

set E :=
1	 2,
1	 3,
1	 4,
2	30,
3	13,
3	16,
4	 5,
4	 6,
4	24,
5	 6,
5	 8,
5	13,
6	 7,
7	 9,
7	10,
8	 9,
8	12,
8	 1,
8	27,
9	10,
9	27,
10	11,
11	23,
11	29,
12	13,
12	18,
12	19,
12	27,
13	14,
14	15,
14	18,
15	16,
15	17,
18	19,
18	28,
19	20,
19	28,
20	21,
20	22,
20	29,
24	25,
24	26,
27	29;

end;
