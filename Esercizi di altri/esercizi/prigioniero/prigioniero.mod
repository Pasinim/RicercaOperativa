# esercizio il prigioniero e la sentinella, catene di markov
# DATI
set Stati;            # insieme di stati
param f{Stati,Stati}; # frequenze di transizione

# VARIABILI
var P {Stati} >= 0;        # Probabilità di ogni stato

# VINCOLI
subject to Normalizzazione:
    sum {i in Stati} P[i] = 1;

subject to Bilanciamento {j in Stati}:
    sum {i in Stati} f[i,j]*P[i] = sum {k in Stati} f[j,k]*P[j];


##########################
data;

set Stati := N E S W;

param f: N    E   S   W :=
N        0    .4  0   .6
E        .2   0   .8  0
S        0    .5  0   .5
W        .75  0   .25 0;



end;

