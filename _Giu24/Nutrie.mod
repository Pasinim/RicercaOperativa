reset;
set Att;
param tX{Att}; # Durata con solo la sostanza X [min]
param tY{Att}; # Durata con solo la sostanza Y [min]
param predecessori{Att, Att} binary; # Matrice che indica: per svolgere i è necessaria l'attività j

var q >= 0, <= 1; # Percentuale di sostanza X (0 <= q <= 1)
var t{Att} >= 0; # Tempo per il completamento dell'attività A

# Vincoli
s.t. durata {i in Att}:
    t[i] >= q * tX[i] + (1 - q) * tY[i];

s.t. precedenza {i in Att, j in Att: predecessori[i, j] = 1}:
    t[i] >= t[j];

# Funzione obiettivo
minimize tempoTotale: sum {i in Att} t[i];

data;
set Att := A B C D E F G H;

param tX :=
A 30
B 15
C 25
D 32
E 14
F 19
G 20
H 10;

param tY :=
A 20
B 45
C 5
D 12
E 12
F 49
G 10
H 18;

param predecessori:
       A B C D E F G H :=
A      0 0 0 0 0 0 0 0
B      0 0 0 0 0 0 0 0
C      0 0 0 0 0 0 0 0
D      1 0 0 0 0 0 0 0
E      1 1 0 0 0 0 0 0
F      0 1 1 0 0 0 0 0
G      0 0 0 1 1 0 0 0
H      0 0 0 1 1 0 0 0;

solve;

display q, t;
end;
