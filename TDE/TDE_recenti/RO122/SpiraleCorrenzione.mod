reset;
param nP := 10;
set P := 1..nP;
param rho{P};
param theta{P};

#Coefficiente k, lega raggio e angolo con l'angolo iniziale: rho  = k(theta - theta_iniziale)
#Eq, spirale archimedea -> rho = a + b* theta
var err{P};
var a;
var b >= 0;

s.t. def_err {p in P}:
	err[p] = (a+b*theta[p]) - rho[p];

minimize z:
	sum {p in P} (err[p])^2 / nP;
data;
param:  rho	 theta :=
  1	 0.960	0.122
  2	 1.768	0.255
  3	 2.578	0.580
  4	 3.142	0.660
  5	 4.763	1.372
  6	 5.200	1.302
  7	 6.431	1.769
  8	 8.291	2.384
  9	 9.497	2.787
 10	10.973	3.051
 ;


solve;
end;