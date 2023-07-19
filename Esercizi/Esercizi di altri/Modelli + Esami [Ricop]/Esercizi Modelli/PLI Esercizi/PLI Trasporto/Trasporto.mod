#ESERCIZIO PLI - Trasporto

#DATI
param nReparti;             # Numero dei reparti produttivi (destinazioni)
set R := 1..nReparti;       # Insieme dei reparti produttivi
param nMagazzini;           # Numero dei magazzini (sorgenti)
set M := 1..nMagazzini;     # Insieme dei magazzini
param d {R};                # Quantità di materiali richiesta [q]
param o {M};                # Quantità di materiali immagazzinati [q]
param costo {R,M};          # Costi di trasporto per unità di merce da ogni magazzino ad ogni reparto-produzione [Euro/q]

#VARIABILI
var x {M,R} >= 0;           # Quantità trasportate settimanalmente da ogni sorgente (magazzino) ad ogni destinazione (reparto-produzione) [q]

#VINCOLI

#il totale flusso di prodotti uscenti da ogni magazzino non superi la capacità del magazzino [q]
subject to Offerta {m in M}:
  sum {r in R} x[m,r] <= o[m];

#il totale flusso entrante in ogni destinazione sia almeno pari al fabbisogno del reparto [q]
subject to Domanda {r in R}:
  sum {m in M} x[m,r] >= d[r];

#OBIETTIVO
#minimizzare i costi complessivi [Euro]
minimize z: sum {m in M, r in R} x[m,r] * costo [r,m];

################
data;

param nReparti := 8;
param nMagazzini := 4;

param d :=
1               30
2               40
3               20
4               35
5               40
6               30
7               25
8               50;

param o :=
1	70
2	70
3	50
4	80;

param costo:     1   2   3   4    :=
1               20  25  30  28
2               15  12  32  26
3               18  41  36  37
4               32  23  35  20
5               31  40  19  38
6               33  22  34  21
7               25  29  26  27
8               30  24  39  28;

end;
