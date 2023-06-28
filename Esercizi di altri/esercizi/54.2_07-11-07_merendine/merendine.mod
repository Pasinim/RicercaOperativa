
# DATI 
set P;
set I;
param c{P};
param p{I,P};
param b{I};

# VARIABILI

var x{P};

# VINCOLI

subject to produzione_minima {i in P}:
    sum {j in I} x[i]*p[j,i] >= sum{a in P}sum{t in I} x[a]*p[t,a] / 10;

subject to disponibilita {j in I}:
    sum {i in P} x[i]*p[j,i] <=  b[j];



# OBIETTIVO
maximize z: sum{i in P} x[i]*c[ i];

#############################
data;

set P := merendine, brioches, biscotti, biscotti_speciali, tortine;
set I := pasta, zucchero, marmellata, cioccolato , acqua;


param c:=

merendine      8
brioches       6
biscotti      12
biscotti_speciali    14
tortine       10;


param p :  merendine brioches biscotti biscotti_speciali tortine :=
pasta            20      40      70      25                 20
zucchero         25      15      10      20                30 
marmellata       40      30       0      10                 10  
cioccolato       10       0      15      40                   30  
acqua             5      15       5       5                  10;


param b :=

pasta      9999999
zucchero   300
marmellata 320
cioccolato 240
acqua      9999999;

end;
