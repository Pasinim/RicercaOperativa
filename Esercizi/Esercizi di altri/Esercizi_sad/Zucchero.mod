# Esercizio Zucchero

# DATI

param nL;			        # Numero lotti
set L := 1..nL;		        # Insieme lotti
param v{L};			        # Velocità di deterioramento dei lotti [Kg/h]
param s{L};			        # Scadenza dei lotti [h]
param TL;			        # Tempo lavorazione [h]
param nLI;                  # Numero linee di produzione
param nT :=  ceil(nL/nLI);  # Numero turni
set T := 1..nT;             # Insieme dei turni

# VARIABILI

var p{T,L} >= 0 <= 1;        # Assegnamento dei lotti ai turni

# VINCOLI

s.t. assegnaAiTurni{i in T}:
     sum{j in L} p[i,j] <= 3;

s.t. assegnaAiLotti{i in L}:
     sum{j in T} p[j,i] = 1;

s.t. nonScadere{i in L}:
     sum{j in T} p[j,i]*(j*TL) <= s[i]; 

# OBIETTIVO

minimize z: sum{j in T, i in L} p[j,i]*(j*TL)*v[i] ;

data;

param nL := 11;
param nLI := 3;
param TL := 2;

param: v s := 
  1           43           8
  2           26           8
  3           37           2
  4           28           8
  5           13           4
  6           54           8
  7           62           8
  8           49           8
  9           19           8
 10           28           8
 11           30           8;

end;
