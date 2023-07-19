# Esercizio Unit Commitment

# INSIEMI
param nT;           # Numero impianti termoelettrici
param nH;           # Numero impianti idroelettrici
param nG;           # Numero di giorni da pianificare
set T := 1..nT;     # Insieme impianti termoelettrici
set H := 1..nH;     # Insieme impianti idroelettrici
set G :=1..nG;      # Insieme dei giorni da pianificare

# DATI
param pmin {T};     # Potenza minima [u.e/g]
param pmax {T};     # Potenza massima [u.e./g]
param cfix {T};     # Costo fisso [u.d/g]
param cvar {T};     # Costo variabile [u.d/u.e]
param cap  {H};     # Capacità bacini idroelettrici [u.v.]
param liv0 {H};     # Livello iniziale bacini idroelettrici [u.v.]
param alim {H};     # Portata alimentazione bacini idroelettrici [u.v./g]
param alfa;         # Coefficiente di conversione [u.e/u.v]
param d {G};        # Domanda prevista [u.e.]

# VARIABILI
var y {T,G} binary;                 # Stato di ogni impianto termoelettrico in ogni giorno
var x {T,G} >= 0;                   # Produzione in ogni impianto termoelettrico in ogni giorno [u.e.]
var z {H,G} >= 0;                   # Volume d'acqua in uscita da ogni impianto idroelettrico in ogni giorno [u.v.]
var liv {i in H,G} >= 0, <=cap[i];  # Livello di ogni impianto idroelettrico alla fine di ogni giorno [u.v.]

#OBIETTIVO
minimize costo_totale: sum {t in T, g in G} (cfix[t] * y[t,g] + cvar[t] * x[t,g]);

# VINCOLI
# Produzione max e min in ogni impianto termoelettrico in ogni giorno [u.e.]
subject to Prod_min {t in T, g in G}: x[t,g] >= pmin[t] * y[t,g];
subject to Prod_max {t in T, g in G}: x[t,g] <= pmax[t] * y[t,g];

# Vincoli di conservazione del flusso negli impianti idroelettrici in ogni giorno successivo al primo [u.v.]
subject to Flow_conserv  {i in H, g in G: g>1}: liv [i,g-1] + alim[i] = z[i,g] + liv[i,g];
# Vincoli di conservazione del flusso negli impianti idroelettrici nel primo giorno [u.v.]
subject to Flow_conserv0 {i in H}:              liv0[i]     + alim[i] = z[i,1] + liv[i,1];

# Vincolo sul soddisfacimento della domanda in ogni giorno [u.e.]
subject to Demand {g in G}:
  sum {t in T} x[t,g] + sum {i in H} alfa * z[i,g] = d[g];

###############################
data;

param nT := 3;
param nH := 3;
param nG := 7;

param: pmin pmax cfix cvar:= 
1       10   90   60    2
2       20  100   50    3
3       20   20   40    5
;

param:  cap  liv0  alim :=
1       600   500   200
2      2000  1500   400
3       300   100   100
;

param alfa := 0.05;

param d :=
1 200
2 180
3 150
4 200
5 250
6 250
7 180
;

end;
