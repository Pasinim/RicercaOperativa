# DATI
set Stati := 1..4;
param f {Stati,Stati};

# VARIABILI
var P {Stati} >=0;   # Probabilità di essere in ciascuno stato

# VINCOLI
subject to Bilanciamento {s in Stati}:
  P[s] = sum {t in Stati} f[t,s] * P[t];

subject to Normalizzazione:
  sum {s in Stati} P[s] = 1;

####
data;
####

param f:	1		2		3		4 :=
1			0.00	0.40	0.00	0.60
2			0.20	0.00	0.80	0.00
3			0.00	0.50	0.00	0.50
4			0.75	0.00	0.25	0.00;

end;
