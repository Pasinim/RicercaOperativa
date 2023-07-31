# Esercizio Azioni

# DATI

param nA;					# Numero Azioni
set A := 1..nA;				# Insieme delle azioni
param pA{A};				# Prezzo di acquisto delle azioni [€/azione]
param nS;					# Numero scenari
set S := 1..nS;				# Insieme degli scenari
param rS{A,S};				# Rendimenti percentuali attesi per ogni scenario
param budget;				# Budget disponibile [€]

# VARIABILI

var azioni{A} >= 0;				# Numero di azioni per ogni azione.
var scenarioDueS;

# VINCOLI

s.t. totale:
	sum{i in A} azioni[i] * pA[i] <= budget;


s.t. eterogeneita{i in A}:
	sum{j in A: j <> i} azioni[j] >= azioni[i];

s.t. scenarioDue:
	sum{i in A}( azioni[i] * rS[i,2]/100 + azioni[i])*pA[i] - budget = scenarioDueS;

#s.t. boh:
#	scenarioDueS >= -2181;

# OBIETTIVO

maximize z : sum{i in A} (azioni[i] * rS[i,1]/100 + azioni[i] )* pA[i] - budget;

#######################

data;

param nA := 3;
param pA :=
1 50
2 75
3 90;
param nS := 2;
param rS: 1		 2 :=
1		  5		 1
2		  8		 0
3		 12		-5;

param budget := 80000;

end;
