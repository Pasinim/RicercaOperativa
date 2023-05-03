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

param nStati := 5; # 00 10 20 11 21 

param freq:  1    2    3    4    5 :=
1			0.00 16.0 0.00 0.00 0.00
2			9.00 0.00 4.00 12.0 0.00
3			0.00 18.0 0.00 0.00 12.0
4			0.00 9.00 0.00 0.00 4.00
5			0.00 0.00 0.00 18.0 0.00
;

end;
