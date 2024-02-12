reset; 
param nNodi;
set nodi := 1..nNodi;
param s1; #Start1
param s2; #Vertice Start2
param t; #Verice finale
set E within nodi cross nodi;
param pesi{E};
param max1{E};
param max2{E};
param M1{s in {s1, s2}};
param M2{s in {s1, s2}};

var x{E} binary; #Variabile binaria di selezione
#s.t. conservazioneFlusso: #Non so se serve
subject to Indegree_s1:
  sum {j in nodi: (s1,j) in E} x[s1,j] = 1;
subject to Indegree_s2:
  sum {j in nodi: (s2,j) in E} x[s2,j] = 1;
subject to Outegree_t:
  sum {j in nodi: (j, t) in E} x[j,t] = 1;
data;
param nNodi := 7;
param s1:= 5; #Uso questi numeri per i nodi per non modificare tutto il grafo?? Posso??
param s2:= 6;
param t := 7;
set E := s1 1, s2 1, s2 2, 1 2, 2 3, 1 4, 3 4, 4 t, 3 t;
param:	pesi	max1	max2 :=
s1,1	11		2		3
s2,1	2		4		1		
s2,2	2		4		1
1,2 	9		6		5
2,3 	13		3		2
1,4 	6		3		2
3,4 	4		6		5
4,t 	12		2		2
3,t		8		3		3;
param:	M1	M2 :=
s1    6    5
s2    4    7
;
solve;
end;




