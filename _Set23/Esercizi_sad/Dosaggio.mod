# Esercizio Dosaggio

# DATI

param nF;
param nV;
set f := 1..nF;					# Insieme dei farmaci
set v := 1..nV;					# Insieme dei valori
param qMF{f};					# Quantità massima somministrabile per farmaco [mg]
param vA{v};					# Valori attuali dei valori
param sm{v};					# Soglia minima dei valori
param vI{v};					# Valore ideale
param sM{v};					# Soglia massima dei valori
param e{v,f};					# Effetto dei farmaci sui valori

# VARIABILI

var x{i in f} >= 0 <= qMF[i];					# mg di farmaci somministriati per farmaco.
var vC{i in v} >= sm[i] <= sM[i];				# Valori correnti dei valori.
var w;

# VINCOLI

s.t. valoreFinale{i in v}:
	sum {j in f}  e[i,j]*x[j] + vA[i] = vC[i];

s.t. scostamentoVMassimo{i in v}:
	(vC[i] - vI[i])/(sM[i] - vI[i]) <= w;

s.t. scostamentoVMinimo{i in v}:
	(vI[i] - vC[i])/(vI[i] - sm[i]) <= w;

s.t. analisi: 
	x[3] = 0.454;

# OBIETTIVO

minimize z : w;

##################

data;

param e: 1      2      3      4      5 :=
1       -0.2   +0.5   +0.7   +0.1   +0.2
2     -500    0.0   -250    +50    0.0
3       +0.2   -0.1   +0.3    0.0   +0.2
4      -80   -120    +15    -90   -100
5       -8.5   -7.0   -1.0   -3.0   +1.0
6       +5     -2     +8     -4      0
7       -5     -1     -2     -3     +4;


param nF := 5;
param nV := 7;
param qMF :=
1	2.0
2	3.5
3	0.5
4	0.5
5	7.5;


param:     vA		 sm        vI          sM :=
1           3.45      7.0      12.0        15.0
2        1800      1700      2500        3500
3           0.05      0.50      0.80        1.30
4        3200      1400      2000        2750
5          26.4       8.0      10.0        12.0     
6          35        28        35          41
7         136        80       120         160;

end;
