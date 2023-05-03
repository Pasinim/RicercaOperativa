#DATI

param nM;		#il numero di merci
set M:=1..nM;	#insieme delle merci
param t{M};		#periodo ottimo di consegna [giorni]
param c{M};		#costo ottimo di consegna [K€/settimana]

#VARIABILI
var h{M} >=1 integer;
var x{m in M} = h[m]*7;		#ogni quanto deve arrivare la merce [giorni]

#VINCOLI



#OBIETTIVO
#minimizzare i costi
minimize z: sum{m in M} ( c[m]/2 * (x[m]/t[m] + t[m]/x[m]) );

data;

param nM:= 7;

param:	 t		 c	:=
  1     17		140
  2     10	 	 65
  3     19		200
  4     12		115
  5      5	 	 75
  6     12.5 	145
  7     24		100;

end;
