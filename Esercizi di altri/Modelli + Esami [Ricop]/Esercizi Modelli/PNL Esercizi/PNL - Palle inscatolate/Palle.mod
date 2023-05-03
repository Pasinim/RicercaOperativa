#ESERCIZIO PNL - Palle inscatolate

#DATI

param nT;		#numero dei tipi di addobbi
set T:=1..nT;	#insieme dei tipi
param c{T};		#il colore del tipo
param r{T};		#il raggio del tipo [cm]
param n{T};		#il numero da inserire nella scatola
param pi:=3.14;	#il pi-greco approssimato


#VARIABILI
var bs;			#la base della scatola [cm]
var hs;			#l'altezza della scatola [cm]
var ps;			#la profondità della scatola [cm]
var Vs=bs*hs*ps;	#volume della scatola [cm^3]
var Vp{T}; 			#il volume delle palline[cm^3]

#VINCOLI

#calcolo volume delle palline
subj to Sfera{t in T}: Vp[t] =(4*pi*r[t]^3)/3;

#la scatola deve contenere ogni pallina
subj to Space: Vs>=sum{t in T} Vp[t] * n[t];

#OBIETTIVO
minimize z:Vs;

data;

#LEGENDA COLORI: Rosso=1 Bianco=2 Azzurro=3 Trasparente=4

param nT:= 6;
param: 		c		r	n	:=
1     		1       2   3
2      		1       4   2
3       	2       3   3
4 			2       4   4
5      		3       2   3
6      		4 		3   2;

#inizializzazione variabili
var bs=4;
var hs=4;
var ps=4;


end;

