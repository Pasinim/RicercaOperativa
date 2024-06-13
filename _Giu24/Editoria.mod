param nF := 4; #I fascicoli sono 4 se viene considerato un fascicolo etra in cui pubblicare quelli non ancora pubblicati
set F := 1..nF;
param pages := 44;
set art;
param l{art};
param u{art}; #priorita
#3 => non dopo il primo fascicolo
#2 => non dopo il secondo fascicolo
#1 => non dopo il terzo fascicolo

var x{art, F} binary;  #Indica se A viene pubblicato sul fascicolo F
var minPag ; #Numero minimo di pubblicita
var maxPag ; #numero massimo di pubblicita

s.t. assegnamento {a in art}:
	sum {f in F} x[a,f] >= 1;

s.t. def_minPag{f in F}:
	minPag <= sum{a in art} x[a,f] * l[a];
s.t. def_maxPag{f in F}:
	maxPag >=  sum{a in art} x[a,f] * l[a];
	
s.t. urgenza {a in art}:
	sum {f in F} f * x[a,f] <= 4-u[a];
s.t. lunghezzaFasciscolo {f in F}:
	sum {a in art} x[a,f] * l[a] <= pages;
	
#Minimizzare quelli che vengono rinviati
#Ottengono che è necessario rimandare al massimo 2 articoli
#minimize z1: sum {a in art} x[a,4];
#Per fare la 2 f.o è necessario imporre il vincolo ottenuto con z1
s.t. rimandare2articoli: sum {a in art} x[a,4] <= 2;
minimize z:	maxPag-minPag;
	
	
#Egli vuole cioè minimizzare la differenza tra il minimo ed il massimo numero di pagine di pubblicità nei fascicoli.

data;
set art := A B C D E F G H I J K L;


param: 		l			u := 
   A          5         2
   B         11			0
   C         17         2
   D         10			0
   E         18         3 
   F          8			0
   G         14			0
   H          9         1
   I         16         1
   J         12			0
   K         14			0
   L         13			0;
end;


