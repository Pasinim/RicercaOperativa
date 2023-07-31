# Esercizio Patate

#  Dati

set Prodotti;                                    # Insieme dei prodotti
set Fornitori;                                   # Insieme dei fornitori
param resa {Fornitori,Prodotti};                 # Resa[%]
param limite {Prodotti};                         # Limite alla produzione[ton]          
param rendimento {Fornitori};                    # Rendimento[€cent/Kg]            

# Variabili

var acquisti {Fornitori} >= 0;    # Quantità acquistate[ton]

# Vincoli

# Vincolo sulla massima produzione per ogni prodotti [ton]
subject to Max_prod{j in Prodotti}:
 sum {i in Fornitori} acquisti[i] * resa[i,j]/100 <= limite[j];

# Obiettivo

# Massimizzare il profitto complessivo[€]
maximize profitto: sum {i in Fornitori} rendimento[i] * acquisti[i]*10; # *1000 per convertire in tonnellate /100 per convertire in euro = *10.

##################
data;

param resa : A B C :=
F1 20 20 30
F2 30 10 30;

set Prodotti := A B C;
set Fornitori := F1 F2;
param limite :=
A 6 
B 4
C 8;

param rendimento :=
F1 2
F2 3;

end;
