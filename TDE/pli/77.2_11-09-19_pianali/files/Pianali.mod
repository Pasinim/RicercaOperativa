# INSIEMI
set Auto := 1..16;
set Camion := 1..3;
set Veicoli := {'Motrice','Rimorchio'};
set Pianali := {'Inferiore','Superiore'};
set Posizione := Veicoli cross Pianali;

# DATI
param l {Auto};
param b {Auto};
param Lungh {Posizione};
param MaxEst {Posizione};
param S := 1.5;

# VARIABILI
var x {Auto,Camion,Veicoli,Pianali} binary;
var y {Camion} binary;
var e {Camion,Veicoli,Pianali} >=0;

# OBIETTIVO
minimize z:
  sum {c in Camion} y[c];
  
# VINCOLI
subject to Assegnamento {a in Auto}:
  sum {c in Camion, v in Veicoli, p in Pianali} x[a,c,v,p] = 1;

subject to Relazione_x_y {a in Auto, c in Camion, v in Veicoli, p in Pianali}:
  x[a,c,v,p] <= y[c];
  
subject to Capacity {c in Camion, v in Veicoli, p in Pianali}:
  sum {a in Auto} l[a]*x[a,c,v,p] <= Lungh[v,p] + e[c,v,p];

subject to Massima_estensione_singola {c in Camion, v in Veicoli, p in Pianali}:
  e[c,v,p] <= MaxEst[v,p];
  
subject to Massima_estensione_totale {c in Camion}:
  e[c,'Motrice','Inferiore'] + e[c,'Rimorchio','Inferiore'] <= S;
  
subject to Assegnamenti_proibiti {a in Auto, c in Camion, v in Veicoli}:
  x[a,c,v,'Inferiore'] <= 1-b[a];

##########
data;

param: l   b :=
 1    3.3  0
 2    3.8  1
 3    3.8  1
 4    3.4  0
 5    4.0  0
 6    3.8  0
 7    3.8  0
 8    3.9  0
 9    4.0  0
10    4.0  0
11    3.5  0
12    3.6  1
13    3.7  1
14    3.5  0
15    4.0  0
16    3.5  0
;

param:                   Lungh  MaxEst :=
'Motrice','Inferiore'     7.0    1.0
'Motrice','Superiore'     7.1    0.0
'Rimorchio','Inferiore'   7.0    1.0
'Rimorchio','Superiore'   7.2    0.0
;

end;
