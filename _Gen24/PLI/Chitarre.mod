set C;
set R := 1..3; #insieme dei reparti
param ricavo{C};
param addetti{R};
param t {R, C}; #Tempo di lavorazione
param qMin := 100; #[u/sett]
param h := 40; #Ore lavorative settimanali
param paga{R}; #paga oraria

var x{C} >= 0 ; #Unità prodotte per ogni tipologia


s.t. domanda: sum {c in C} x[c] >= 100;
s.t. oreLavorative{r in R}:	
	sum {c in C} x[c] * t[r,c] <= addetti[r] * h; 
#Si tratta di un problema con variabili discrete quindi è un problema di programmazione lineare.
#Q1 Massimizzare profitto
#maximize z:
#	sum{c in C} ricavo[c] * x[c];
#Q2: Si è conveniente, infatti anche considerando la paga più alta del liutaio ci sarebbe comunque un profitto. Ho considerato che il falegname promosso viene rimpiazzato da un altro
maximize z:
	sum{c in C} ricavo[c] * x[c] - sum{c in C, r in R} x[c] * t[r,c] * paga[r];

data;
set C := D L S;

#Q2: introduco un parametro per gli stipendi dei liuti e dei falegnami
param paga:=
1 6.25
2 15s
3 12.5
;

param ricavo :=
D 350
L 160
S 100;

param addetti :=
1 10
2 5
3 3;

param t :
	D	L	S :=
1	2	4	1
2	2	4	1.5
3	4	1	1
;
end;
