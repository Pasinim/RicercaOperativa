#Più lo scaffale è alto più costa
set L := 1..15;
set M := 1..15; #posso produrre al più uno scaffale per ogni libro
param w{L}; 
param h{L}; 

param W := 50; #Larghezza della libreria

var x{L} binary; #Indica se un libro è in uno scaffale
#Variabile per ogni coppiua libro-scaffale che indica che il libro i è sullo scaffale j
var y{L, M} binary;
var H{M} >= 0; #altezza dello scaffale m

#subj to defH {m in M}:
#	sum {l in L} h[l] * y[l,m] = H[m];
#Ogni scaffale deve essere alto almento quanto i libri contenuti al suo interno:
subj to hScaffale {m in M, l in L}:
	H[m] >=  h[l] * y[l,m]; 
	
subj to assegnamento {l in L}:
	sum {m in M} y[l,m] =1;
	
subj to larghezzaTot {m in M}:
	sum {l in L} w[l] * y[l,m] <= W; 

data;
param : w h :=
1		10 2
2		22 20
3		20 10
4		5 10
5		8 8
6		7 12
7		15 18
8		11 9
9		9 15
10		10 13
11		2 8
12		3 7
13		12 7
14		5 10
15		1 5
;

end;

