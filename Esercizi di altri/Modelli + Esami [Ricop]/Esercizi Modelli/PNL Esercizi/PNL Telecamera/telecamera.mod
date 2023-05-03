#ESERCIZIO 18 - PNL Telecamera

#DATI
param nQ;				# Numero quadri
set Q :=1..nQ;			# Insieme quadri
param L;				# Lato della stanza
param dmin;				# Distanza minima dalle pareti
# Le coordinate dei punti estremi
param xa {Q};
param ya {Q};
param xb {Q};
param yb {Q};
param C {q in Q} = sqrt((xa[q]-xb[q])^2 + (ya[q]-yb[q])^2);

#VARIABILI
# Le coordinate del sensore da collocare
var x >=dmin, <=L-dmin, := L/2;
var y >=dmin, <=L-dmin, := L/2;
var angolo {Q} >=0, <=3.14;
var A {q in Q} = sqrt((x-xa[q])^2 + (y-ya[q])^2);
var B {q in Q} = sqrt((x-xb[q])^2 + (y-yb[q])^2);
var angolominimo;

#VINCOLI 
subject to Formula {q in Q}:
	C[q]^2 = A[q]^2 + B[q]^2 - 2 * A[q] * B[q] * cos(angolo[q]);

#OBIETTIVI
#Obiettivo n1: massimizzare somma degli angoli
#maximize zTizio: sum {q in Q} angolo[q];

#Obiettivo n2: massimizzare il minimo angolo
maximize zCaio: angolominimo;
subject to maxmin {q in Q}:
	angolominimo <=angolo[q];


#########################
data;

param nQ := 3;
param L := 16;

param:	xa	ya	xb	yb :=
1   	0	0  	0	4
2   	0	10 	6	16
3   	15	0 	10	0; 

param dmin := 1;

end;
