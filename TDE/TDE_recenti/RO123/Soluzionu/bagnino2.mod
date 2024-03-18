reset;
# DATI
param xA := -10;
param yA :=   0;
param xT :=  -6;
param yT :=   5;
param rT :=   3;
param xB :=  20;
param yB :=  17;
param vA :=  24*1000/3600; # km/h >> m/sec
param vB :=   6*1000/3600; # km/h >> m/sec

# Distanza percorsa fino alle tartarughe
param dAT1 = sqrt((xA-xT)^2 + (yA-yT)^2 - rT^2);

# VARIABILI
# Punti di discontinuità della traiettoria
var yH ; #:= (yA+yB)/2;
# Angoli tra punti di tangenza
var tau1 >=3.14/2, <=3.14;
var tau2 >=0, <=3.14;
# Distanze tra punti di discontinuità
var dT2H >=0;

# OBIETTIVO
minimize z: (dAT1 + (tau1-tau2)*rT + dT2H)/vA
            + sqrt(xB^2 + (yB-yH)^2)/vB;

# VINCOLI
# Angolo di arrivo alle tartarughe (tau1)
subject to AscissaT1:
xA + dAT1 * sin(tau1) = xT + rT * cos(tau1);
subject to OrdinataT1:
yA - dAT1 * cos(tau1) = yT + rT * sin(tau1);

# Angolo di partenza dalle tartarughe (tau2)
subject to AscissaT2:
   - dT2H * sin(tau2) = xT + rT * cos(tau2);
subject to OrdinataT2:
yH + dT2H * cos(tau2) = yT + rT * sin(tau2);

end;
