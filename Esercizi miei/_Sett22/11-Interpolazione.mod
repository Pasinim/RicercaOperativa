#Dati
set nE;
set nG;
param consumo {nG}; #Consumo giornaliero di energia [KWh]
param tempo {nG, nE}; #tempo di utilizzo degli elettrodomestici [h/gg];

#Variabili: Si vuole stabilire i valori di potenza assorbita da ogni elettrodomestico che rendono minima la funzione dell'errore
var x {nE} >= 0; #potenza assorbita da ogni EL.
var err {nG}; #L'errore può anche essere negativo

#Contributo: tempo funzionamento * potenza assorbita (incognita)

#Vincoli
	
#Errore: consumo lettp sul contatore - (somma dei contrubuti relativi ai diversi elettrod)	
#se la lettura non avesse errori: consumo[g] = tempo[g,e] * x[e]
subj to errore {g in nG}:
	err[g] = consumo[g] - sum {e in nE} tempo[g,e] * x[e];
	#oppure consumo[g] = sum {e in nE} tempo[g,e] * x[e] + err[g];

#Ob: 
#	d) minimizzare l'errore quadratico medio

#	a) minimizzare il massimo errore in valore assoluto
#	definisco una variabile ausiliaria z per linearizzare il valore assoluto
minimize z1: z;
subj to Vincolo1 {g in nG}: z >= err[g];
subj to Vincolo2 {g in nG}: z >= -err[g];
	
# 	b) minimizzare il valore assoluto el valor medio degli errori
# 	posso fare come sopra...
#minimize z2: z;
#	z >= sum {g in nG} err[g]/nG;
#	z >= -sum {g in nG} err[g]/nG;
#	...tuttavia minimizzare il valore assoluto significa porlo uguale a 0:
subject to objB:
	sum {g in nG} err[g]/nG = 0;
	
#	c) minimizzare il valore medio dei valori assoluti degli errori
minimize objC: sum {g in nG} val_medio[g];

	

data;
set nE := 1..8;
set nG := 1..12;
param tempo :	1	2	3	4	5	6	7	8 :=
			1	.2	.4	.5	.6	.6	.6	.2	.2
			2	.1	1	.1	1.2	1.1	1	.6	.3
			3	.1	.5	.5	.7	.5	.5	.1	.2
			4	.2	.6	.6	.8	.6	.6	.2	.3
			5	.1	.4	.2	.3	.2	.2	 0	.2
			6	.2	.5	.4	.7	.5	.4	.2	.3
			7	.3	.4	.5	.8	.4	.4	.2	.2
			8	.6	.8	1	1.5	1.3	.6	.5	.6
			9	.3	.4	.5	.7	.5	.5	.3	.2
			10	.5	.9	1.1	1.3	.9	1.2	.8	.5
			11	0	.5	.2	.3	.2	.1	.1	.3
			12	0	.5	.2	.3	.2	.1	.1	.3
		;

param: consumo :=
	1	10
	2	20
	3	10
	4 	15
	5	5
	6	10
	7	10
	8	20
	9	12
	10	25
	11	2
	12	5
;
	

end;
