param nO; #Numero ordini
set O := 1..nO;
param s{O}; #Scadenza di ciascun ordine
param t{O}; #Tempo di lavorazione di ciascun ordine


#Variabili
var produzione{O, O} binary; #1 sse l'ordine i è stato preparato prima di j è in fase di produzione
var tc{O} >= 0; #Indica il tempo di completamento di o
var tRit{O} >= 0; #Indica il tempo di ritardo dell'ordine o
#Ob 
#A: Minimizzare il ritardo complessivo
minimize z:
	sum{i in O} tc[i];
#B: Minimizzare il ritardo massimo

#Vincoli
s.t. ritardo{i in O}:
	tRit[i] = s[i] - tc[i];
	
s.t. predecessore{i in O}:
	produzione[i,i] = 0;
	
s.t. connessione{i in O, j in O: i<>j}:
	produzione[i,j] + produzione[j,i] = 1;
	
s.t. noCicli3{i in O, j in O, k in O: i<>j and j<>k and k<>i}:
	produzione[i,j] + produzione[j,k] + produzione[k,i] <= 2;

s.t. tempo_completamento {i in O}:
	tc[i] = sum{j in O: j<i} t[j] * produzione[j,i] + t[i];


data;
param nO := 10;
param: t s :=
1			24			    50
2			12			    50
3			30			    90
4			15			    70
5			18			    50
6			7			    80
7			8			   100
8			15			    90
9			14			   120
10			22			   150
;
end;

