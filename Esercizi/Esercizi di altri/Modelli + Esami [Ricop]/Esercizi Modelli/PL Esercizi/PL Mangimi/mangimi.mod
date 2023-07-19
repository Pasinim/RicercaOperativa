#ESERCZIO 10 - PL Mangimi

#DATI
param nM;                   # Numero di tipi di mangimi
set M := 1..nM;             # Insieme di mangimi
param nI;                   # Numero di ingredienti da mescolare
set I := 1..nI;             # Insieme di ingredienti
param nL;                   # Numero di linee di produzione
set L := 1..nL;             # Insieme di linee di produzione
param a {M, I};             # Percentuale di ogni ingrediente per ogni tipo di mangime (composizione dei mangimi)
param t {M, L};             # Tempi di produzione dei mangimi [minuti/quintale] 
param b {I};                # Ingredienti disponibili [quintali/giorno]
param c {M};                # Prezzi di vendita per ogni tipo di mangime [Klire/quintale]
param tmin {M};             # Inizio produzione [minuti]
param tmax {M};             # Fine produzione [minuti]

#VARIABILI
var x {M, L} >=0;                               # Produzione di ogni mangime su ogni linea [quintali/giorno]
var s {m in M,L} >=tmin[m], <=tmax[m];          # Inizio produzione di ogni mangime su ogni linea [minuti]
var e {m in M,L} >=tmin[m], <=tmax[m];          # Fine produzione di ogni mangime su ogni linea [minuti]

#VINCOLI
#Vincoli sul consumo massimo limitato di ingredienti [quintali/giorno]
subject to Consumi {i in I}:
   sum {m in M} (a[m,i]/100) * (sum {l in L} x[m,l]) <= b[i];

# Relazione tra inizio (start) e fine (end) produzione [minuti]
# t * x e' quanto dura la produzione
subject to Periodo {m in M, l in L}:
   s[m,l] + t[m,l] * x[m,l] = e[m,l];

#Vincoli sulla sequenza di produzione [minuti]
# Posso iniziare a produrre il mangime m solo una volta che ho finito di produrre il mangime precedente m-1 sulla stessa linea
subject to Sequenza {m in M, l in L: m>2}:
   s[m,l] >= e[m-1,l];


#OBIETTIVO
#Massimizzare i ricavi [Klire/giorno]
maximize z: sum {m in M} c[m] * (sum {l in L} x[m,l]);

##########################
data;

param nM := 5;
param nI := 4;
param nL := 3;

param a:        1    2    3    4 :=
1              30   20   20   30
2              40    5   10   45
3              40   35   10   15
4              50   20   20   10
5              50   30    5   15;

param t:         1      2      3 :=
1                5      4      2
2                8      5      2
3               10     10      2
4               10      5      5
5                3      5      5; 

param b:=
1       150
2       135
3        90
4        75;

param c:=
1       40
2       50
3       35
4       55 
5       30;

param:     tmin      tmax :=
1             0       120
2            30       180
3           120       270
4           225       300
5           255       360;

end;

=================================================

             SITUAZIONE ATTUALE

Attualmente la produzione avviene con lo scheduling seguente:

  Mangime (Quintali) 1      2      3      4      5
Linea
  1                 27      0     12      0     50
  2                 33.75  13      2.5    6     30
  3                 60      0     90      0     21

=================================================

                MUCCA PAZZA

In seguito al fenomeno della mucca pazza i nuovi prezzi dei mangimi sono i seguenti:

Mangime    Nome     Nuovo prezzo 
                  (Klire/quintale)
   1    Prionello        10
   2       BSE           10
   3    Buonfieno        55
   4     Erbetta         65
   5    Muccasana        40

