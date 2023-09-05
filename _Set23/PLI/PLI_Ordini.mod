param nO := 10;
set O := 1..nO;
param t{O};
param s{O};

#Variabili
var x{O} binary; #1 sse l'ordine è stato evaso
var t{O} >= 0; #Inizio lavorazione 
var ritardo >= 0; #ritardo accumulato
#Vincoli

#Tutti gli ordini devono essere evasi
subj to all {i in O}:
	x[i] >=1;
#Una produzione per volta
subj to rit:
	ritardo = sum{o in O} 

#Ob; SEQUENZA MIGLIORE 
#Minimizzare il ritardo complessivo
minimize ritardo:
	sum {o in O} tt[o];

#Minimizzare il ritardo massimo

data;
param: t	s :=
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

end;

