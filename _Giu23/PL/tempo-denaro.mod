param nM := 3;  # Numero di tipi di motocicli
param nC := 3;  # Numero di componenti principali

set M := 1..nM;  # Insieme dei tipi di motocicli
set C := 1..nC;  # Insieme dei componenti principali

param ricavo {M};  # Ricavi dalle vendite per ogni tipo di motociclo [KEuro/motociclo]
param tempo {M};   # Tempi di assemblaggio per ogni tipo di motociclo [giorni-uomo/motociclo]
param coeff {M, C};  # Coefficienti tecnologici per l'assemblaggio dei componenti [pezzi/motociclo]

param disponibilita {C};  # Disponibilità di materia prima per ogni componente [pezzi/mese]

var x {M} binary;  # Variabile di decisione: 1 se assemblaggio del motociclo i, 0 altrimenti
var giorni_uomo >= 0;  # Numero di giorni-uomo necessari all'assemblaggio

# Vincolo sulla disponibilità dei componenti
subj to disponibilita_componenti {c in C}:
    sum {m in M} coeff[m,c] * x[m] <= disponibilita[c];

# Vincolo sulla disponibilità dei componenti per ogni motociclo
subj to disponibilita_motocicli {m in M}:
    sum {c in C} coeff[m,c] * x[m] <= 1;

# Obiettivo: massimizzare i ricavi totali
maximize ricavi_totali: sum {m in M} ricavo[m] * x[m];

# Vincolo sulla minimizzazione dei giorni-uomo
subj to minimizzazione_giorni_uomo:
    giorni_uomo >= sum {m in M} tempo[m] * x[m];

solve;

# Stampa la soluzione ottimale
printf "Soluzione ottimale:\n";
printf "Motociclo\tAssemblaggio\n";
for {m in M} {
    printf "%d\t\t%d\n", m, x[m];
}
printf "Giorni-uomo necessari: %.2f\n", giorni_uomo;

