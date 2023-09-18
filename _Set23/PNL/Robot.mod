param nR := 6;
set R := 1..nR;
param ragg{R};
#Centri dei robot
var x{R};
var y{R}; 
var d{R, R}; #Variabile ausiliaria che indica la distanza tra due robot

#Vincoli di non sovrapposizione
s.t. noSovrapp{i in R, j in R: i<>j}: #quadrato della distanza
	 d[i,j]^2 >= (ragg[i] + ragg[j])^2;
s.t. def_d {i in R, j in R: i<>j}:
	d[i, j]^2 = (x[i]-x[j])^2 + (y[i]-y[j])^2;
	
minimize costoCavi:
	sum {i in R, j in R: i<>j} d[i,j]/2; 

data;
param ragg :=
1 120
2 80
3 100
4 70
5 45
6 120
;

var: x	y :=
1	-20	20
2	-10	-10
3	0	0
4	10	0
5	20 	-10
6	30	20
;
end;
