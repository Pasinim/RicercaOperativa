param nF := 3;
param nP := 3;
set F := 1..nF;
set O := 1..nP; #Operaatori disponibili
param c{F};
param co{F};
param v{O}; #Velocita [kg/h]
param costo{O}; #Costo oraraio [e/h]
param qTot := 3500; #Valore totale da trasportare
param t := 2.5; #Tempo per spostamenti


var y{F} >= 0; #Quantita di merce su F
var x{F, O} binary; #1 sse il furgone F è assegnato a O


#Ass Furgoni
subj to assF {f in F}:
	sum { o  in O} x[f,o] = 1;
#Ass operatori
subj to assO {o in O}:
	sum {f in F} x[f,o] = 1;

subj to trasporto{f in F}:
	y[f] = sum {o in O} v[o] * t * x[f,o];

subj to capacitaTrasporto {f in F}:
	y[f]  <= c[f];

minimize z:
	sum {o in O, f in F} co[f] * x[f,o] +  sum {o in O, f in F} x[f,o] * costo[o];



#OB; minimizzare il costo (sommato) dell'operazione


data;
param: c co :=
1	 600 18.00
2	 700 19.50
3	 500 17.00
;

param: v costo :=
1	 1000 19.00
2 	 1500 22.00
3 	 4000 27.00
;

end;

