set A := 1..7;
set S := 1..3;

param nut {S,A};
param uB {S};
param lB {S};
param costo {A};

#Var
var x {A} >= 0;

#Vincoli
subj to limSup {s in S}:
	sum {a in A} x[a] * nut[s,a] <= uB[s]; #cosi mi somma a?
	
	
subj to limInf {s in S}:
	sum {a in A} x[a] * nut[s,a] >= lB [s]; #cosi mi somma a?



#Ob: minimizzare i costi
minimize z:
	sum {a in A} x[a]*costo[a];
	
data;

param nut : 1	  2   3  4    5   6   7 := 		
1			11.5 3.15 8 18.5 2.1 12.0 9
2			72.7 4.85 3.8 0.5 0 68 74
3			1.5 1.55 11 19 0.1 6 1
;

param uB :=
1	35
2	25
3	20
;

param lB :=
1	25
2	15
3	10
;

param costo := 
1 4
2 4
3 15
4 22.5
5 3
6 1
7 5
;
end;

