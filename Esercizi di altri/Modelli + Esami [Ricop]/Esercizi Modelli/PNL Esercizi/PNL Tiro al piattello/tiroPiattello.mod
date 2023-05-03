# ESERCIZIO - PNL Tiro al piattello 

#DATI
param g;
param alfa;
param beta;
param tmin;

#VARIABILI
var v0 >=0;
var tmax >=0;

#VINCOLI
subject to Parabola: g * tmax^2/2 + v0 * tmax = 1/alfa;

#OBIETTIVO
minimize z: v0;

################
data;
param g := -9.81;
param alfa := 0.05;
param beta := 0.80;
param tmin := 0.5;

end;
