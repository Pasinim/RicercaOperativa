# Esercizio Elettrodomestici

# L'elettrodomestico più conveniente da vendere è il primo, quello meno conveniente è il terzo.
# L'aumento deve essere di 30 euro.
# La risorsa scarsa è il tempo disponibile.
# Sono disposto a pagare al massimo 3000 euro il nuovo lavoratore.

# DATI

param nE;				# Numero elettrodomestici
set E := 1..nE;			# Insieme degli elettrodomestici
param pE{E};			# Prezzo di vendita degli elettrodomestici [€/pezzo]
param vE{E};			# Volume occupato dagli elettrodomestici [litri/pezzo]
param cap;				# Capacità totale del veicolo [litri]
param tiE{E};			# Tempo ispezione elettrodomestici [min/pezzo]
param nT;				# Numero tecnici
param tD;				# Tempo disponibile per ispezione per ogni tecnico
param gS;				# Numero giorni lavorativi nella settimana
param minProp{E};		# Minima percentuale da acquistare (in pezzi) per ogni elettrodomestico rispetto al totale acquistato
param maxProp{E};		# Massima percentuale da acquistare (in pezzi) per ogni elettrodomestico rispetto al totale acquistato

# VARIABILI

var cE{E} >= 0;				# Numero pezzi di elettrodomestici comprati per tipo

# VINCOLI

# Il volume occupato dagli elettrodomestici acquistati non deve superare la capacità
# massima del furgone. Il vincolo è espresso in litri.
s.t. volumeOccupato:
	sum{i in E} vE[i]*cE[i] <= cap;

# Non ha senso comprare elettrodomestici che non posso ispezionare.
# [minuti]
s.t. tempoIspezione:
	sum{i in E} tiE[i]*cE[i] <= 60*nT*tD*gS;


s.t. proporzioniMinime{i in E}:
	 minProp[i] * sum{j in E} cE[j]/100 <= cE[i];
	 
s.t. proporzioniMassime{i in E}:
	 cE[i] <= maxProp[i] * sum{j in E} cE[j]/100;

# OBIETTIVO

maximize z: sum{i in E} cE[i]* pE[i];

#################

data;

param nE := 3;
param cap := 7200;
param nT := 4;
param tD := 1;
param gS := 5;

param: pE vE tiE  minProp  maxProp:=
1   130	  40  10	  10      50
2    50   75   5      5       40
3    20   12   5	  30      50;

end;
