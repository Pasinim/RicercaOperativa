param nT := 6;
set T := 1..nT;
set P := 1..4; #Posizioni delle resistenze 
param n{T};
param res{T};
param target := 65;

var x{T, P} binary; 
var r{P}; #Var. Aus. per fare il calcolo della resistenza 
var delta; #Var aus per minmax

#In ogni posizione ci deve essere un solo resistore:
s.t. assegnamento {p in P}:
	sum {t in T} x[t,p]=1; 
#Per tutti i tipi
s.t. disp_res {t in T}:
	sum {p in P} x[t,p] <= n[t];
	
s.t. def_r {p in P}: sum {t in T} x[t,p] * res[t] = r[p];

s.t.  MinMax1:
	res[1]*res[2]/(res[1]+res[2]) + res[3]*res[4]/(res[3]+res[4]) <= target + delta;
s.t.  MinMax2:
	res[1]*res[2]/(res[1]+res[2]) + res[3]*res[4]/(res[3]+res[4]) >= target + delta;

minimize z: delta;

data;
param : n res :=
 1      1         12
 2      1         15
 3      2         20
 4      2         22
 5      1         30
 6      1         40
 ;

end;


 