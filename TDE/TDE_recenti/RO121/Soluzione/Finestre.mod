# Esercizio "Finestre temporali"

# DATI
param nP;						# Numero di punti da visitare (n. clienti + 1)
set P := 0..nP;					# Insieme dei punti da visitare, inclusi i depositi
param nF {P};					# N. finestre temporali per ogni punto
set F {p in P} := 1..nF[p];		# Insieme di finestre temporali per ogni punto
param s {p in P, F[p]};			# Istante di inizio di ogni finestra temporale
param e {p in P, F[p]};			# Istante di fine di ogni finestra temporale
param traveltime {p in P: p>0};	# Tempo di viaggio per raggiungere ogni punto dal precedente

# VARIABILI
var t {P};						# Istante di visita di ogni punto
var x {p in P, F[p]} binary;	# Selezione finestra temporale per ogni punto

# VINCOLI
# Tempi di visita coerenti con i tempi di viaggio
s.t. Tempi {p in P: p>0}:
  t[p] >= t[p-1] + traveltime[p];

# Bounds finestre temporali
s.t. Lower {p in P, f in F[p]}:
  s[p,f] * x[p,f] <= t[p];
s.t. Upper {p in P}:
  sum {f in F[p]} e[p,f] * x[p,f] >= t[p];

# Selezione finestra temporale
s.t. TW {p in P}:
  sum {f in F[p]} x[p,f] = 1;

# OBIETTIVO
# Minizzare la durata complessiva del viaggio
minimize durata: t[nP] - t[0];

######################
data;

param nP := 5;

param traveltime :=
1	48
2	80
3	72
4	88
5	52;

param nF :=
0	1
1	3
2	3
3	4
4	3
5	1;

param  s :=
[0,1]   0 
[1,1]  68 
[1,2] 148 
[1,3] 200 
[2,1] 200  
[2,2] 264 
[2,3] 320 
[3,1] 215 
[3,2] 264 
[3,3] 332 
[3,4] 412 
[4,1] 312 
[4,2] 400 
[4,3] 464 
[5,1] 460;

param  e :=
[0,1] 200
[1,1] 112
[1,2] 176
[1,3] 220
[2,1] 244 
[2,2] 276
[2,3] 344
[3,1] 235
[3,2] 296
[3,3] 368
[3,4] 420
[4,1] 344
[4,2] 416
[4,3] 504
[5,1] 560;

end;
