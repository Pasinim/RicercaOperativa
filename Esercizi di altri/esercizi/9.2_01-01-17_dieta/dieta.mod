
# DATI 

set A; # insieme degli elementi
set S; # insieme sostanze nutritive
set V; # insieme elementi nutritivi

param a{S,A}; # Quantita di sostanza nutritive
param v{A,V}; # Quantita di elementi nutritivi rispetto al fabbisogno giornaliero
param l{S};   # Lower bound delle sostanze nutritive
param u{S};   # Upper bound delle sostanze nutritive
param c{A};   # Costo degli alimenti

# VARIABILI                                                                                                                                                                                                                                        
var x{A} >= 0; 
var y {S} >= 0; # Variabie ausiliaria per calcolare i [g/gg] di sostanze nutritive degli alimenti

# VINCOLI

subject to val_y {j in S}:
	sum {i in A} x[i] * a[j,i]  = y[j];


subject to uB {j in S}:
		sum {i in S} y[i] <= u[j];
	
subject to lB {j in S}:
		sum {i in S} y[i] >= l[j];

subject to lB2 {j in S}:
		sum {i in S} y[i] >= l[j];


# OBIETTIVO

minimize z : sum{i in A} x[i]*c[i];


######################################

data;
set A := Pasta Latte Formaggio_fresco Formaggio_stagionato Pesce Patate Spinaci Pane Polenta;
set S := Proteine Carboidrati Grassi;
set V := Calcio Fosforo; 


param a :        Pasta Latte Formaggio_fresco Formaggio_stagionato Pesce Patate Spinaci Pane Polenta :=
Proteine         11.5  3.15  8                33                   18.5  2.1    2.4     12.0 9
Carboidrati      72.7  4.85  3.8              0                    0.5   0      0.6     68   74
Grassi           1.5   1.55  11               28.4                 19    0.1    0.5     6    1;

param v :   Pasta   Latte    Formaggio_fresco   Formaggio_stagionato  Pesce  Patate  Spinaci  Pane   Polenta :=
Calcio      0       15       52.5               139                   0     1.25     0        0      0
Fosforo     0       0        28                 85                    20    6.05     0        0      0;

param l :=
Proteine            25                  
Carboidrati         15                  
Grassi              10;

param u :=
Proteine            35 
Carboidrati         25 
Grassi              20;


param c :=
Pasta                  2000  
Latte                  2200  
Formaggio_fresco    16000
Formaggio_stagionato   29000 
Pesce  22500
Patate  3500 
Spinaci  5000 
Pane   7000 
Polenta 10000;

end;
