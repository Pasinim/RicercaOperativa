#Dat
set nE ;
set nM ;
set noPuri;
param C {nE, nM};#Composizione materiali [% in peso per ogni elemento chimico]
param uBound {nE};
param lBound {nE};
param d {noPuri}; #disponibilità materiali [tonnellate]
param p {nM}; #prezzo [$/tonnellata]
param produzione; #alluminio da produrre [tonnellate]

#Variabili
var x {nM} >= 0; #quantita di ogni materiale [tonnellata]
var tot >= 0; #quantità totale di alluminio prodotto [tonnellata]

#Vincoli
subject to val_tot :
	sum {m in nM} x[m] = tot;
	
subject to produz :
	tot <= produzione;
	
subject to lowerBound {e in nE, m in nM} :
	x[m] 	>= lBound[e] * tot;

subject to upperBound {e in nE, m in nM} :
	x[m] 	<= lBound[e] * tot;
	

#Ob: Creazione di Al al prezzo minore possibile

data;
param produzione := 4.5;
set nM := ALMC KAC Rottami	Al	Si	Mg;
set nE := Si	Mg	Fe	Co	Mang	Zn	Cr	Ti	Al	Altro	Impurita;
set noPuri :=	ALMC	KAC		Rottami;


param d :=
ALMC .5
KAC 1.2
Rottami	2.2
;

param p :=
ALMC 1230
KAC 1230
Rottami	1230
Al	2140
Si	1300
Mg	2442
;

param: lBound uBound :=
Si	.6		.6	
Mg	.45		.9
Fe	0		.35
Co	0		.1
Mang	0	.1
Zn		0	.1
Cr		0	.1	
Ti		0	.1
Al		96.9 100
Altro	0	.15
Impurita 0	0
;


param C : ALMC KAC Rottami	Al	Si	Mg :=
	Si	.5		.5	.3		0	100	0
	Mg	.75	.7	.5			0	0	100
	Fe	.2	.2	.35			0	0	0	
	Co	.01	.01	.05			0	0	0
	Mang .02 .02 .35		0	0	0		
	Zn	.02	.02	.05			0	0	0
	Cr	.02	.02	.05			0	0	0
	Ti	.02	.02	.05			0	0	0
	Al	97	97	90			100 0 	0
Altro	.06	.06	.077		0	0	0
Impurita 1.4	1.4	7.03	0	0	0
;
	


end;

