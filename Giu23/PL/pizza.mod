set MODELLI := A B C;
set REPARTI := motori carrozzeria A B C;


maximize profitto: sum{m in MODELLI} profitti[m] * sum{r in REPARTI} produzione[r,m];
subject to capacita_reparto {r in REPARTI}: sum{m in MODELLI} tempi[r,m] * produzione[r,m] <= capacita[r];
subject to capacita_totale {m in MODELLI}: sum{r in REPARTI} tempi[r,m] * produzione[r,m] <= 168;

data;
param capacita{REPARTI} :=
motori 120
carrozzeria 80
A 96
B 102
C 40;
param tempi{REPARTI,MODELLI} :=
A B C :=
motori 3 2 1
carrozzeria 1 2 3
A 2 0 0
B 0 3 0
C 0 0 2;
param profitti{MODELLI} := 840 1120 1200;
var produzione{REPARTI,MODELLI} >= 0;
end;


