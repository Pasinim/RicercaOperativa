param nG := 5;
param nT := 3;
set T := 1..nT;
set G := 1..nG;
set O := 1..nT; #Insieme degli operai
param d{G, T}; #Durata dei turni (ore)

var x{O, G, T} binary; #1 sse a O viene assegnato il turno T nel giorno G, 0 altrimenti
var y{O} >= 0; #Ore totali svolte da ogni operaio
var z >= 0;
#L'addetto numero 1 non è in grado di eseguire i turni della prima colonna, in nessuno dei cinque giorni.
s.t. addetto1 {g in G} :
	x[1,g,1] = 0;
s.t. unOperaioPerTurno {t in T, g in G}:
	sum {o in O} x[o,g,t] = 1;
s.t. assOperai{o in O, g in G}:
	sum {t in T} x[o,g,t] = 1;
s.t. def_z{o in O}:
	z >= sum {g in G, t in T} x[o,g,t] * d[g,t];

#Per rendere i turni equi devo fare in modo che la differenza sia il meno possibile
minimize z1: z;

#Si tratta di un problema con variabili binarie intere, quindi è un problema di PLI. La soluzione è ottima ma non possiamo sapere se è unica
	 
data;
param d :
		1  	 2	  3  :=
	1	5	 2	  8
	2	4    7    3
	3	6    7    5
    4	7    8    6
    5	5    4    7
	;
end;


