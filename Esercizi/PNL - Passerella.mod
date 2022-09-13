#ogni nodo del cammino è collegato con uno o più punti dati

param nV; 	#NUmero vicoli
set V := 1..nV; #Insieme vicoli
#coordinate estremita di ogni vicolo
param x {V};
param y {V};
param nP; #numero di piattaforme
set P := 1..10;

#Variabili: coordinate delle piattaforme da posizionare in piazza
var xx {P}; 
var yy {P};
#servono le distanze piattaforma-piattaforma e piattaforma-vicolo. Dobbiamo 
#assegnare ogni vicolo ad una piattaforma:
var distvp {v in V, p in P} = sqrt((xx[p]-x[v])^2 + (yy[p]-y[v])^2); #distanza vicolo-piattaforma
var dispp {p in P: p>1} = sqrt((xx[p]-x[p-1])^2 + (yy[p]-y[p-1])^2); #distanza vicolo-piattaforma #distanza piattaforma-piattaforma
var w {V,P} binary;#variabili binarie, indica se un vicolo è abbinato ad una piattaforma 

#Vincoli
subj to Assign {v in V}: #ogni vicolo deve essere associato solamente ad una piattaforma
	sum {p in P} w[v,p] = 1;


#Ob: minimizzare la lunghezza totale delle passerelle utilizzate
minimize z:
	sum {v in V, p in P} disvp[v,p] * w[v,p] + 
	sum {p in P: p>1} distpp[p];
	#calcolo la distanza solo di quelle che hanno un assegnamento (in w)

data;
param nV := 10;
param nP := 3;
param: 	x	y	 :=
	1	0	1	
	2	0	3
	3	3	7
	4	5	9
	5	9	9
	6	11	8
	7	11	7
	8	11	4
	9	8	1
	10	6	1
;

#inizializzo le prime tre variabili
var:		x	y
	1	3	2
	2	6	4
	3	9	6
;
end; 