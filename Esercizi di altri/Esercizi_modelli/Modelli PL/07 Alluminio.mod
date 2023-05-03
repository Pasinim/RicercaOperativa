# Esercizio: Alluminio

# DATI
set Metalli;
set Materiali;
set Materiali2 within Materiali;
param a {Metalli,Materiali};  # Composizione percentuale dei materiali
param pmin {Metalli};         # Percentuale minima richiesta
param pmax {Metalli};         # Percentuale massima ammessa
param q {Materiali2};         # Quantità di materiali disponibile [ton]
param c {Materiali};          # Costo dei materiali [€/ton]
param domanda;                # Quantità totale da produrre [ton]

# VARIABILI
var x {i in Materiali} >=0;   # Quantità utilizzate per ciascun materiale [ton]

# VINCOLI
# Vincoli sulla max quantità disponibile [ton]
subject to Max_quantity {i in Materiali2}:
  x[i] <= q[i];

# Vincoli sul totale peso dei materiali utilizzati [ton]
subject to Produzione_totale:
  sum {m in Materiali} x[m] = domanda;

# Vincoli sulla composizione percentuale
subject to Limiti_inf {j in Metalli}:
  sum {i in Materiali} a[j,i] * x[i] / domanda >= pmin[j];
subject to Limiti_sup {j in Metalli}:
  sum {i in Materiali} a[j,i] * x[i] / domanda <= pmax[j];

# OBIETTIVO
# Minimizzazione dei costi [€]
minimize z: sum {i in Materiali} c[i] * x[i];

#####
data;
#####

set Metalli := Silicio Magnesio Ferro Rame Manganese Zinco Cromo Titanio Alluminio Altri;
set Materiali := ALMC KAC Rottami Al Si Mg;
set Materiali2 := ALMC KAC Rottami;

param a:	  ALMC    KAC    Rottami   Al    Si    Mg  :=
Silicio       0.50    0.50     0.30     0    100     0 
Magnesio      0.75    0.70     0.50     0      0   100 
Ferro         0.20    0.20     0.35     0      0     0 
Rame          0.01    0.01     0.05     0      0     0 
Manganese     0.02    0.02     0.05     0      0     0 
Zinco         0.02    0.02     0.05     0      0     0 
Cromo         0.02    0.02     0.05     0      0     0 
Titanio       0.02    0.02     0.05     0      0     0 
Alluminio    97.0     97.0    90.0    100      0     0 
Altri         0.06     0.06    0.77     0      0     0;

param: 		pmin	pmax :=
Silicio     0.2    0.6
Magnesio    0.45   0.9
Ferro       0.0    0.35
Rame        0.0    0.1
Manganese   0.0    0.1
Zinco       0.0    0.1
Cromo       0.0    0.1
Titanio     0.0    0.1
Alluminio  96.9  100.0
Altri       0.0    0.15;

param     q :=
ALMC     0.50
KAC      1.20
Rottami  2.20;

param     c :=
ALMC     1230
KAC      1230
Rottami  1230
Al       2140
Si       1300
Mg       2442;

param domanda := 4.5;

end;
