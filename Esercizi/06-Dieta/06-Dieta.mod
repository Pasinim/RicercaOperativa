
set alimenti := 1..7;
set sostanze := 1..3;
param c {alimenti}; #costo alimenti [e/kg]
param s {sostanze, alimenti}; #quantit? sostanze nutritive [g/kg]
param inf {sostanze}; #limite inferiore[g/gg]
param sup {sostanze}; #limite superiore[g/gg]

#VARIABILI
var x {alimenti} >= 0; #g/gg di alimento
var y {sostanze} >= 0; #g/gg di sostanze
#VINCOLI
subject to limInf {i in sostanze}:
    x[i] >= inf[i];
subject to limSup {i in sostanze}:
    x[i] <= sup[i];

#definisco y
subject to val_y{i in sostanze}:
    sum {j in alimenti} x[j] * s[i, j] / 1000 = y[i];


#OBIETTIVO
#minimizzare il costo
minimize costo {i in alimenti}:
    x[i] * c[i] / 1000;
    

data;

param s:    1       2       3   4       5    6      7 :=
1           11.5    3.15    8   18.5    2.1  12     9
2           72.7    4.85    3.8 0.5     0    68     74
3           1.5     1.55    11  19      0.1  6      1
;

param: inf sup := 
1       25  35
2       15  25
3       10  20
;

param c := 
1   4
2   4
3   15
4 22.5
5   3
6   1
7   5
;



end;

