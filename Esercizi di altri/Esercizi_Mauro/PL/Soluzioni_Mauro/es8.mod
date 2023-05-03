# Esercizio 8: Pianificazione multi-periodo
# Dati

set Mesi := 1..4;
param richiesta {Mesi};				# Quantità di gelato richiesta x ogni mese [ton]
param capacita {Mesi};				# Capacità produttiva x ogni mese [ton]
param costiM {Mesi};				# Costi necessari a produrre 1 ton x ogni mese [€/ton]
param costiC {Mesi};				# Costi di immagazzinamento 1 ton x ogni mese [€/ton]

# Variabili

var x {Mesi} >=0;					# Quantità di gelato da produrre x ogni mese [ton]
var s {Mesi} >=0;					# Quantità di gelato da conservare a fine mese [ton]

# Vincoli

# Rispettare richiesta vendite giugno
subj to RichiestaGiugno: x[1] = richiesta[1]+s[1];
# Rispettare richiesta vendite (no giugno)
subj to Richiesta {m in Mesi: m>1}: (x[m]-s[m])+s[m-1] >= richiesta[m] ;
# Limiti capacità produttiva
subj to Capacita {m in Mesi}: x[m] <= capacita[m];

# Obiettivo
minimize Z: sum {m in Mesi} (x[m]*costiM[m]+s[m]*costiC[m]);

###########################
data;

param richiesta :=
	1		200
	2		300
	3		500
	4		400;
param capacita :=
	1		400
	2		500
	3		300
	4		500;
param costiM :=
	1		34
	2		36
	3		32
	4		38;
param costiC :=
	1		2000
	2		3000
	3		2000
	4		3000;

end;
