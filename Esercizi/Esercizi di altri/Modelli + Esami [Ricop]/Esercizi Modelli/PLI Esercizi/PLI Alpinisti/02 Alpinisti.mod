#ESERCIZIO PLI Alpinisti

# INSIEMI
param N_Alpinisti := 20;
set Alpinisti := 1..N_Alpinisti;
param N_Squadre := 4;
set Squadre := 1..N_Squadre;
param N_Skills := 3;
set Skills := 1..N_Skills;

# DATI
param Componenti := 4;
param Value {Alpinisti, Skills};
param Risk {Alpinisti};
param Target {Skills};

# VARIABILI
var x {Alpinisti, Squadre} binary;          #Assegnamento degli alpinisti alle squadre

# VINCOLI
# Il numero di assegnamenti di ciascun alpinista deve essere non superiore ad 1
subject to Assegnamento {a in Alpinisti}: 
  sum {s in Squadre} x[a,s] <= 1;

# Ogni squadra deve avere esattamente 4 componenti
subject to N_Comp {s in Squadre}:
  sum {a in Alpinisti} x[a,s] = Componenti;

#Livello minimo di skill in ogni squadra
subject to Total_skill {s in Squadre, k in Skills}:
  sum {a in Alpinisti} Value[a,k] * x[a,s] >= Target[k];

# OBIETTIVO
#minimizzare la somma degli indici di rischio individuali
minimize Total_risk: sum {a in Alpinisti, s in Squadre} Risk[a] * x[a,s];

##########################3
data;

param Value:  1  2  3 :=
 1            3  2  5
 2            3  2  5
 3            4  5  4
 4            4  5  5
 5            2  4  4
 6            1  4  4
 7            2  5  3
 8            5  5  3
 9            4  5  4
10            5  3  5
11            3  2  5
12            3  5  4
13            4  5  5
14            4  5  4
15            5  4  2
16            5  4  2
17            5  4  3
18            3  1  4
19            4  3  5
20            5  5  4;

param Risk:=
 1 0.21
 2 0.15
 3 0.12
 4 0.11
 5 0.12
 6 0.14
 7 0.08
 8 0.10
 9 0.05
10 0.19
11 0.13
12 0.01
13 0.07
14 0.15
15 0.18
16 0.16
17 0.09
18 0.08
19 0.02
20 0.10;

param Target:=
 1 16
 2 16
 3 16;

end;
