#il capitale può essere distribuito su capitali diversi
set M; #insieme dei paesi
set F; #insieme di fondi per ongi paese
set C; #insieme dei capitali finanziari
set A; #insieme delle azioni di ogni fondo
param fondi {M, F, A}; #Composizione dei fondi [%]
param capitale {C}; #capitale disponibile [mln $]
param lim {M, A}; #limite di azioni acquistabii per paese [mln $]
param rendimento {M, F}; #rendimento percentuale previsto delle azioni di ogni paese

#VARIABILI
var x {m in M, f in F} >=0;
var tot; #capitale totale

#VINCOLI
subj to aus:
	sum {c in C} capitale[c] = tot;
	
subj to cap:
	sum {m in M, f in F} x[m,f] <= tot;

subj to antitrust {m in M, a in A}:
	sum {f in F} x[m,f] * fondi[m,f,a] * rendimento[m,f] <= lim[m,a];

#OB: Massimizzare guadagno

maximize z:
	sum {m in M, f in F} rendimento[m, f]/100 * x[m,f];




data;


set A := 0..3; 
set M := 0..2;
set F := 0..3;
set C := 0..2; #Svizzera Colombia Monaco;

param rendimento :	0		1		2		3	:=
	USA				.35		.1		.6		.4
	EU				.1		.3		.8		.3
	JP				.4		.3		.2		.1
;
param lim :		0		1		2		3 :=
	USA			100		100		79		98
	EU			150		120		80		90
	JP			110		90		200		130
;

param capitale :=
	0	433	#Svizzera
	1	320 #Colombia
	2	377 #Monaco	
;       

#usa
param fondi :=
[0,*,*](tr):	0		1		2		3 :=
		0		.5		.1		.25		.2
		1		.3		.8		.2		0
		2		.2		0		.35		.3
		3		0		1		2		5
	
	
[1,*,*](tr): 	0		1		2		3 :=
		0		.9		.2		0		.1
		1		.1		.3		.2		0.7
		2		0		0		0		.1
		3		0		.1		.8		.1
	
	
#JP
[2,*,*](tr): 	0		1		2		3 :=
		0		.7		0		.1		.2
		1		.2		.1		.5		.2
		2		.1		.1		.3		.6
		3		0		.8		.1		0
	;

		

end;
