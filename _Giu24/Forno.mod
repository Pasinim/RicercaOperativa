set P;
param t{P};
param s{P};
param prezzo{P};
param pMin{P}; #Produzione minima giornaliera
param sTot := 4;
param tTot := 6;
param cg := 12; #costo orario del garzone

var x{P} >= 0; #quantità minima da produrre
var tg >= 0; #Tempo extra del garzone

s.t. produzioneMinima {p in P}:
        x[p] >= pMin[p];
s.t. spazioTotale:
        sum {p in P} s[p] * x[p] *t[p] <= sTot * (tTot + tg);
s.t. produzioneDoppia {i in P, j in P: i<>j}:
        x[i] <= 2*x[j];

maximize guadagno:
        sum {p in P} x[p] * prezzo[p] - (cg * tg);

data;
set P := Pane Biscotti Focacce Paste;
param t :=
Pane      1
Biscotti    3
Focacce    1.5
Paste      2
;
param s :=
Pane      1
Biscotti   0.2
Focacce    1.5
Paste     1.5
;
param pMin :=
Pane        5
Biscotti      2
Focacce       3
Paste        2
;
param prezzo :=
Pane     2.50
Biscotti   4.00
Focacce    2.00
Paste     5.50
;
end;

