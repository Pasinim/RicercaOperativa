#ESERCIZIO PL Cavalli

# DATI
set Cavalli;                # Insieme di cavalli
param q {Cavalli};          # Quotazione per ogni cavallo [adimensionale]
param b;                    # Budget disponibile [Euro]

# VARIABILI
var x {Cavalli} >=0;        # Puntata su ogni cavallo [€]
var y >=0;                  # Vincita minima [Euro]

# VINCOLI

# Vincolo sul budget disponibile per le puntate [Euro]
subject to Budget:
  sum {c in Cavalli} x[c] <= b;

# Vincoli per linearizzare la f.o. max-min [Euro]
subject to maxMin {c in Cavalli}:
  y <= q[c] * x[c];

# OBIETTIVO
# Massimizzare la vincita nel caso peggiore [Euro]
maximize z: y;

####################
data;

set Cavalli := Fulmine Freccia Dardo Lampo;

param q :=
Fulmine     3
Freccia     4
Dardo       5
Lampo       6;

param b := 57.00;

end;
