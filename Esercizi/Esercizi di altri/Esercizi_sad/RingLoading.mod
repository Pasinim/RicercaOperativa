# Esercizio Ring Loading 

# DATI

param nC;				# Numero di calcolatori nella rete.
set c := 1..nC;			# Insieme dei calcolatori nella rete.
param t{c,c};			# Traffico massimo tra due calcolatori [Mb/s].

# VARIABILI

var cap >= 0;			# Capacità degli archi [Mb/s]
var archi{i in c,j in c: i <> j} binary;	# 1 se è orario, 0 se è anti orario

# VINCOLI

s.t. flusso{i in c}:
	sum{j in c, k in c: ((j > k) and (k > i)) or ((j <= i) and (j > k)) or ( (j <= i) and (k > i)) } t[j,k]*archi[j,k] + sum{j in c, k in c: ( (j > k) and ( k <= i) and (j > i)) or ( ( j < k) and ( k <= i) ) or ( (k > j) and (i <= k) and (j > i)) } t[j,k]* (1 - archi[j,k])  <= cap;

# OBIETTIVO


minimize z : cap;

################

data;

param nC := 10;

param t: 1	 2	 3 	 4 	 5 	 6   7 	 8	 9	10 :=
1		 9   7   7   8   7   9   9   6   6  10
2		 7   7   7   7   7   8   5   7  10   9
3		 7   5   8   8   8  10   6  10   9  10
4		 7  10   7  10   9   8   5  10   7   9
5		10   5   6  10   5   8   7   9   8   7
6		 6   7   8   7   8  10   9   5   9   7
7		 9   5   8   9   7  10   8   9  10   7
8		 6   5   9   5   6   8  10   6   9   8
9		 7   5   5   8   8   8  10   7   9   7
10		 8   5   5   7   8   9   7   6   5   8;

end;
