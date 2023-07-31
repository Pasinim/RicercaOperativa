param nF := 3; #Numero fascicoli per volume
param pag := 44; #numero pagine fascicolo
param nA := 12; #articoli disponibili

set A := 1..nA;
set F := 1..nF;
param l{A}; #lunghezza di ogni articoli
param u{A}; #urgenza

var x{A, F} binary; #1 sse l'articolo a è nel fascicolo f
var minPubb >= 0;
var maxPubb >=0;

subj to lunghezzaPagine{f in F}:
	sum{a in A} l[a] * x[a,f] <= pag;
#Vincolo di assegnamento
subj to ass_articoli {a in A}:
	sum {f in F} x[a,f] <= 1; 
	
#subj to def_minPubb {f in F}:
	#minPubb <= sum{a in A} x[a,f] * l[a];
	
#subj to def_maxPubb {f in F}:
	#maxPubb >= sum{a in A} x[a,f] * l[a];

subj to urgenza{a in A: u[a] >0 }:
	sum {f in F: f<=4-u[a]} x[a,f] = 1; 

minimize rinviati:
	sum {f in F, a in A} x[a,f];

#Egli vuole cioè minimizzare la differenza tra il minimo ed il massimo numero di pagine di pubblicità nei fascicoli.
#minimize delta:
#	maxPubb - minPubb;
data;
param: l u :=
1 		   5         2
2         11		0
3         17         2
4         10 0
5         18         3 
6          8 0
7         14 0
8         9 1
9         16         1
10         12 0
11         14 0 
12         13 0
;

end;

