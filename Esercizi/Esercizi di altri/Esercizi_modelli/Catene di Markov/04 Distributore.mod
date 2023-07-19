# INSIEMI E DATI
param nStati;
set Stati := 0..nStati-1;
param freq {Stati,Stati};

# VARIABILI
var P {Stati} >=0;

# VINCOLI
subject to Bilanciamento {i in Stati: i<nStati-1}:
  sum {j in Stati} freq[i,j] * P[i] = sum {j in Stati} freq[j,i] * P[j];

subject to Normalizzazione:
  sum {i in Stati} P[i] = 1;

##############
data;

param nStati := 4;

param freq:  0    1    2    3  :=
0			0.00 1.00 0.00 0.00
1			0.20 0.00 0.67 0.00 
2			0.00 0.40 0.00 0.33
3			0.00 0.00 0.60 0.00
;

end;
