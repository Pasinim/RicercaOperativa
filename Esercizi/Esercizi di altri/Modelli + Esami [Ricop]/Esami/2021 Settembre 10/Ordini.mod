# Esercizio ORDINI

# Insiemi e dati
set Jobs := 1..10;

param p {Jobs};    # Processing time
param d {Jobs};    # Deadlines
param M := 9999;

# Variabili
var x {Jobs,Jobs} binary;  # precedenza
var t {Jobs} >=0;          # starting time
var r {Jobs} >=0;          # tardiness
var max_r;                 # max tardiness;

# Obiettivo 1: min sum ritardi
minimize z1: sum {j in Jobs} r[j];

# Obiettivo 2: min max ritardo
#minimize z2: max_r;
s.t. Def_z2 {j in Jobs}: max_r >= r[j];

# Definizione ritardi
s.t. Tardiness {j in Jobs}: r[j] >= t[j]+p[j]-d[j];

# Vincoli
# Vincoli disgiuntivi di precedenza
s.t. Disgiuntivi {i in Jobs, j in Jobs: i!=j}: t[j] >= t[i]+p[i] - M*x[i,j];

s.t. Precedenza {i in Jobs, j in Jobs: i<j}: x[i,j] + x[j,i] = 1;

data;

param: p d :=
 1 24  50
 2 12  50
 3 30  90
 4 15  70
 5 18  50
 6  7  80
 7  8 100
 8 15  90
 9 14 120
10 22 150
;

end;
