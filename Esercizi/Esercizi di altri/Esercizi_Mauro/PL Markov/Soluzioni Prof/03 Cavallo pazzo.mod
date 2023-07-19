# INSIEMI E DATI
param nStati;
set Stati := 1..nStati;
param freq {Stati,Stati};

# VARIABILI
var P {Stati} >=0;

# VINCOLI
subject to Bilanciamento {i in Stati: i<nStati}:
  sum {j in Stati} freq[i,j] * P[i] = sum {j in Stati} freq[j,i] * P[j];

subject to Normalizzazione:
  sum {i in Stati} P[i] = 1;

##############
data;

param nStati := 3; # Centro Laterale Angolo

param freq:  1    2    3    :=
1			0.00 0.50 0.50 
2			0.33 0.67 0.00 
3			1.00 0.00 0.00 
;

end;
