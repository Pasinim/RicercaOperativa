#Dati
set Sostanze; 
set Alimenti;
param tabellaNutrizionale {Sostanze, Alimenti}; #[g/kg]
param upperB {Sostanze};	#[g/gg]
param lowerB {Sostanze};	#[g/gg]
param costo {Alimenti};		#[$/kg]

#Variabili

var x {Alimenti} >= 0; #[kg/gg]

#Vincoli

subject to lB {s in Sostanze}:
	sum {a in Alimenti} tabellaNutrizionale[s,a] * x[a]  >= lowerB[s]; #[g/kg] * [kg/gg] -> ottengo i grammi al gg

subject to uB {s in Sostanze}:
	sum {a in Alimenti} tabellaNutrizionale[s,a] * x[a]  <= upperB[s];

#Ob: Assumere la giusta quantità di nutrienti minimizzando i costi
minimize c:
	sum {a in Alimenti}	x[a] * costo[a]; #[kg/gg] * [$/kg]

data;
set Sostanze := P C G; #Proteine, carboidrati, grassi
set Alimenti := PASTA LATTE FORMAGGIO PESCE VERDURA PANE POLENTA;
param tabellaNutrizionale :
	PASTA 	LATTE 	FORMAGGIO 	PESCE 	VERDURA 	PANE 	POLENTA :=
P	11.5	3.15		8		18.5	2.1			12		9
C	72.7	4.85		3.8		0.5		0			68		74
G	1.5		1.55		11		19		0.1			6		1
;

param costo :=
PASTA		4
LATTE 		4
FORMAGGIO	15
PESCE 		22.5
VERDURA 	3
PANE 		1
POLENTA		5
;

param: upperB lowerB :=
P		35		25	
C		25		15
G		20		10
;


end;
