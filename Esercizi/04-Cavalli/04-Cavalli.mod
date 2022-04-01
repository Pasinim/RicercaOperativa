set cavalli;
param budget; #Budget disponibile
param quota{cavalli};

#
var puntata{cavalli} >= 0; 
var y >= 0; #vincita minima

#
subject to limBudget:
    sum {c in cavalli} puntata[c] <= budget;
#è necessario introdurre una varaibile ausiliaria con il significato di  "minimo di"
subject to Linearizzazione {c in cavalli}:
    y <= quota[c]*puntata[c];


#Ob: massimizzare la vincita nel caso peggiore
maximize z: y;

data;
set cavalli := FULMINE FRECCIA DARDO LAMPO;
param budget := 57.00;
param quota :=
FULMINE 3
FRECCIA 4
DARDO   5
LAMPO   6
;

end;