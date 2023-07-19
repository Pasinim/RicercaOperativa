# Esercizio Fornitura

# Insiemi e dati
param nP;                           # Numero di prodotti
set Prodotti := 1..nP;              # Insieme di prodotti
param nT;                           # Numero di turni
set Turni := 0..nT-1;               # Insieme di turni (numerati da 0 per facilitare operazioni modulo nT)
param nMatPr;                       # Numero di ingredienti
set MatPr := 1..nMatPr;             # Insieme di ingredienti

param costo_prod {Prodotti,Turni};  # Costo di produzione [€/Kg]
param costo_mag {Prodotti};         # Costo di stoccaggio giornaliero [€/Kg]
param forn_min;                     # Fornitura minima [Kg]
param tr_min {Turni};               # Minima quantità totale da trasportare dopo ogni turno [Kg]
param tr_max {Turni};               # Massima quantità totale da trasportare dopo ogni turno [Kg]
param composizione {MatPr,Prodotti};# Composizione dei prodotti [frazione tra 0 e 1]
param vol {MatPr};                  # Volume degli ingrediennti [dm3/Kg]
param capacity;                     # Capacità del magazzino ingredienti [dm3]

# Variabili
var x {Prodotti,Turni} >=0; # Produzione per ogni prodotto ed ogni turno [Kg]
var y {Prodotti,Turni} >=0; # Quantità trasportata al centro commerciale per ogni prodotto e turno [Kg]
var s {Prodotti,Turni} >=0; # Stock a magazzino per ogni prodotto al termine di ogni turno [Kg]
var q {MatPr} >=0;          # Quantità consumata in ogni giorno per ogni ingrediente [Kg]

# Vincoli
s.t. Flow_conservation {p in Prodotti, t in Turni}:
  s[p,(t-1+nT) mod nT] + x[p,t] = s[p,t] + y[p,t];
#s.t. Flow_conservation1 {p in Prodotti}:
#  s[p,nTurni] + x[p,1] = s[p,1] + y[p,1];

s.t. Fornitura_minima:
  sum {p in Prodotti, t in Turni} y[p,t] >= forn_min;

s.t. Trasp_min {t in Turni}:
  sum {p in Prodotti} y[p,t] >= tr_min[t];
s.t. Trasp_max {t in Turni}:
  sum {p in Prodotti} y[p,t] <= tr_max[t];

s.t. Consumo {m in MatPr}:
  q[m] = sum {p in Prodotti, t in Turni} x[p,t] * composizione[m,p];

s.t. Capacity_constraint:
  sum {m in MatPr} vol[m] * q[m] <= capacity;

# Obiettivo
minimize z: sum {p in Prodotti, t in Turni} costo_prod[p,t] * x[p,t] + 
            sum {p in Prodotti, t in Turni} costo_mag[p] * s[p,t];

####################
data;

param nP     := 2;
param nT     := 3;
param nMatPr := 3;

param costo_prod : 	0		1		2 :=
1					12		8		10
2					15		11.5	12;

param costo_mag :=
1	1.8
2	0.4;

param composizione :	1	2 :=
1						0.2	0.5
2						0.6	0.1
3						0.2	0.4;

param vol :=
1	20
2	35
3	15;

param capacity := 7100;

param forn_min := 300;

param: tr_min tr_max :=
0		65		135
1		70		135
2		50		135;

end;

# I vincoli attivi e i prezzi-ombra corrispondenti sono:
# Fornitura_minima      16.7176 
# Trasp_min[0]             0.4 
# Trasp_max[1]           -1.8 
# Capacity_constraint  -0.247059 
