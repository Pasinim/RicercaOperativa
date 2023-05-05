##sbagliato

set F := 1..7;
set P := 1..3;
set figlie := 1..2;

param fatturato {F, P};

var x {F} binary;			# vale 0 se il filiale F viene assegnato ad AF1, vale 1 se viene assegnato ad AF2
# è un problema minmax, devo quindi inserire delle variabili ausiliarie: vogliamo minimizzare la massima differenza di fatturato
#Fatturato dell'azienda 0
var y{P} >= 0;
#Fatturato dell'azienda 1
var yy{P} >= 0;

subj to varY {p in P}:
	y[p] = sum {f in F} fatturato[f,p] * x[f];
	
subj to varYY {p in P}:
	yy[p] = sum {f in F} fatturato[f,p] * (1-x[f]);
	
#min(max {fatturato_azienda1 - fatturato_azienda2})
#Min Z = alfa
var alfa >= 0; 

minimize z: alfa;
#spezzo il valore assoluto
subject to VA1 {p in P}:
	alfa >= y[p] - yy[p];
	
subject to VA2 {p in P}:
	alfa >= yy[p] - y[p];
	
data;
param fatturato:	1  2  3 :=
	1				83 14 42
	2				38 63 56
	3				28 24 12
	4				59 7 53
	5				25 35 83
	6				52 86 85
	7				59 64 25
;
end;

