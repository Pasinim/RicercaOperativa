param nP; #numero delle posizioni
set P := 1..nP; #insieme delle posizioni
param N ;
param c{P}; #valore della cifra in posizione i
param nW :=  ceil(log(N)/log(10)); #ceil = approssimazione per eccesso
set W := 0..nW; 


#var
param x {P, W} binary; #x[i,j] = 1 se la cifra i ha peso 10^j
#var n <= N;
var n;


#Vincoli
#Vincolo di assegnamento, per ogni posizione devo avere esattamente un peso
subj to assegnamento{p in P}:
	sum {w in W} x[p,w] = 1;

#Valore del numero
subj to Numero:
n = sum {p in P} c[p] * sum {w in W} x[p,w] * 10^w;

#Soglia
subj to soglia:
	n<= N;
#Vincoli posizioni Pesi
subj to posizionePesi{p in P, w in W: (p < nP) and (w > 0)}:
	x[p,w] <= x[p+1, w-1]; #Vincola tutte le posizioni p tranne l'ultima

subj to ultimaPosizone:
	x[nP, 0]= 1;

#Ob
maximize z: n;

#Dati

data;
param nP := 9;
param N := 1000;
param c :=
1 9
2 8
3 7
4 6
5 5
6 4
7 3
8 2
9 1
;

end;
