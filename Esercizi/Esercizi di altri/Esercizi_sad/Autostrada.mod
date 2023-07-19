# Esercizio Autostrada


# DATI

param nS;				# Numero caselli
set c := 1..nS;			# Insieme dei caselli
param f{c,c};			# Flusso dei veicoli per ogni ora.
param v{c,c};			# Vantaggio nel percorrere l'autostrada in euro.

# VARIABILI

var p{c} >= 0;				# Pedaggio
var w{c} >= 0;				# Guadagno ad ogni casello

# VINCOLI

s.t. pedaggio{i in c, j in c : i > j}:
	v[j,i] >= sum{k in c : k > j and k <= i } p[k];



# OBIETTIVO

maximize z : sum{i in c, j in c: i > j} (f[j,i] * sum{k in c : k > j and k <= i } p[k]);


#######################

data;

param nS := 8;
param f : 1 2 3 4 5 6 7 8 :=
1     0 460 510 450 325 430 450 500
2     0   0 120 150 150 220 240 250
3     0   0   0 260 150 120 110  90
4     0   0   0   0  80 130 140 130
5     0   0   0   0   0 200 210 240
6     0   0   0   0   0   0 340 200
7     0   0   0   0   0   0   0 185
8     0   0   0   0   0   0   0   0;

param v : 1   2   3   4   5   6   7   8 :=
1         0  10  15  20  26  33  38  41
2         0   0  10  18  21  30  34  37
3         0   0   0  10  15  24  30  33
4         0   0   0   0  10  17  21  31
5         0   0   0   0   0  10  14  19
6         0   0   0   0   0   0  10  14
7         0   0   0   0   0   0   0  10
8         0   0   0   0   0   0   0   0;

end;
