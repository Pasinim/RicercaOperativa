# Esercizio Incendi

# DATI

param nI;				# Numero incendi
set I := 1..nI;			# Insieme degli incendi
param a{I};				# Coefficiente a degli incendi
param b{I};				# Coefficiente b degli incendi
param ini{I};				# Istante di inizio degli incendi

# VARIABILI

# durata =  a + b*r

var x{I,I} binary;		# 1 se l'incendio precede l'altro incendio nello spegnimento
var s{I} >= 0;			    # Tempo in cui  l'incendio viene gestito
var e{I} >= 0;				# Tempo quando l'incendio è estinto
var massimo >= 0;

# VINCOLI

s.t. unoPrecedeLaltro{i in I,j in I : i <> j}:
	x[i,j] + x[j,i] = 1;

s.t. seUguali{i in I}:
	x[i,i] = 0;

s.t. fineIncendio{i in I}:
	e[i] = s[i] + a[i] + b[i]*s[i];

s.t. precedenzaIncendio{i in I, j in I: i <> j}:
	s[i] >= e[j] - 1000*x[i,j];

s.t. tempoInzio{i in I}:
	s[i] >= ini[i];

s.t. obiettivoMassimo{ i in I}:
	massimo >= e[i];

# OBIETTIVO

minimize z: massimo;

###################


data;

param nI := 5;

param: a b ini :=
1      5 0.1 0
2      8 0.3 0
3     10 0.2 2
4      9 0.5 0
5      3 0.4 4;

end;
