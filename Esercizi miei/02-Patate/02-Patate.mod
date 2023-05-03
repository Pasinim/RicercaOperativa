

#DATI
set nF := 1..2; #fornitori
set nP := 1..3; #tipi di patata
param f {nF}; #vettore fornitori
param p {nP}; #vettore patata
param profitto {nF}; #[euro/kg]
param b {nP}; #limite di produzione per ciascun tipo di patata [kg]
param a {nP, nF}; #matrice contenente le rese
#Variabili
var acquisto {nF} >= 0; #quantita da acquistare da ogni fornitore [kg]

#Vincoli
subject to limAcq {i in nP}: #q.ta acquistata * matrice < limite produzione per ogni tipo
#per verificare se sto superando il limite (di un tipo di patata) devo sommare la produzione per ogni fornitore
        sum {j in nF}  acquisto[j]*a[i,j] <= b[i];
        

#obiettivo
maximize Profitto:
        sum {i in nF} acquisto[i] * profitto[i];


data;
param a: 1   2 :=
1        .2 .3
2        .2 .1
3        .3 .3
;

param profitto:= 1 0.02 2 0.03;
param b:=
1   6000
2   4000
3   8000
;

end;

