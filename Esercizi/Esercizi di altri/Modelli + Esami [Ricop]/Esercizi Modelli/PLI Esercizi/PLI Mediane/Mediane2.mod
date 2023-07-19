# SECONDA e TERZA VERSIONE:
	#Formulare poi la versione in cui si vuole minimizzare il costo di trasporto complessivo, che si assume essere proporzionale alle distanze da percorrere per collegare ciascun terminale periferico al nodo centrale ad esso più vicino
	#Considerare inoltre la versione in cui esiste un costo di attivazione per ogni magazzino, diverso a seconda di dove esso viene localizzato, ed un budget complessivo disponibile per sostenere tali costi.
	
#DATI

param nM:=2;	#numero dei magazzini
param nC:=10;	#numero di città da servire
set C:=1..nC;	#insieme delle città
set M within C;#insieme dei possibili magazzini
param d{M, C};	#distanza tra due cittò [km]
param a{M};		#costo di attivazione per ogni cittò
param b;		#budget a disposizione

#VARIABILI
var x{M} binary;	#la variabile vale 1 se la cittò ospita un magazzino, 0 altrimenti
var y{C, M}binary;	#associa ogni cittò al magazzino più vicino

#VINCOLI

#il budget deve essere rispettato

subj to Budget: sum{m in M} x[m] <= b;

#numero di magazzini richiesti
subj to Magazzini: sum{m in M} x[m]=nM;

#ogni città deve essere associata ad uno ed un solo magazzino
subj to Assign{c in C}: sum{m in M} y[c,m]= 1;
#un magazzino può essere associato solo se esiste
subj to Coerence{m in M, c in C}: y[c,m]<=x[m];

#OBIETTIVO
#minimizzare la distanza massima tra un magazzino e una città
minimize z: sum{c in C, m in M} d[m,c]*y[c,m];

data;
set M:=	1	2	3	4	5	6	7;

param d:	1	2	3	4	5	6	7	8	9	 10:=
1			0	565	401	529	295	720	550	817	891	 539
2			565	0	210	474	799	665	760	936 1008 979
3			401	210	0	309	635	500	674	771	949	 838
4			529	474	309	0	375	194	377	465	643	 579
5			295	799	635	375	0	411	259	394	599	 293
6			720	665	500	194	411	0	281	861	450	 570
7			817	936	771	465	394	861	117	0	220	 378;

param a:=
1    40 
2    50
3  	 40
4    40
5    40
6    40
7    60 ;

param b:= 100;


end;
