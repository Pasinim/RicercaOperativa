set D; #Insieme dei detersivi
set S;
param lB{D, S};
param uB{D, S};
param q{S};
param profitto{D};

var x{D} >= 0; #litri di detersivi da produrre
var y{D,S} >= 0; #qunatita di sostanze utilizzate;
s.t. totale {d in D}: sum{s in S} y[d,s] = x[d];
s.t. limiteMin{s in S, d in D}: y[d,s]>= lB[d,s]*x[d] /100;
s.t. limiteMax{s in S, d in D}: y[d,s] <= uB[d,s] * x[d]/100 ;
s.t. disponibilita {s in S}: sum{d in D} y[d,s] <= q[s];

maximize z: sum {d in D} x[d] * profitto[d];
#I detersivi che è conveniente produrre sono B e T. S sarebbe conveniente se il suo prezzo di vendita sarebbe maggiore di 3.9

data;
set D := B S T;
set S := a v p;
param lB :
		a	v	p :=
B		80	5	10
S		70  10	5
T		65	20	15;

param uB :
		a	v	p :=
B		90	10	20
S		85	20	15
T		70	50	35;

param q :=
   a          700
   v          150
   p          200;
   
param profitto :=
   B        2.5
   S        2.0
   T        3.0;
end;
