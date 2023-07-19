# ESERCIZIO 89.1 PLI - Porta valori

#DATI
param nF;               # Numero di furgoni
set F := 1..nF;         # Insieme di furgoni
param cap {F};          # Capacità di ogni furgone [Kg]
param costoF {F};       # Costo orario di ogni furgone [€/h]
param nG;               # Numero di guardie
set G := 1..nG;         # Insieme di guardie
param vel {G};          # Velocità nel caricare i valori sui furgoni [Kg/h]
param costoG {G};       # Costo orario di ogni guardia [€/h]
param Q;                #Quantità di valori da trasportare [Kg]
param t;                # Tempo fisso per gli spostamenti

#VARIABILI
#decidere quali furgoni e quali guardie utilizzare
var y {F} binary;
var x {G} binary;
var tempof {F};         # Tempo impiegato dai furgoni per le operazioni di caricamento
var tempog {G};         # Tempo impiegato dalle guardie per le operazioni di caricamento
var time;               # Tempo complessivo impiegato dalle guardie e dai furgoni impiegati
var MaxTime := 3500;    # valore "abbastanza grande"

#VINCOLI

#tempof[f] e tempog[g] devono essere uguali a time per tutti i furgoni e le guardie impiegate
# tempof[f] e tempog[g] devono essere invece 0 per gli altri
subject to vincolo_TimeF {f in F}:
   tempof[f] >= time - MaxTime;

subject to vincolo_TimeG {g in G}:
   tempog[g] >= time - MaxTime;

#OBIETTIVO


#################
data;

param nF := 3;

param:  cap     costoF  :=
1       1000    19.00
2       1500    22.00
3       4000    27.00;

param nG := 3;

param:  vel     costoG  :=
1       600     18.00
2       700     19.50
3       500     17.00;

#param t := 2 ore e 30 minuti;

param Q := 3500;

end;
