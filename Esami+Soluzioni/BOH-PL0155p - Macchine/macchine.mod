param nC := 5;
param nP := 4;
set C := 1..nC;
set P := 1..nP;
param prezzo{P};
param costo{C};
param lB{P};
param componenti{P, C};
param t {C};
param nO := 9; #operai totali
param tTot := 40*60; #minuti totali

# L’ufficio personale, incaricato di assumere nuovi operai, vuol sapere di quanto aumenterebbe il profitto dell’azienda per ogni operaio specializzato in più e fino a che limite massimo.
#L’ufficio vendite vuole sapere se preparare per l’anno prossimo contratti analoghi a quelli vigenti o se modificarli, aumentando o diminuendo il numero minimo di macchine da produrre per ogni tipo.
#L’ufficio acquisti vuole sapere qual è il massimo prezzo accettabile per il componente n.3.


data;
param prezzo :=
   1         2050
   2         3500
   3         2550
   4         1250
;

param costo :=
   1           30
   2           40
   3           35
   4           10
   5           15
;
param lB :=
   1        25
   2        15
   3        35
   4        30
;
   
param componenti: 1 	2 	3 	4 	5 :=
   1              3    2    2    0    3
   2              4    2    5    4    4
   3              1    3    3    3    2
   4              1    2    0    1    1
;
   
param t :=
   1             10
   2             15
   3             10
   4             20
   5             25
;



end;

