# esercizio sull'interpolazione

# DATI 
param nG; # numero di giorni
param nED;# numero di elettrodomestrici
set G := 1..nG; # insieme dei giorni
set E := 1..nED;# insieme degli elettrodomestici
param consumo{G}; # consumi in ogni giorni [KWh]
param tempo{G,E};  # durata accensione di ogni elettrodomestico in ogni g.[h]

# VARIABILI
var x {E} >= 0; # potenza assorbita [KW]
var e {G};      # errore sul contatore in ogni giorno [KWh]
var delta{G};   

# VINCOLI
# definizione dell'errore [KWh]
subject to Errore {g in G}:
e[g] = consumo[g] - sum {j in E} x[j] * tempo[g,j];


# OBIETTIVO
# 1. minimizzare il massimo errore in valore assoluto
# minimize z1 : delta;
# subject to minmax1pos {g in G}: delta >= e[g];
# subject to minmax1neg {g in G}: delta >= -e[g];

# 2. minimizzare il valore assoluto del valore medio degli errori
#minimize z2: delta;
#subject to modulopos: delta >= sum{g in G} e[g]/nG;
#subject to moduloneg: delta >= - sum{g in G} e[g]/nG;

# 3. minimizzare il valor medio dei valori assoluti degli errori
#minimize z3: sum {g in G}  delta[g]/nG;
#subject to val_ass_pos {g in G}: delta[g] >= e[g];
#subject to val_ass_neg {g in G}: delta[g] >= -e[g];

# 4. minimizzare errore quadratico medio
minimize z4: sum{g in G} e[g]*e[g]/nG;


data;

param nG := 12;
param nED := 8;

param tempo:  1   2   3   4   5   6   7   8    :=
        1     0.2 0.4 0.5 0.6 0.6 0.5 0.2 0.2
        2     0.1 1.0 0.1 1.2 1.1 1.0 0.6 0.3
        3     0.1 0.5 0.5 0.7 0.5 0.5 0.1 0.2
        4     0.2 0.6 0.6 0.8 0.6 0.6 0.2 0.3
        5     0.1 0.4 0.2 0.3 0.2 0.2 0.0 0.2
        6     0.2 0.5 0.4 0.7 0.5 0.4 0.2 0.3
        7     0.3 0.4 0.5 0.8 0.4 0.4 0.2 0.2
        8     0.6 0.8 1.0 1.5 1.3 0.6 0.5 0.6
        9     0.3 0.4 0.5 0.7 0.5 0.5 0.3 0.2
        10    0.5 0.9 1.1 1.3 0.9 1.2 0.8 0.5
        11    0.0 0.2 0.0 0.0 0.1 0.0 0.0 0.1
        12    0.0 0.5 0.2 0.3 0.2 0.1 0.1 0.3;


param consumo :=
1     10
2     20
3     10
4     15
5      5
6     10
7     10
8     20
9     12
10    25
11     2
12     5;


end;
