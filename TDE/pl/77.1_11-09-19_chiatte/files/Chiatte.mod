# INSIEMI
set Canali    := 1..2;
set Direzioni := {'salita','discesa'};

# DATI
param l_strett {Canali};
param v_corr   {Canali};
param v_a := 10;   # km/h
param q := 1500;   # ton

# VARIABILI
var flusso {Canali,Direzioni} >=0;

# OBIETTIVO
maximize z:
  sum {c in Canali} flusso[c,'salita'] * q;

# VINCOLI
subject to Conservazione_flusso:
  sum {c in Canali} flusso[c,'salita'] = sum {c in Canali} flusso[c,'discesa'];

subject to Strettoie {c in Canali}:
  flusso[c,'salita']*l_strett[c]/(v_a-v_corr[c]) + flusso[c,'discesa']*l_strett[c]/(v_a+v_corr[c]) <= 1;

data;

param:   l_strett   v_corr :=
#                 [km]           [km/h]
  1        0.5        2
  2        0.75       1
;

end;
