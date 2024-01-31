reset;
param nI;
param nV;
set V := 1..nV;
set I := 1..nI;
param peso{I}; 
param vol{I};
param pMax{V};
param vMax{V};
param cf{V};
param cvp{V}; #Costo variabile (peso)
param cvv{V}; #Costo variabile (volume)

var x{I, V} binary, integer; #variabile binaria che indica in quale volo è l'imballo i
var pesoTot{V} >= 0; #Variabile ausiliaria, indica il peso totale in v
var volumeTot{V} >= 0; #Variabile ausiliaria, indica il volume totale in v

s.t. assegnazione{i in I}: sum {v in V} x[i,v] <= 1;
s.t. def_pesoTot{v in V}:
	pesoTot[v] = sum {i in I} peso[i] * x[i,v];
s.t. def_volTot{v in V}:
	volumeTot[v] = sum {i in I} vol[i] * x[i,v]; 
s.t. pesoMassimo {v in V}:
	pesoTot[v] <= pMax[v];
s.t. volumeMassimo {v in V}:
	volumeTot[v]<= vMax[v];
#Assegno una penalità per tutti gli imballi che vengono spediti via nave
minimize y: sum {i in I} 10000 * (1-sum{v in V}x[i,v]);
maximize z:
	sum {v in V} ( cvp[v] * pesoTot[v] + cvv[v] * volumeTot[v]);

data;
param nI := 12;
param nV := 2;
param:	 peso	   vol :=
   1      400      9
   2      250     12
   3       70      8
   4     1000     20
   5      550     15
   6      810     25
   7      320     15
   8      125     26
   9      480     18
  10      225      4
  11      250      3
  12      400     23
  ;


param:
		 pMax		vMax		cf			cvp			cvv := 
  1    2900        90        2.0             8           2
  2    1950       100        1.5             5           3
  ;
  
  solve;
  #Perchè se è una variabile binaria mi escono i decimali? Con snopt da questo problema, 
  #Con baron no
  display y, z, x;
  end;
  