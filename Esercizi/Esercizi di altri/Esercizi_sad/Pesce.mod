# Esercizio Pesce

# Il vincolo "nonSuperaCella" è stringente.

# DATI

param nP;			# Numero prodotti
set P := 1..nP;		# Insieme prodotti
param prezzo{P};	# Prezzo dei prodotti [€/kg]
param volume{P};	# Volume dei prodotti [cc/kg]
param CAP;			# Capacità delle celle [cc]
param T{P};			# Tempo preparazione e confezionamento [min/kg]
param TD;			# Tempo disponibile per il confezionamento [min]
param LI{P};		# Limiti acquisto giornaliero [kg/giorno]

# VARIABILI

var Q{P} >= 0;		# Kg di pesce trasportati

# VINCOLI

s.t. nonSuperaCella:
	sum{i in P} Q[i]*volume[i] <= CAP;

s.t. tempoPreparazione:
	sum{i in P} T[i]*Q[i] <= TD;

s.t. massimo:
	sum{i in P} (Q[i]/LI[i]) <= 1;


# OBIETTIVO

maximize z: sum{j in P} prezzo[j]*Q[j];

#####################

data;

param nP := 3;

param prezzo :=
1       10.00
2        7.50
3       20.00;

param volume :=
1       10000
2        7500
3       12500;

param CAP := 50000;

param TD := 45;

param T :=
1        11
2         8
3        10;


param LI :=
1            40
2            60
3            60;

end;
