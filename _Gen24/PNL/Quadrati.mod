param nQ;
set Q :=1..nQ;
param h;
param b;
param lato{Q}; #lato dei quadrati

#Tra tutti i modi possibili di impaccare i quadrati
#si preferisce quello che minimizza la somma dei quadrati delle distanze Euclidee dal centro di ogni
#quadrato al centro del rettangolo
var xx{Q} >= 0;
var yy{Q} >= 0;
var zz{Q} >= 0;
var z >=0;
minimize distanzaEuclidea: z;

s.t. vincoloRettangolo{q in Q}:
    xx[q] >= lato[q]/2;
s.t. vincoloRettangolo2{q in Q}:
	xx[q] <= b - lato[q]/2;
    
s.t. vincoloAltezza{q in Q}:
    yy[q] >= lato[q]/2;
s.t. vincoloAltezza2{q in Q}:
	yy[q] <= h - lato[q]/2;

# Definizione della distanza Euclidea al quadrato
s.t. def_Z{q in Q}:
    z >= (xx[q] - b/2)^2 + (yy[q] - h/2)^2;


data;
param h:=30;
param b := 20;
param nQ := 5;
param lato := 
    1      4
    2      6
    3      7
    4      3
    5      9;
end;


 