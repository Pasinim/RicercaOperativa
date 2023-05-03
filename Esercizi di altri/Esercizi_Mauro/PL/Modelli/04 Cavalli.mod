# Esercizio Cavalli

# DATI
set Cavalli;         # Insieme di cavalli
param q {Cavalli};   # Quotazioni [adimensionale]
param b;             # Budget disponibile [€]

# VARIABILI
var x {Cavalli} >=0; # Puntate [€]
var y >=0;           # Vincita minima [€]

# VINCOLI
# Vincolo di budget [€]
subject to Budget:
  sum {c in Cavalli} x[c] <= b;

# Vincoli per linearizzare la f.o. max-min [€]
subject to Linearizzazione {c in Cavalli}:
  y <= q[c] * x[c];

# OBIETTIVO
# Massimizzazione vincita nel caso peggiore [€]
maximize z: y;

###########
data;
set Cavalli := Fulmine Freccia Dardo Lampo;
param q :=
Fulmine	3
Freccia	4
Dardo	5
Lampo	6
;

param b := 57.00;

end;
