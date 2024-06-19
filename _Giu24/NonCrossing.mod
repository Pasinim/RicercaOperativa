set S := 1..6;  # Sensori
set A := 1..6;  # Attuatori

param util {S, A};  # Utilità dei dati trasmissibili per ogni coppia sensore-attuatore

# Variabile di decisione x[i,j]: 1 se il sensore i è assegnato all'attuatore j, 0 altrimenti
var x {S, A} binary;

# Funzione obiettivo: massimizzare l'utilità totale
maximize TotalUtility:
    sum {i in S, j in A} util[i,j] * x[i,j];

# Vincolo 1: Ogni sensore può essere assegnato a un solo attuatore
s.t. OneActuatorPerSensor {i in S}:
    sum {j in A} x[i,j] <= 1;

# Vincolo 2: Ogni attuatore può essere assegnato a un solo sensore
s.t. OneSensorPerActuator {j in A}:
    sum {i in S} x[i,j] <= 1;

# Vincolo 3: Non-crossing matching
s.t. NonCrossing {i1 in S, j1 in A, i2 in S, j2 in A: i1 < i2 and j1 > j2}:
    x[i1,j1] + x[i2,j2] <= 1;

# Dati
data;

param util: 
    1   2   3   4   5   6 :=
1   1   10  15  47  68  130
2   9   4   7   18  40  98
3   15  10  5   10  23  82
4   45  18  9   8   14  50
5   67  50  31  24  13  29
6   131 100 82  50  26  14;

end;
