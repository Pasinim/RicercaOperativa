# Esercizio cavalli
#DATI
set Cavalli ;            # Insieme dei cavalli
param q {Cavalli};      # Quotazione dei cavalli [unitàdimisura]
param budget;           # Budget disponibile[€]

# VARIABILI

var x {Cavalli} >= 0;   # Puntate sui cavalli[€]
var z;                  # Vincita minima[€]

# VINCOLI

#Vincolo sul budget disponibile [€]
subject to Vincolo_di_budget :
   sum {i in Cavalli} x[i] <= budget;

# OBIETTIVO
# Massimizzare la vincita minima [€]
maximize obj: z;
# Vincolo dovuti alla funzione obiettivo maxmin[€]
subject to Maxmin {i in Cavalli}:
   z <= q[i]*x[i];

#####################
data;

set Cavalli := Fulmine Freccia Dardo Lampo;
param q := 
Fulmine 3
Freccia 4
Dardo 5
Lampo 6;

param budget := 57;

end;
