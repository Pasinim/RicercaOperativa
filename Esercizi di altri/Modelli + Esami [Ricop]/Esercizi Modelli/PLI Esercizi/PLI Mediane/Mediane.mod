#ESERCIZIO 90.1 PLI - Mediane

#DATI

param nM := 2;		# Numero dei magazzini
param nC := 10;		# Numero di città da servire
set C := 1..nC;		# Insieme delle città
set M within C;		# Insieme dei possibili magazzini
param d {M, C};		# Distanza tra due cittò [km]
param a {M};		# Costo di attivazione per ogni cittò
param b;			# Budget a disposizione

#VARIABILI
var x{M} binary;	# La variabile vale 1 se la cittò ospita un magazzino, 0 altrimenti
var dmax;			# Distanza massima tra magazzino e città

#VINCOLI

#limite di budget

#numero di magazzini richiesti
subj to Magazzini: sum{m in M} x[m]=nM;

#definizione distanza massima
subj to MaxDist{i in M, j in C: i<j}: dmax >= d[i,j] * x[i];


#OBIETTIVO
#minimizzare la distanza massima tra un magazzino e una città
minimize z: dmax;

##########################
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
