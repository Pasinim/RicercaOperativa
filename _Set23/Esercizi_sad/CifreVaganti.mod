# Esercizio Cifre Vaganti

# ESERCIZIO DEL TIPO AMMISSIBILITà

# DATI

param nC;                       # Numero cifre
set cifre := 1..nC;             # Insieme delle cifre
set numeri := 1..9;             # Insieme dei numeri
set somma within numeri;        # Insieme dei numeri del numero somma
param q;

# VARIABILI

var n{cifre, numeri} binary;
var n1{cifre,numeri} binary;

# VINCOLI

# NON CI SONO NUMERI RIPETUTI. SONO TUTTI DIVERSI
s.t. unicita{i in numeri}:
     sum{j in cifre} n[j,i] <= 1;

# SCELGO UN SOLO NUMERO PER CIFRA
s.t. unicita2{i in cifre}:
     sum{j in numeri} n[i,j] = 1;

# TRADUZIONE DEL PRIMO NUMERO NEL SECONDO
s.t. unita{i in numeri}:
     n[2,i] = n1[4,i];
s.t. decine{i in numeri}:
     n[1,i] = n1[3,i];
s.t. centinaia{i in numeri}:
     n[3,i] = n1[2,i];
s.t. migliaia{i in numeri}:
     n[4,i] = n1[1,i];

# LA SOMMA DEVE ESSERE UGUALE A Q (8612)
s.t. sommaNumeri:
     sum{i in cifre} 10^(4-i) * sum{j in numeri} n[i,j]*j +
     sum{i in cifre} 10^(4-i) * sum{j in numeri} n1[i,j]*j  =  q;

# ESATTAMENTE 2 CIFRE SONO UGUALI.
s.t. dueCifre:
     sum{p in cifre, c in somma} n[p,c] = 2;

##################

data;

param q := 8612;
param nC := 4;
set somma := 8 6 1 2;

end;
