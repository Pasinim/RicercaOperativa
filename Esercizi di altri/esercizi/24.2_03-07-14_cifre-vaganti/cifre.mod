# DATI
param N;
set Posizioni := 0..N-1; # Ogni posizione p pesa 10^p
set Cifre := 1..9;
set Speciale within Cifre; # set di cifre speciali
param s;    # somma fatta dalle cifre speciali
param k;

# VARIABILI
var x1 {Posizioni,Cifre} binary; # assegnamento che desc
var x2 {Posizioni,Cifre} binary; # assegnamento

# VINCOLI
# la stessa cifra non puo' comparire piu' di una volta
subject to TutteDiverse {c in Cifre}:
    sum {p in Posizioni} x1[p,c] <= 1;

# una cifra per posizione

subject to Assign {p in Posizioni}:
    sum {c in Cifre} x1[p,c] = 1;


# Permutazione delle cifre
# migliaia 1 = decine 2
subject to Permuti {c in Cifre}: x1[3,c] = x2[1,c];

# Centinaia 1 = Unità 2
subject to Permuti2 {c in Cifre}: x1[2,c] = x2[0,c];

# decine 1 = centinaia 2
subject to Permuti3 {c in Cifre}: x1[1,c] = x2[2,c];

# unità 1 = migliaia 2
subject to Permuti4 {c in Cifre}: x1[0,c] = x2[3,c];

# Somma
subject to Somma:
    sum {p in Posizioni} 10^p * (sum {c in Cifre} x1[p,c]* c) +
    sum {p in Posizioni} 10^p * (sum {c in Cifre} x2[p,c]* c) = s;


# k cifre speciali
subject to speciali :
    sum {p in Posizioni, c in Speciale} x1[p,c] = k;



data;

param N := 4;
set Speciale := 1 2 6 8;
param s := 8612;
param k := 2;
end;
