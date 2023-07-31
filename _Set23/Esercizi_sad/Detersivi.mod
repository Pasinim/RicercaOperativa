# Esercizio Detersivi

# E' conviente produrre il primo ed il terzo tipo
# Aumentando il prezzo di 0.53 diventa conviente il secondo tipo
# Acqua e vetriolo sono scarse e polvere è invece in eccedenza.
# I vincoli di minimi sono attivi all'ottimo.
# A me conviene usare 150litri per i cosmetici.

# DATI

param nP;           # Numero prodotti
set P := 1..nP;     # Insieme dei prodotti
param nS;           # Numero delle sostanze
set S := 1..nS;     # Insieme delle sostanze
param mini{P,S};    # Valori minimi percentuali di composizione dei prodotti
param maxi{P,S};    # Valori massimi percentuali di composizione dei prodotti
param qnt{S};       # Quantità massime disponibili [litri/giorno]
param prz{P};       # Prezzi dei prodotti [€/litro]

# VARIABILI

var det{P} >= 0;         # Quantità prodotta per ogni detersivo [litro]  
var sos{S} >= 0;         # Sostanze acquistate [litro]
var pol >= 0;

# VINCOLI

s.t. quantitaSostanzeMinime{i in S}:
      sos[i] >= sum{j in P} det[j]*mini[j,i]/100;
s.t. quantitaSostanzeMassime{i in S}:
      sos[i] <= sum{j in P} det[j]*maxi[j,i]/100;
s.t. sostanzeDisponibli{i in S}:
      sos[i] <= qnt[i]; 
s.t. polvereDisponibile:
   sos[3]+pol <= qnt[3];
s.t. polvere:
   pol = 101;
# OBIETTIVO

maximize z: sum{i in P} det[i]*prz[i] + pol*10;

######################

data;

param nP := 3;
param nS := 3;


param mini: 1     2     3  :=
1          80     5    10    
2          70    10     5    
3          65    20    15;

param maxi: 1     2     3  := 
1          90    10    20
2          85    20    15
3          70    50    35;



param qnt := 
1 700
2 150
3 200;


param prz :=
1     2.5
2     2.0
3     3.0;

end;
