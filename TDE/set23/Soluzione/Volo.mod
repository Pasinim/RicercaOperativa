# Esercizio Volo internazionale

# DATI
param n;					# Numero di confini da attraversare
set R := 0..n;				# Insieme di regioni da sorvolare
set C := 1..n;				# Insieme di confini da attraversare
param price {R};			# Costo unitario per ogni stato
param nS {C};				# Numero segmenti per ogni confine
set P {c in C} := 0..nS[c];	# Insieme dei punti per ogni confine
param xx {c in C, P[c]};	# Ascissa punti di discontinuità
param yy {c in C, P[c]};	# Ordinata punti di discontinuità
param xx0;					# Ascissa aeroporto partenza
param yy0;					# Ordinata aeroporto partenza
param xxN;					# Ascissa aeroporto arrivo
param yyN;					# Ordinata aeroporto arrivo

# VARIABILI
var x {C};					# Ascissa punto di attraversamento di ogni confine
var y {C};					# Ordinata punto di attraversamento di ogni confine
var d {R} >=0;				# Distanza percorsa sopra ogni stato
var w {c in C,P[c]} binary;	# Selezione del segmento attraversato per ogni confine
var lambda {C} >=0, <=1;	# Coefficiente combinazione convessa per ogni confine

# Ogni punto (x[c],y[c]) di attraversamento del confine c è combinazione convessa degli estremi di uno dei segmenti dati.
# Il confine di ingresso ha lo stesso indice dello stato in cui entra

# VINCOLI
# Un segmento attraversato per ogni confine
s.t. Segmento {c in C}:
  sum {p in P[c]: p>0} w[c,p] = 1;
  
# Combinazione convessa degli estremi del segmento attraversato
s.t. Ascissa {c in C}:
  x[c] = lambda[c] * sum {p in P[c]: p>0} w[c,p] * xx[c,p-1] + 
         (1-lambda[c]) * sum {p in P[c]: p>0} w[c,p] * xx[c,p];
s.t. Ordinata {c in C}:
  y[c] = lambda[c] * sum {p in P[c]: p>0} w[c,p] * yy[c,p-1] + 
         (1-lambda[c]) * sum {p in P[c]: p>0} w[c,p] * yy[c,p];

# Distanza percorsa nello stato iniziale
s.t. Dist0: 
  d[0]^2 = (xx0-x[1])^2 + (yy0-y[1])^2;
# Distanza percorsa nello stato finale
s.t. DistN: 
  d[n]^2 = (xxN-x[n])^2 + (yyN-y[n])^2;
# Distanza percorsa negli stati intermedi
s.t. Dist {r in R: r>0 and r<n}:
  d[r]^2 = (x[r]-x[r+1])^2 + (y[r]-y[r+1])^2;

# OBIETTIVO
minimize z: sum {r in R} price[r] * d[r];

###############################
data;

param xx0 :=  5;
param yy0 := 20;
param xxN := 25;
param yyN :=  8;

param n := 2;

param nS :=
1	4
2	1;

param xx:=
[1,0]  0
[1,1]  8
[1,2] 15
[1,3] 17
[1,4] 17
[2,0] 10
[2,1] 30;

param yy:=
[1,0] 14
[1,1] 14
[1,2] 19
[1,3] 23
[1,4] 30
[2,0]  0
[2,1] 20;

param price :=
0	1.5
1	0.8
2	1.4;

end;
