
# DATI
set O;				# Insieme di origini (siti produttivi)
set D;				# Insieme di destinazioni (punti vendita)
param t {O,D};		# Distanza [km]
param p {O};		# Costo unitario di produzione [€/u]
param o {O};		# Capacità produttiva [u/g]
param d {D};		# Domanda [u/g]
param c;			# Coefficiente di costo di trasporto [€/(km*u)

param nT;			# Numero di tipi di veicolo
set T := 1..nT;		# Insieme di tipi di veicolo
param q {T};		# Capacità [unità di merce]
param u {T};		# Costo chilometrico [€/km]

var x{O, D} >= 0; #Unità di merce al gg
var y{O,D,T} integer; #Numero di viaggi con un mezzo T da O a D
var w{O} binary; #Indica se il sito è utilizzato oppure no

s.t. soddisfareDomanda {j in D}:  sum {i in O} x[i,j]= d[j];
s.t. produzione {i in O}: sum{j in D} x[i,j] <= o[i];
s.t. utilizzoSito {i in O}:
	sum {j in D} x[i,j] <= o[i] * w[i];
#Quesito 1: Si tratta di un problema con variabili e vincoli lineari, quindi è un modello di programmazione lineare. Osservando l'analisi di sensitività si nota che
#Nessuno stabilimento raggiounge la produzione masima, quindi non ha senso fare alcun investimento.
minimize z1: sum {i in O, j in D} x[i,j]*(c*t[i,j] + p[i]); 
#______________________________
# QUESITO 2: 2 veicoli diversi, con capacità e costi differenti
s.t. capacita_mezzo {i in O, j in D}: #Facendo tutti i viaggi la merce trasportata deve essere uguale a quella in x
	x[i,j] <= sum {k in T} q[k] * y[i,j,k];
#minimize z:
#	sum{i in O, j in D} x[i,j]*p[i] + sum{k in T,i in O, j in D} u[k] * y[i,j,k];

#Quesito 3: Riformulare il problema assumendo come obiettivo prioritario la minimizzazione del numero di siti produttivi utilizzati e come obiettivo secondario la minimizzazione dei costi complessivi, come definita sopra.
minimize z: 
	sum {i in O} w[i];
	

data;
set O := A B C D F G J M;
set D := A B C D E F G H J K L M;
param nT := 2;
param:	q	u :=
1		30	1.00
2		20	0.80;


param t: 	A		B		C		D		E		F		G		H		J		K		L		M	 :=
A			0		565		401		529		505		295		720		550		817		891		539		855	
B			565		0		210		474		309		799		665		760		936		1008	979		1420
C			401		210		0		309		289		635		500		674		771		949		838		1255
D			529		474		309		0		114		375		194		377		465		643		579		1012
F			295		799		635		375		431		0		411		259		394		599		293		634	
G			720		665		500		194		271		411		0		281		861		450		570		681	
J			817		936		771		465		553		394		861		117		0		220		378		593	
M			855		1420	1255	1012	956		634		681		527		593		705		285		0	;

param:	p	o :=
A		10	300
B		15	200
C		18	200
D		20	300
F		12	200
G		16	200
J		16	300
M		10	300;

param d :=
A		80
B		70
C		60
D		70
E		80
F		40
G		60
H		70
J		150
K		40
L		30
M		50;

param c := 0.05;

end;
