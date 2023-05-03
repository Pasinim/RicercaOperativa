# Esercizio: Project management

# INSIEMI
set activities := {"database", "frontend", "backend", "testing"};
set levels     := {"Sr", "Md", "Jr"};

# DATI
param tariffa {activities, levels};  # Euro/g
param durata  {activities, levels};  # giorni
param deadline := 40;                # giorni

# VARIABILI
var x {activities, levels} binary;

# OBIETTIVO
minimize cost: sum {a in activities, l in levels} tariffa[a,l] * x[a,l];

# VINCOLI
subject to Assignment {a in activities}:
  sum {l in levels} x[a,l] = 1;
  
subject to Completion_time:
  sum {a in activities, l in levels} durata[a,l] * x[a,l] <= deadline;

#####
data;
#####

param tariffa :  "Sr" "Md" "Jr" :=
"database"        330  280  220
"frontend"        370  320  260
"backend"         350  300  250
"testing"         320  260  180 
;

param durata :   "Sr" "Md" "Jr"  :=
"database"         9   11   15
"frontend"        12   17   24
"backend"          7    8    7 
"testing"          5    6    8
;

end;


