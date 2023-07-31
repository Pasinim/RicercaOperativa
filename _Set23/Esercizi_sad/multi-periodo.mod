# Esercizio Pianificazione multi-periodo

# DATI
set Mesi;
param d {Mesi};             # Domanda [ton]
param q {Mesi};             # Capacità produttiva [ton]
param p {Mesi};             # Prezzo ingredienti[€/ton]
param h {Mesi};             # Costo unitario di immagazzinamento [€/ton]
param s0;                   # Scorta iniziale [ton]

# VARIABILI
var x {m in Mesi} >= 0, <= q[m];          # Produzione mensile [ton]
var s {m in Mesi} >= 0;

# VINCOLI
# Diventano condizioni di non negatività sull'avanzo
#subject to Domanda {m in Mesi}:
# sum {i in Mesi : i <= m} x[i] >= sum {i in Mesi : i <= m} d[i];

subject to Conservazione1:
   s0 + x[1] = d[1] + s[1];

subject to Conservazione { m in Mesi: m > 1}: 
   s[m-1] + x[m] = d[m] + s[m];

#subject to Avanzo {m in Mesi}:
#     s[m] = sum {i in Mesi : i <= m} (x[i] - d[i]);

# OBIETTIVO

minimize z: sum {m in Mesi} p[m] * x[m]
         +  sum {m in Mesi} h[m] * s[m];

############
data;
set Mesi := 1 2  3 4;
param: d  q    p     h:=
1  200  400  34    2000
2  300  500  36    3000
3  500  300  32    2000
4 400  500  38    3000;

param s0 := 0;

end;
