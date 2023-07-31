# Esercizio Immagini

# Ha senso allungarlo di 52 secondi. Miglioramento di  (6164-5870)
# 4892 se forziamo il trasferimento.

# Dati

param nO;		# Numero obiettivi
set O := 1..nO; # Insieme obiettivi
param tI{O};	# Istante iniziale acquisizione obiettivi [s]
param tF{O};	# Istante finale acquisizione obiettivi [s]
param tT{O};	# Tempo trasferimento [s]
param vF{O};	# Valore immagini [€]
param tD;		# Tempo disponibile per il trasferimento [s]
set F;			# Insieme degli obiettivi forzati

# VARIABILI

var scelti{O} binary; # 1 se lo scelgo 0 altrimenti

# VINCOLI

s.t. nonSiIntersecano{i in O, j in O : i < j}:
	scelti[i]*tF[i] <= scelti[j]*tI[j] + (1-scelti[j])*100; # 100 perchè il tF peggiore è 82, per stare larghi uso 100. 

s.t. tempoTrasferimento:
	sum{i in O} scelti[i]*tT[i] <= tD;

s.t. deveEssereTrasferito{i in F}:
	scelti[i] = 1;

# OBIETTIVO

maximize z : sum{i in O} scelti[i]*vF[i];


#################


data;

set F := 2 3 6 13 16 24 37;

param nO := 40;

param tD := 300;

param vF :=
1 400 
2 280 
3 186 
4 325 
5 315 
6 290 
7 281 
8 256 
9 289 
10 333 
11 401
12 286 
13 245 
14 197 
15 245 
16 233 
17 168 
18 312 
19 176 
20 348 
21 194 
22 396 
23 296 
24 267 
25 339 
26 229 
27 201 
28 300 
29 360 
30 411 
31 284 
32 293 
33 330 
34 209 
35 248 
36 190 
37 184 
38 294 
39 299 
40 310;


param tT :=
1 10 
2 12 
3 18 
4 17 
5 15 
6 21 
7 10 
8 28 
9 24 
10 15 
11 16 
12 18 
13 24 
14 17 
15 25 
16 12 
17 11
18 16 
19 16
20 17 
21 15 
22 12 
23 15 
24 11 
25 15 
26 19 
27 18 
28 20 
29 12
30 28 
31 13 
32 16 
33 17 
34 13 
35 14 
36 14 
37 19
38 10 
39 10 
40 11;

param tF :=
1 6   
2 8
3 10 
4 14 
5 18 
6 21 
7 22 
8 24 
9 28 
10 30 
11 35 
12 40 
13 42 
14 44 
15 48 
16 50 
17 48 
18 48 
19 52 
20 50
21 56 
22 54 
23 56 
24 70 
25 62 
26 66 
27 64 
28 64 
29 68 
30 70 
31 68 
32 70 
33 72 
34 72 
35 72 
36 78
37 76 
38 80 
39 84 
40 82;

param tI :=
1 0
2 4
3 8 
4 12 
5 16 
6 20 
7 20 
8 22 
9 24 
10 28 
11 32 
12 36 
13 40 
14 40 
15 40 
16 42 
17 44 
18 45
19 46 
20 47 
21 48 
22 50 
23 54 
24 58 
25 60 
26 61 
27 62 
28 63 
29 64
30 65 
31 66 
32 66 
33 66 
34 68 
35 70 
36 72 
37 74 
38 75 
39 75 
40 78;

end;
