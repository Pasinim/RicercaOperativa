# Esercizio Terreno - PL

# DATI
param W;                    # Base del rettangolo (metri)
param H;                    # Altezza del rettangolo (metri)
set R := 1..H;              # Insieme delle righe
set C := 1..W;              # Insieme delle colonne
param k;                    # Coefficiente di costo [€/(mc*m)]
param q {R,C};              # Quota di ogni quadratino (metri)
param M := sum {r in R, c in C} q[r,c] / (W*H);	                        # Quota media del terreno
param d {i in R, j in C, r in R, c in C} := sqrt((i-r)^2+(j-c)^2);      # Distanza tra celle

# VARIABILI
var x {R,C,R,C} >=0;	# Quantità spostate da cella a cella [mc]

# VINCOLI
# Livello finale di ogni cella [m]
subject to Bilanciamento {r in R, c in C}:
  sum {i in R, j in C} x[i,j,r,c] - sum {i in R, j in C} x[r,c,i,j] + q[r,c] = M;

# OBIETTIVO
# Minimizzare costi di trasporto terra [€]
minimize z: sum {i in R, j in C, r in R, c in C} k * x[i,j,r,c] * d[i,j,r,c];

#############################
data;
param W := 20;
param H := 10;
param k := 0.5;

param q: 	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20 :=
1			-5	-4	-3	-2	-1	0	-1	-1	-1	0	1	1	1	2	3	4	3	3	4	5
2			-5	-4	-3	-2	-1	0	0	0	0	1	2	1	0	1	2	3	2	2	3	4
3			-4	-3	-3	-2	-1	0	1	0	1	0	1	0	-1	0	1	2	1	1	2	3
4			-4	-3	-2	-2	-1	0	1	0	1	1	1	0	-1	-1	0	1	0	0	1	2
5			-3	-2	-2	-2	-1	0	1	0	1	1	1	1	0	0	1	0	-1	-1	0	1
6			-2	-2	-2	-1	-1	0	1	1	1	2	2	2	1	0	0	-1	-2	-2	-1	0
7			-1	-1	-1	0	0	1	2	2	2	3	3	3	2	1	0	-1	-2	-3	-2	-1
8			0	0	-1	0	1	2	3	3	3	4	4	4	3	2	1	0	-1	-2	-3	-2
9			1	1	0	1	2	3	4	4	4	5	5	5	4	3	2	1	0	-1	-2	-3
10			2	2	1	2	3	4	5	5	5	6	6	6	5	4	3	2	1	0	-1	-2;

end;
