
set S := 1..4;
set B := 1..3;
param risorse{S}; #barili giornalieri
param costo{S};
param lB{S, B}; #percentuale minima si sostanze per ogni miscela[%]
param uB{S, B}; #percentuale minima si sostanze per ogni miscela[%]
param ricavi {B};

var x{S, B} >= 0; #quantita di ogni sostanza in ogni benzina
var y{B} >=0; #totale benzina prodotta;

subject to total_production {b in B}:
 	sum {s in S} x[s,b] = y[b];

subj to risorseMax {s in S}:
	sum {b in B} x[s,b] <= risorse[s];

subj to upperBound {b in B, s in S}:
	x[s,b] <= uB[s,b]*y[b];
	
subj to lowerBound {b in B, s in S}:
	x[s,b] >= lB[s,b]*y[b];

maximize profitto: 
	sum {b in B, s in S} x[s,b] * (ricavi[b] - costo[s]);
	
data;

param costo := 
1 3
2 6
3 4 
4 5
;

param ricavi :=
1 5.5
2 4.5
3 3.5
;
param risorse :=
1 3000
2 2000
3 4000
4 1000
;
param lB :	1	2	3 :=
1			0	0	0
2			.4	.1	0
3			0	0	0
4			0	0	0
;

param uB :	1	2	3 :=
1			.3	.5	.7
2			1	1	1
3			.5	1	1
4			1	1	1
;
end;

