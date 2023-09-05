param nF := 3;
param nA := 12;
set A := 1..nA;
set F := 1..nF;
param pag := 44;
param urg{A};
param l{A};

var x{A, F} binary; #1 sse A è assegnato a F
var U >= 0;
var L >= 0;

subj to ass {a in A}:
	sum {f in F} x[a,f] <= 1;

subj to limitePagine {f in F}:
	sum {a in A} l[a] * x[a,f] <= pag;
	
subj to urgenza{a in A: urg[a] > 0}:
	sum {f in F: f <= 4-urg[f]} x[a, f] = 1;
#Mettere  il massimo numero di articoli
maximize z: sum{f in F, a in A} x[a,f];
#Il numero di pagine deve essere il più bilanciato possibile tra tutti i fascicoli -> min-max
minimize w: U - L;

subj to upper {f in F}:
	U >= sum {a in A} l[a] * x[a,f];
subj to lower {f in F}:
	L <= sum {a in A} x[a,f] * l[a];

	

data;
param: l urg :=
   1          5     2
   2         11		0
   3         17     2   
   4         10		0
   5         18     3    
   6          8		0
   7         14		0
   8          9     1   
   9         16     1   
   10         12	0
   11        14		0
   12        13		0
   ;
   
end;


