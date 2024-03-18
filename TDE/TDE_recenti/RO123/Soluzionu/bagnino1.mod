reset;
# DATI
param xA := -10;
param yA :=   0;
#param xT :=  -6;
#param yT :=   5;
#param rT :=   3;
param xB :=  20;
param yB :=  17;
param vA :=  24*1000/3600; # km/h >> m/sec
param vB :=   6*1000/3600; # km/h >> m/sec

# VARIABILI
# Punti di discontinuità della traiettoria
#var xT1;
#var yT1;
#var xT2;
#var yT2;
var yH := (yA+yB)/2;
# Angoli tra punti di tangenza
#var tau1;
#var tau2;
# Distanze tra punti di discontinuità
#var dAT1;
#var dT2H;
var dAH >=0;
var dHB >=0;

# OBIETTIVO
#minimize z: (dAT1 + (tau2-tau1)*rT + dT2H)/vA + 
#            (dHG1 + (gamma2-gamma1)*rG + dG2B)/vB;
minimize z: dAH/vA + dHB/vB;

# VINCOLI
# Definizione delle distanze
subject to DistanzaAH: dAH^2 = xA^2 + (yH-yA)^2;
subject to DistanzaHB: dHB^2 = xB^2 + (yB-yH)^2;

end;
