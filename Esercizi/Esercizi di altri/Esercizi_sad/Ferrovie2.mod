# Esercizio Ferrovie

param nS;                   # Numero stazioni
set S := 0..nS;             # Insieme delle stazioni
set T within {S cross S};   # Insieme delle tratte
param nT{T};                # Numero treni al giorno per ogni tratta
param nV{T};                # Numero vagoni per treno per tratta
param cV{T};                # Capacità vagone per tratta [ton] 
param nM;                   # Numero merci
set M := 1..nM;             # Insieme delle merci
param val{M};               # Valore delle merci [€/ton]
param limM{S,M};            # Limite massimo scaricabile [ton]

# VARIABILI

var vol{T,M} >= 0;              # Volume delle merci per ogni tratta per ogni merce     

# VINCOLI

# Vincolo di flusso, ciò che entra è uguale a ciò che esce.
s.t. flusso{m in M, i in S: i not in {0,9}}:
    sum{ (j,i) in T} vol[j,i,m] = sum{(i,j) in T} vol[i,j,m] ;

s.t. maxScaricabile{i in S,m in M}:
     sum{(i,j) in T} vol[i,j,m] <= limM[i,m];

# Limite sugli archi
s.t. maxMerciTratta{(i,j) in T}:
    sum{m in M} vol[i,j,m] <=  nT[i,j]*cV[i,j]*nV[i,j];

s.t. maxMerciTratta6T:
    sum{m in M} vol[6,9,m] <= nT[6,9]*cV[6,9]*(nV[6,9]-2);
# OBIETTIVO

maximize z : sum{(0,j) in T,m in M} vol[0,j,m]*val[m];

####################à

data;

param nS := 9;
param nM := 3;

param val :=
1  80
2  50
3  65;

set T := (0,1)  (0,2)  (1,3)  (1,4)  (2,4)  (2,5)  (3,6) 
         (3,7)  (4,6)  (4,7)  (4,8)  (5,7)  (5,8)  (6,9)
         (7,9) (8,9);

param limM : 1 2 3 :=
0  1000  1000 1000
1 300 1800 1400
2 250 900 100
3 900 650 1400
4 2000 1500 2000
5 1000 1000 1000
6 1200 1200 1400
7 600 700 950
8 300 1700 1900
9 1000 1000 1000;


param :        nT                       nV               cV   := 
0,1             4                 		10               20
0,2             4                  		 8               15
1,3             2                 		10      	     20
1,4             3                  		 6               20
2,4             8                  		 2               16
2,5             1                  		 8               16
3,6             5                 		 4               16
3,7             4                 		 6               16
4,6             3                  		 5               16
4,7             3                  		 4               16
4,8             3                  		 5               16
5,7             4                 		18               10
5,8             4                 		10               10
6,9             3                  		 9               18
7,9             5                  		 3               20
8,9             2                 		11               18;

end;
