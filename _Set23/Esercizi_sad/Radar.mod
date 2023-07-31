# Esercizio Radar

# Il problema di minimizzare il massimo errore in valore assoluto è un problema di 
# min-max, in questo caso non lineare dovuto ai vincoli sulla distanza retta-punto
# e ai vincoli di normalizzazione sulla retta. La soluzione che viene trovata è ottima
# e vale 0.216. La funzione obiettivo è convessa, ma i vincoli non lo sono ,
# in particolare il vincolo di normalizzazione e il vincolo distanzaPuntoRetta.

# Il modello che si ricava dal problema di minimizzare la somma dei valori assoluti degli
# errori resta un modello non lineare, ma non a causa della funzione obiettivo che invece
# è lineare. La non linearità dipende sempre dai vincoli, gli stessi di prima.
# La soluzione trovata è una soluzione ottima che vale 0.801.

# Il modello che si ricava è ancora una volta non lineare, questa volta anche a 
# causa della funzione obiettivo. La soluzione trovata è ottima e vale 0.1722 ( 0.1722 è
# la somma degli errori quadratici).

# Nel primo caso, con outlier, il modello risulta ancora non lineare, con l'aggiunta
# di nuove linearità nei vincoli del calcolo dell'errore. La soluzione trovata è ottima
# e vale 0.0932 (molto meglio che nel caso senza outlier), e l'outlier scelto è
# l'osservazione numero 6.

# Nel secono caso, con outlier, il modello risulta non lineare, esattamente come spiegato
# nel caso precedente. La soluzione anche qui risulta ottima e vale 0.426.
# L'osservazione che viene determinata come outlier è la sesta.

# Nel terzo caso, con un outlier, il modello è non lineare come prima,
# e la soluzione trovata è ottima. L'osservazione che viene scartata è la sesta.

# In tutti i tre casi l'outlier è l'osservazione numero 6.

# DATI

param nO;			# Numero osservazioni
set O := 1..nO;		# Insieme delle osservazioni
param an{O};	    # Angolo delle osservazioni [rad]
param d{O};			# Distanza delle osservazioni [km]

# VARIABILI

var a := 5;				# Coefficiente a della traiettoria
var b := 5;				# Coefficiente b della traiettoria
var c;				# Coefficiente c della traiettoria
var xO{O};			# Variabile ausiliaria, calcola la posizione x della nave data l'ossevazione
var yO{O};			# Variabile ausiliaria, calcola la posizione y della nave data l'ossevazione
var e{O};			# Distanza tra la retta e l'osservazione
var errore;			# Massimo Errore in valore assoluto
var errori{O};		# Errori in valori assoluto
var outlier{O} binary; # 1 se è un outlier , 0 altrimenti

# VINCOLI

s.t. normalizzazione:
	a**2 + b**2 = 1;

s.t. posizioneNaveY{i in O}:
	yO[i] = d[i] * sin(an[i]);

s.t. posizioneNaveX{i in O}:
	xO[i] = d[i] * cos(an[i]);

s.t. distanzaRettaPunto{i in O}:
	abs(a*xO[i] + b*yO[i] + c) / sqrt(a**2 + b**2) = e[i]; 

########### VINCOLI SENZA OUTLIER
/*
# Valori assoluto degli errori (linearizzo, potrei usare anche abs ma aggiungerei una non
# linearità).
s.t. erroreAssoluto1{i in O}:
	errori[i] >= e[i];
s.t. erroreAssoluto2{i in O}:
	errori[i] >= -e[i];

# Linearizzazione del valore assoluto
s.t. erroreMassimo1{i in O}:
	errore >= e[i];

s.t. erroreMassimo2{i in O}:
	errore >= -e[i];
*/

########### VINCOLI CON OUTLIER

s.t. unSoloOutlier:
	sum{i in O} outlier[i] = 1;

s.t. erroreAssoluto1{i in O}:
	errori[i] >= e[i]*(1-outlier[i]);
s.t. erroreAssoluto2{i in O}:
	errori[i] >= -e[i]*(1-outlier[i]);

s.t. erroreMassimo1{i in O}:
	errore >= e[i]*(1-outlier[i]);

s.t. erroreMassimo2{i in O}:
	errore >= -e[i]*(1-outlier[i]);

# OBIETTIVO

# Funzione obiettivo 3 con outlier
#minimize z: sum{i in O} (1-outlier[i])*e[i]**2;

# Funzione obiettivo 3
#minimize z: sum{i in O} e[i]**2;

# Funzione obiettivo 2
minimize z: sum{i in O} errori[i];

# Funzione obiettivo 1
#minimize z : errore;

########################

data;

param nO := 8;

param : an d :=
1 -0.036	 7.5
2  0.124	10.5
3  0.208	13.5
4  0.260	16.5
5  0.294	19.5
6  0.318	26
7  0.337	27
8  0.351	30;


end;

