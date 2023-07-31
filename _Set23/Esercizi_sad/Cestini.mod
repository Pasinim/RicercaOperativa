# Esercizio Cestini

# DATI

param nF;       # Numero fonti di pattume
param nL;       # Numero luoghi in cui localizzare il pattume
param nC;       # Numero cestini
set F := 1..nF; # Insieme delle fonti di pattume
set L := 1..nL; # Insieme dei luoghi in cui localizzare il pattume
set C := 1..nC; # Insieme dei cestini
param T{L,F};   # Tempo raggiungimento dei cestini [s]
param P{F};     # Quantità di pattume prodotto ogni giorno [kg]
param CAP;      # Capacità cestini

# VARIABILI

var pos{C,L} binary;      # 1 Se il cestino è localizzato in quel luogo  ASSEGNAMENTO
var qnt{F,C} >= 0;        # Quantitò di spazzatura da ogni fonti ad un cestino [kg]   FLOW
var massimoTempo;         # Massimo tempo di conferimento del pattume [s]
var fc{C,F} binary;       # 1 Se il cestino riceve spazzatura dalla fonte, 0 altrimenti.
var qLF{F,L} >= 0;		  # Quantità spazzatura da una fonte ad un luogo
var tMedio >= 0;

# VINCOLI

s.t. unLuogoPerCestino1{i in C}:
     sum{j in L} pos[i,j] >= 1;

s.t. cestinoPieno{i in C}:
     sum{j in F} qnt[j,i] <= CAP;

s.t. assegnamentoFC{ i in C, j in F}:
     fc[i,j]*CAP >= qnt[j,i];

s.t. buttaQuantita{j in F}:
     sum{i in C} qnt[j,i] =  P[j];

s.t. tempoConferimentoPattume{i in C, j in L, k in F}:
     massimoTempo >= pos[i,j]*T[j,k] - (1-fc[i,k])*T[j,k];

s.t. fonteALuogo{i in F}: 
	 P[i] = sum{j in L} qLF[i,j];

s.t. tempoMedio:
	tMedio >= (sum{i in L, j in F} qLF[j,i]*T[i,j]) / sum{j in F} P[j]; 

# OBIETTIVO

minimize z: tMedio;

data;

param nF := 5;
param nL := 6;
param nC := 4;

param T: 1 2 3 4 5 :=
	1	    4 20 20 35 40
	2      20  5 10 20 20 
	3      20  5  8 20 20
	4      20  8  5 25 25
	5      40 15 12 10 12
	6      40 15 20  8  2;
     
param P :=
1 12
2  8
3  8
4 15
5 12;

param CAP := 20;

end;
