# Esercizio Downlink

# INSIEMI
set files := 1..12;
set stations := {"A", "B", "C", "D"};

# DATI
param priority {files};
param size {files};
param capacity {stations};
param compatibility {files, stations} binary;

# VARIABILI
var x {files, stations} binary;

# OBIETTIVO
maximize value: sum {f in files, s in stations} priority[f] * x[f,s];

# VINCOLI
subject to contr_assignment {f in files}:
  sum {s in stations} x[f,s] <= 1;

subject to constr_capacity {s in stations}:
  sum {f in files} size[f] * x[f,s] <= capacity[s];

subject to constr_compatibility {f in files, s in stations}:
  x[f,s] <= compatibility[f,s];

#######
data;
#######

param: priority   size :=
  1       2        3.8
  2       7        9.1
  3       3        4.6
  4       6        7.5
  5       7        6.6
  6       8        9.3
  7       7        9.0
  8       9        5.8
  9       2        5.0
 10       7        7.6
 11       6        6.4
 12       8        8.2
;

param capacity :=
  A     20.0
  B     18.0
  C    11.0
  D     23.5
;

param compatibility :
          A    B    C    D :=
 1        1    0    1    1
 2        1    0    0    1
 3        0    1    1    1
 4        0    1    1    1
 5        0    0    1    1
 6        1    1    0    0
 7        0    1    1    0
 8        0    1    1    0
 9        1    1    1    1
10        1    0    1    0
11        0    1    1    0
12        1    0    1    0
;

end;
