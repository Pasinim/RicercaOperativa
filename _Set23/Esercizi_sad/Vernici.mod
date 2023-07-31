# Esercizio Resine e vernici

# DATI

param nP;           # Numero prodotti
set P := 1..nP;     # Insieme dei prodotti
param nS;           # Numero sostanze
set S := 1..nS;     # Insieme delle sostanze
param pV{P};        # Prezzi di vendita di prodotti [€/kg]
param qS{P,S};      # Quantità di sostanza da usare per ogni kg di prodotto [kg]
param cap{S};       # Quantità di sostanze disponibili [kg]
param minP{P};      # Quantità minima da produrre [kg]
param maxP{P};      # Quantità massima da produrre [kg]

# VARIABILI

var qP{P} >= 0;     # Quantità prodotte [kg]          

# VINCOLI

s.t. minimaProduzione{i in P}:
        qP[i] >= minP[i]*1000;

s.t. massimaProduzione{i in P}:
        qP[i] <= maxP[i]*1000;

s.t. sostanzaNecessaria{i in S}:
        sum{j in P} qP[j]*qS[j,i] <= cap[i];

# OBIETTIVO

maximize z: sum{i in P} qP[i] * pV[i]/1000;

###################

data;

param nP := 5;
param nS := 3;

param : minP, maxP :=
   1        10       36
   2        15       40
   3        16       45
   4        15       32
   5        14       40;

param cap :=
1   4000000
2   3500000
3   3200000;

param qS : 1 2 3 :=
   1         50          20          35 
   2         45          28          42 
   3         46          42          37 
   4         24          31          29 
   5         55          25          42 ;

param pV :=
1      300 
2      250
3      600
4      280
5      510;

end;
