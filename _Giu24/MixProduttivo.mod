param nP := 3;
set P := 1..nP;
param nF := 2;
set F := 1..nF;
param resa{F, P}; #rendimento [%]
param profitto{F}; #[centesimi/kg]
param limite{P}; #kg

var x{F}; #kg acquistati da ogni fornitore

s.t. limiteProduzione{p in P}:
	sum {f in F} x[f] * resa[f,p] <= limite[p];
maximize guadagno:
	sum {f in F, p in P} x[f] * resa[f,p] * profitto[f]/100;
data;

param profitto :=
1	2
2 	3;
param limite:=
1	6000
2	4000
3	8000 ;
param resa :	1	 2	3 :=
1				.2 .2 .3
2 				.3 .1 .3;
end;

