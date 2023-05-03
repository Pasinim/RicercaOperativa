# Esercizio n.9: Posologia

# Dati

param nH;                   # Nr. fasce orarie;
set H := 1..nH;             # Fasce orarie
param maxY;                 # Livello massimo di proteina Y [mg/cc]
param minY {H};             # Livello minimo di proteina Y [mg/cc]
set F;                      # Insieme dei farmaci
set H2 := 0..11;            # Ore trscorse dopo assunzione farmaco [h]
param E {H2,F};             # Tasso di proteina Y prodotto dopo tot ore [mg/cc]
param costi {F};            # Costi dei farmaci [€/g]

# Variabili

var x {H, F} >= 0;                      # Quantità di farmaci assunti durante il giorno [g]
var y {h in H} >= minY[h], <= maxY;     # Quantità di proteina Y nelle fasce orarie [mg/cc]

# Vincoli

# Calcolo y
subject to YinH {h in H}:
     y[h] = 
          sum {h2 in H, f in F, h3 in H2: (h2 = h-h3) or (h2 = h-h3+nH)} 
               x[h2,f]*E[h3,f];

# Obiettivo

# Richiesta 1: minimizzare sostanze
#minimize MinSostanza:
#       sum {h in H, f in F} x[h,f];

# Richiesta 2: minimizzare costo
minimize MinCosto:
     sum {h in H, f in F} x[h,f]*costi[f];

##################

data;

param nH := 24;
param maxY := 45;
param minY :=
     1   5.0 
     2   1.0
     3   0.0
     4   0.0
     5   0.0
     6   0.0
     7   4.0
     8  15.0
     9  12.0
     10   5.0
     11   4.0
     12   3.0
     13  25.0
     14  30.0
     15  25.0
     16  15.0
     17   5.0
     18   4.0
     19   3.0
     20  25.0
     21  30.0
     22  25.0
     23  20.0
     24  10.0;
set F := Prismil Cilindren;
param E :
          Prismil  Cilindren :=
     0	 	1.5 	2.5
     1	 	3.0 	4.0
     2	 	4.0 	5.5
     3	 	2.5 	4.0
     4	 	1.9 	3.0
     5	 	1.4 	1.5
     6	 	1.0 	0.7
     7	 	0.7 	0.4
     8	 	0.5 	0.2
     9	 	0.3 	0.0
     10	 	0.2 	0.0
     11	 	0.1 	0.0;
param costi :=
     Prismil    0.7
     Cilindren  0.95;

end;
