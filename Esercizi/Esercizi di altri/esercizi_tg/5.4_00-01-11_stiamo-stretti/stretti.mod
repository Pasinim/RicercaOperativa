# DATI

set M; # insieme delle materie prime
set P; # insieme dei prodotti che produce l'azienda
param Ns; # numero di settimane
set S := 1..Ns;
param k{M,S}; # Prezzo di acquisto per unità di materia prima, andando avanti con le settimane aumenta
param r{P}; # Minima quantità di prodotto vendibile al giorno
param a{P,M}; # composizione percentuale dei materiali nei prodotti
param vM{M}; # volume che occupa ogni materia prima
param vP{P}; # volume che occupa ogni materia prima
param Cap;

# VARIABILI
var MagazzinoProdotti {S,P} >= 0;					# Unita di prodotti in magazzino [unita]				# Unita di prodotti in magazzino [unita]
var Produzione {S, P} >= 0;							# Produzione [unita]
var MagazzinoMateriePrime {S, M} >= 0;			# Unita di materie in magazzino [unita]
var Acquisti {S, M} >= 0;						# Materie prime comprate [unita]
var Utilizzo {S, M} >= 0;						# Utilizzo di materie prime [unita]

# VINCOLI

#                # Vincolo del magazzino ogni settimana
#                subject to Capacity {i in S: (i>1)}:
#                    (sum {j in M} x[j,i-1]*vM[j] - sum{k in P} y[k,i-1]*vP[k]) + sum {m in M} x[m,i]*vM[m] <= Cap;
#
#
#
#                subject to Flow_conservation {i in S: (i>1)}:
#
#                #subject to conservation {i in S,j in M :(i>1)}:
#                #  sum {k in P} y[k,i]*a[k,j]/100 <= x[j,i] + x[j,i-1] - sum {o in P}y[o,i-1]*a[o,j]/100; 
#
#                #subject to conservation2 {j in M}:
#                #   sum {k in P} y[k,1]*a[k,j]/100 <= x[j,1] + y0;
#
#                #subject to ProduzioneMinimaSettimanale {i in S,j in P}:
#                #        y[j,i] >= r[j]*6; # x 6 perchè sono i giorni lavorativi, avendo a disposizione la produzione e l'acquisto settimanale
#
#                # OBIETTIVO
#                # Minimizzare il prezzo d'acquisto
#                minimize z: sum {i in S, j in M} x[j,i]*p[j,i];

# definizione utilizzo
subject to definizioneU1 {s in S,m in M}:
    Utilizzo[s,m] = sum {p in P} (Produzione[s,p]*a[p,m]/100);

# conservazione del flusso dei prodotti
subject to ConservazioneFlussoP1 {s in S, p in P: s>1}:
    MagazzinoProdotti[s-1,p] + Produzione[s,p] = MagazzinoProdotti[s,p] + r[p]*7;
subject to ConservazioneFlussoP2 {p in P}:
    Produzione[1,p] = MagazzinoProdotti[1,p] + r[p]*7;

# conservazione del flusso delle materie prime
subject to ConservazioneFlussoM1 {s in S,m in M: s>1}:
    MagazzinoMateriePrime[s-1,m] + Acquisti[s,m] = MagazzinoMateriePrime[s,m] + Utilizzo[s,m];
subject to ConservazioneFlussoM2 {m in M}:
    Acquisti[1,m] = MagazzinoMateriePrime[1,m] + Utilizzo[1,m];

# limite di utilizzo dei materiali
subject to UtilizzoDelleM1 {s in S,m in M: s>1}:
    Utilizzo[s,m] <= MagazzinoMateriePrime[s-1,m] + Acquisti[s,m] - MagazzinoMateriePrime[s,m];
subject to UtilizzoDelleM2 {m in M}:
    Utilizzo[1,m] <=  + Acquisti[1,m] - MagazzinoMateriePrime[1,m];

# capacità totale del magazzino
subject to capTot {s in S}:
    sum {p in P} (MagazzinoProdotti[s,p]*vP[p]) +
    sum {m in M} (MagazzinoMateriePrime[s,m]*vM[m])
    <= Cap;


# Obiettivo
minimize z: sum {s in S,m in M} Acquisti[s,m]*k[m,s];
   
 


data;

set M := A, B, C , D;
set P := X, Y, Z, W, K, Q;
param Ns := 4;


 param k :    1           2            3             4          :=
   A          18          24           30            41
   B          40          50           65            80
   C          23          27           34            44
   D          12          19           28            39;

param r :=
   X                         11
   Y                          4
   Z                         18
   W                          7
   K                          3
   Q                         12;



param a:            A   B   C   D  :=
   X                15  25  40  20
   Y                25  40  15  20
   Z                40  20  20  20
   W                25  25  25  25
   K                 5  50  40   5
   Q                50   5   5  40;


param vM :=
   A             120
   B             130
   C             200
   D             180;


param vP :=
   X          80
   Y          90
   Z         105
   W         120
   K         125
   Q         100;

param Cap := 60000;
end;

