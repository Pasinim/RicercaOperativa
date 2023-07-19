# Esercizio Attrazione e repulsione

# DATI

param nA;
set A := 1..nA;
param nR;
set B := 1..nR;
param xA{A};
param yA{A};
param xB{B};
param yB{B};

# VARIABILI

var xP;
var yP,
var xPodd = 2*xP +1;
var yPodd = 2*yP +1;

# VINCOLI


# OBIETTIVO
minimize z: sum{i in A} sqrt((xPodd-xA[i])^2 +(yPodd - yA[i])^2)
			- 0.5*sum{i in B} sqrt((xPodd-xB[i])^2 +(yPodd - yB[i])^2);

####################

data;

param nA := 6;
param nB := 6;

param: xA yA :=
1	16 34
2	24 16
3	56	22
4	23	27
5	52	49
6	61  32;	

param: xB yB :=
1	25 41
2	14 21
3	46 58
4	29 42
5	30 18
6	24 37;

end;
