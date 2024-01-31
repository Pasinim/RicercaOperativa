#esame rete
#dati
set nodi:=1..7;						#insieme dei nodi di cui é composta la rete
set archi within nodi cross nodi;	#insieme degli archi ovvero i link della rete
set tipi;							#insieme delle tipologie di link
param lunghezza {archi};			#vettore delle lunghezze dei link [km]
param traffico:=120;				#valore del traffico da gestire [Gb/s]
param capacita {tipi};				#vettore delle capacitá dei vari link [Gb/s]
param costo {tipi};					#vettore dei costi di utilizzo dei vari link al kilomentro[euro/km]

#variabili
var x {i in nodi, j in nodi,tipi: (i,j) in archi} binary;	#vettore delle tipologie di link per ogni arco [binario]
var y {i in nodi, j in nodi: (i,j) in archi} >=0;			#vettore del traffico passante per i link [Gb/s]
#var w {i in nodi, j in nodi: (i,j) in archi} binary; 		#vettore dei link utilizzati [binario]

#vincoli
#vicolo sul traffico uscente dal nodo iniziale [Gb/s]
subject to trafficoIniziale:
	sum {j in nodi: (1,j) in archi} y[1,j] = traffico;

#vincolo sul traffico entrante nel nodo finale [Gb/s]
subject to trafficoFinale:
	sum {i in nodi: (i,7) in archi} y[i,7] = traffico;

#vicolo sulla conservazione del flusso nei nodi intermedi. Tutto il flusso entrante deve corrispondere a quello uscente [Gb/s]
subject to conservazioneFlusso {n in nodi: n not in {1,7}}:
	sum {i in nodi: (i,n) in archi} y[i,n] = sum {j in nodi: (n,j) in archi} y[n,j];

#vincolo sull'unicitá del tipo di link qualora venga utilizzato [binario]
subject to unicitaTipo {i in nodi, j in nodi: (i,j) in archi}:
	sum {t in tipi} x[i,j,t] = 1;

#vincolo sulla capacitá di traffico dei vari link [Gb/s] 
subject to trafficoLink {i in nodi, j in nodi: (i,j) in archi}:
	sum {t in tipi} x[i,j,t]*capacita[t]>= y[i,j];

#obiettivo
#minimizzare il costo dell'infrastruttura
minimize z: sum {i in nodi, j in nodi, t in tipi: (i,j) in archi} x[i,j,t]*lunghezza[i,j]*costo[t];
#######

data;

set archi:= 1 2, 1 3, 1 4, 2 5, 2 6, 3 5, 3 6, 4 5, 4 6, 5 7, 6 7;
set tipi:= A B C D;

param	lunghezza:=
 1,2        10
 1,3        15
 1,4        20
 2,5        15
 2,6        20
 3,5        10        
 3,6        15
 4,5        15
 4,6        10
 5,7        20
 6,7        10;

param:	capacita	costo:=
  A        8           250
  B       16           400
  C       32           700
  D       64          1000;
end;

# É un problema di PLI
# Ho raggiunto l'ottimalitá, ma non posso sapere se questa sia unica