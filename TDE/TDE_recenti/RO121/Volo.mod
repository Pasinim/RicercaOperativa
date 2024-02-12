param nS;  # Numero degli stati da sorvolare
param nC;  # Numero di confini
set S := 1..nS;  # Insieme degli stati
set C := 1..nC;  # Insieme dei confini
param costo{S};  # Costi di sorvolo
param xp;  # Ascissa dell'aeroporto di partenza
param yp;  # Ordinata dell'aeroporto di partenza
param xa;  # Ascissa dell'aeroporto di arrivo
param ya;  # Ordinata dell'aeroporto di arrivo
param x_confini{C, 2};
param y_confini{C, 2};
# Variabili

var x{S};
var y{S};
var d >= 0; #Variabile ausiliaria che indica la distanza totale percorsa dall'aereo

# Funzione obiettivo: minimizza il costo totale
#minimize z: d;


data;
param nS := 3;  
param nC := 2;  
param costo :=
1 1.5
2 0.8
3 1.4;

param x_confini : 1 2 :=
1 1 22
2 10 30
;

param y_confini : 1 2 :=
1 9 24
2 0 20
;

end;


