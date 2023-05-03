# SETS
set ore := 0..23;
set contratti := 1..4;

# DATI
param fabbisogno {ore};
param durata {contratti};
param costo {contratti};
param K := 8;

# VARIABILI
var x {contratti,ore} integer, >=0;

# OBIETTIVO
minimize Costo_totale:
  sum {c in contratti, o in ore} costo[c] * x[c,o];
  
# VINCOLI
subject to Copertura {o in ore}:
  sum {c in contratti, h in ore: ((h<=o) and (h>=o-durata[c]+1)) or (h>=o-durata[c]+25)} x[c,h] >= fabbisogno[o];

subject to LimiteK {c in contratti}:
  sum {o in ore} x[c,o] <= K;

data;
param fabbisogno :=
     0                    8
     1                    8
     2                    8
     3                    7
     4                    6
     5                    6
     6                    8
     7                    9
     8                   14
     9                   16
    10                   10
    11                    9
    12                    9
    13                    8
    14                    7
    15                   10
    16                   12
    17                   17
    18                   16
    19                   14
    20                   10
    21                    8
    22                    7
    23                    7
;
 param : durata costo :=
    1         24      500
    2         12      350
    3          8      250
    4          6      200
;

end;
