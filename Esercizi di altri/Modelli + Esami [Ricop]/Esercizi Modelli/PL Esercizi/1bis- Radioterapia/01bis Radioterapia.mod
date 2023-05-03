# ESERCIZIO PL Radioterapia

#DATA
set posizioni:= 1..5;        # Insieme delle posizioni
set organi:= 1..7;           # Insieme degli organi
param a {organi,posizioni};  # Frazione assorbita dagli organi adiacenti
param t {posizioni};         # Frazione assorbita dal tumore
param limite {organi};       # Limite massimo assorbimento consentito per ogni organo
param intens {posizioni};    # Limite massimo radiazione erogabile da ogni posizione
param u := 600;              # Limite massimo complessivo per le radiazioni

#VARIABILI
# Decidere la quantità di radiazione da erogare da ogni posizione
var x {posizioni} >= 0;      # Intensità radiazione da ciascuna posizione

#VINCOLI

# La radiazione complessiva sia non superiore a 600
subject to Limite_max_totale:
  sum {p in posizioni} x[p] <= u;

# La radiazione erogata da ogni posizione p non sia superiore al limite massimo
subject to Limite_max_posizione {p in posizioni}:
  x[p] <= intens[p];

# La radiazione assorbita da ogni organo o non sia superiore al limite massimo
subject to Radiazione_organi {o in organi}:
  sum {p in posizioni} a[o,p] * x[p] <= limite[o];

#OBIETTIVO
maximize Radiazione_tumore:
  sum {p in posizioni} t[p] * x[p];

#####################
data;

param a:    1     2     3     4     5 :=
1           0.1   0.0   0.0   0.1   0.2
2           0.1   0.0   0.15  0.0   0.1
3           0.0   0.1   0.0   0.0   0.0
4           0.0   0.2   0.1   0.1   0.0
5           0.1   0.0   0.2   0.0   0.1
6           0.1   0.3   0.15  0.1   0.1
7           0.2   0.1   0.15  0.0   0.0;

param t := 
1  0.40
2  0.30
3  0.25
4  0.70
5  0.50;

param limite :=
1     55
2     90
3     60
4     24
5     70
6     55
7     95;

param intens :=
1        120
2        130
3        100
4        150
5        150;

end;
