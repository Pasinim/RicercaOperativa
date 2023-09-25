param nC; #Numero di clienti
set C := 1..nC;
param nF; #Numero finestre temporali
set F := 1..nC;
param maxFinestra; #Numero massimo di finestre temporali per un singolo cliente
set M := 1..maxFinestra;
param s{F, M};
param e{F, M};
param t{F}; #Tempo di viaggio

var x{F} >= 0;
var y{F} binary: #Indica 
var tempo_tot >= 0; #Varaibile ausiliaria che indica il tempo totale impiegato per l'intero viaggio
s.t. timeSlotPartenza {f in F, m in M: f > 0}:
	x[f] >= s[f, m];
	
data;
param nC := 4;
param nF := 6;
param maxFinestra := 4;
param t :=
1 48
2 80
3 72
4 88
5 52;

param s : 1 2 3 4 :=
1 0 0 0 0 
2 68 148 200 0 
3 200 264 320 0 
4 215 264 332 412 
5 312 400 464 0
6 460 0 0 0
;

param e : 1 2 3 4 :=
1 200 0 0 0 
2 112 176 220 0 
3 244 276 344 0 
4 235 296 368 420
5 344 416 504 0
6 560 0 0 0
;

end;
