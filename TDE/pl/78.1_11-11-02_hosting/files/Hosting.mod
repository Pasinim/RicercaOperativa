# Esercizio: Hosting

# INSIEMI
set Risorse := {"CPU", "RAM", "banda"};

# DATI
param resa   {Risorse};
param prezzo {Risorse};
param limite {Risorse};
param budget := 450;

# VARIABILI
var x {Risorse} >=0;

# OBIETTIVO
maximize Utenze: sum {r in Risorse} resa[r] * x[r];

# VINCOLI
subject to constr_limiti {r in Risorse}:
  x[r] <= limite[r];
  
subject to constr_budget:
  sum {r in Risorse} prezzo[r] * x[r] <= budget;

subject to constr_RAMCPU:
  x["CPU"] >= 2 * x["RAM"];

######
data;
######

param: resa prezzo limite :=
"CPU"   6     5      50
"RAM"   9     8      50
"banda" 4     4      60
;

end;
