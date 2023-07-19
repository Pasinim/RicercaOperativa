# ESERCIZIO PL: Consumo degli elettrodomestici (Interpolazione)

# DATI
param nG;                   # Numero di giorni
param nED;                  # Numero di elettrodomestici
set G := 1..nG;             # Insieme dei giorni
set E := 1..nED;            # Insieme degli elettrodomestici
param consumo {G};          # Consumo misurati in ogni giorno [KWh]
param tempo {G, E};         # Durata accensione di ogni elettrodomestico in ogni giorno [h]

# VARIABILI
var x {E} >= 0;             # Potenza assorbita [KW]
var err {G};                # Errore sul contatore in ogni giorno [KWh]
var delta;                  # delta

# VINCOLI
# Definizione dell'errore [KWh]
subject to Errore {g in G}:
    err[g] = consumo[g] - sum {e in E} x[e] * tempo[g,e];

#OBIETTIVO
# 1. minimizzare max errore in valore assoluto
minimize z1: delta;
subject to minmax1posivito {g in G}: delta >= err[g];
subject to minmax1negativo {g in G}: delta >= -err[g];



end;
