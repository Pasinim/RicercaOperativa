# Esercizio cuori solitari

# Dati

param nU;           # Numero uomini
param nD;           # Numero donne
set U := 1..nU;     # Insieme degli uomini
set D := 1..nD;     # Insieme delle donne
param pU{U,D};      # Preferenze degli uomini verso le donne
param pD{D,U};      # Preferenze delle donne verso gli uomini

# Variabili

var m{U,D} >= 0 <= 1;         # Matrice di assegnamento

# Vincoli

s.t. sommaU{i in U}:
  sum{j in D} m[i,j] <= k;

s.t. sommaD{i in D}:
  sum{j in U} m[j,i] <= k;

s.t. unique{i in U, j in D}:
  m[i,j] >= 

#######################

data;

param nU := 13;
param nD := 8;

param pU: 1 2 3 4 5 6 7 8 :=
1   31   15   27   24   24   21   22   12 
2   16   19   20   23   27   35   37    8  
3   25   30   31    5    8    9   20   15 
4   36   34   29   37   38   26   12   17 
5   23   23   23   25   26   23   22   21  
6   12   14   17   15   16   19   11    5 
7    3    2    6   18   20   22   21   28 
8   34   36   28   27   26   25   30   30 
9   20   18   17   19   19   18   21   20 
10   4    5    7   32    9   30   25   29 
11   5    6    7    6   10    9    9    9 
12  38   37   35   34   33   35   28   27 
13  25   26   28   21   20   16   17   16;

param pD: 1 2 3 4 5 6 7 8 9 10 11 12 13 :=
1 13 15 19 21 23 25 24 24 22 18 16 16 30
2 18 14 15 16 16 15 14 10 12  5  5  8 10
3 23 30 31 28 36 38 39 31 29 27 27 30 31
4 36  4  6 12  9 21 16 16 17 14 13  9 10
5 25 24 22 21 20 17 24 27 28 10 15 18 19
6 24 25 28 21 20 17 15 18 28 29 22 33 11
7 22 22 21 13 16 17 19 20 10 14 20 21 21
8  4  5 12 15  7 13 14 10 20 18 15 13 16;

end;
