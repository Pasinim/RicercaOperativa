param nP := 10; #Numero dei punti
set P := 1..nP; #insieme dei punti
param theta{P}; #Ascisse dei punti
param rho{P}; #Ordinate dei punti

#Eq, spirale archimedea -> rho = a + b* theta
var a >= 0; 
var b;

s.t. def_spirale{p in P}:
	rho[p] = a + b * theta[p];
#s.t. passante_per_origine:

s.t. lunghezzaSpirale{p in P}:
	0.5*a*(theta[p] * sqrt(1+theta[p]^2) + log(theta[p] + sqrt(1+theta[p]^2))) <=2;

minimize erroreQuadraticoMedio (p in P):
	

data;

param: 
	 theta	rho :=
1	 0.960	0.122
  2	 1.768	0.255
  3	 2.578	0.580
  4	 3.142	0.660
  5	 4.763	1.372
  6	 5.200	1.302
  7	 6.431	1.769
  8	 8.291	2.384
  9	 9.497	2.787
 10	10.973	3.051;



end;
