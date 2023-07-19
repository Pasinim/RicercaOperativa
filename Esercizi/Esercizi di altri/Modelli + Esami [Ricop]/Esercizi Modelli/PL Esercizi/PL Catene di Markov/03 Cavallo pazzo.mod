# ESERCIZIO PL : Cavallo pazzo (Catene di Markov)

# INSIEMI E DATI
param nStati;                   # Numero di stati
set Stati := 1..nStati;         # Insieme degli stati
param freq {Stati,Stati};       # Frequenza 

# VARIABILI
var P {Stati} >=0;              # Probabilita' associate ai tre possibili stati (angolo, laterale, centrale)

# VINCOLI
# la frequenza media di ingresso e la frequenza media di uscita da ciascuno stato siano uguali
subject to Bilanciamento {i in Stati: i<nStati}:
  sum {j in Stati} freq[i,j] * P[i] = sum {j in Stati} freq[j,i] * P[j];

#la somma delle 3 probabilita' (angolo, laterale, centrale) deve essere pari a 1
subject to Normalizzazione:
  sum {i in Stati} P[i] = 1;

##############
data;

param nStati := 3; # Angolo, Laterale, Centrale

param freq:  1    2    3    :=
1			0.00 0.00 1.00 
2			0.00 0.67 0.33 
3			0.50 0.50 0.00;

end;
