# Esercizio: Gironi eliminatori

# INSIEMI
set team   := 1..24;
set gruppo := 1..6;

# DATI
param x {team};
param y {team};
param n := 4;        # Numero di squadre per ogni gruppo
param d {i in team, j in team} := ((x[i]-x[j])^2+(y[i]-y[j])^2)^0.5;

# VARIABILI
var z {team, gruppo} binary;
var w {team, team} >= 0;

# OBIETTIVO
minimize dist_tot: sum {i in team, j in team} d[i,j]*w[i,j];

# VINCOLI
subject to assegnamento {i in team}:
  sum {g in gruppo} z[i,g] = 1;
subject to composizione {g in gruppo}:
  sum {i in team} z[i,g] = n;

subject to stessogruppo {g in gruppo, i in team, j in team}:
  w[i,j] >= z[i,g]+z[j,g]-1;

######
data;
######

param: x  y :=
  1   13  90
  2   18  98
  3   40  30
  4   50  14
  5   85  82
  6   33  38
  7   48  87
  8   47  47
  9   14  44
 10    9  11
 11    3  79
 12   83   6
 13   79  53
 14   51  24
 15   63  92
 16   95  51
 17   28  60
 18   51   3
 19   80  65
 20   72  12
 21    2  29
 22   59  75
 23   26  26
 24   23   1
;

end;
