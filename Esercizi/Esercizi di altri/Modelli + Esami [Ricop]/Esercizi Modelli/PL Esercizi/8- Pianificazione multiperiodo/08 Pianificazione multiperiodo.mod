# ESERCIZIO PL Pianificazione multiperiodo

# DATI
set Mesi := 1..4;     # Insieme dei mesi (Giugno, Luglio, Agosto, Settembre)
param d {Mesi};       # Domanda di ogni mese [ton]
param q {Mesi};       # Capacità produttiva di ogni mese [ton]
param p {Mesi};       # Prezzi ingredienti [€/ton]
param h {Mesi};       # Costo stoccaggio [€/ton]
param s0;             # Stock iniziale [ton]

# VARIABILI
var x {m in Mesi} >=0, <=q[m];  # Produzione in ciascun mese [ton]
var s {Mesi} >=0;               # Scorte invendute a fine mese [ton]

# VINCOLI
# Vincoli di conservazione del flusso [ton]
subject to Flow_conservation {m in Mesi: m>1}:
  s[m-1] + x[m] = d[m] + s[m];

subject to Primo_periodo:
  s0 + x[1] = d[1] + s[1];

# OBIETTIVO
minimize z: sum {m in Mesi} (p[m]*x[m] + h[m]*s[m]);

#############################
data;

param:	d 		q		p		h	:= 
1		200		400		34		2000
2		300		500		36		3000
3		500		300		32		2000
4		400		500		38		3000;

param s0 := 0;

end;
