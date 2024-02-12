# Esercizio Spirale di archimede - 22/01/2024
reset;
# PARAMETRI
param n := 10;
set P := 1..n;

param theta{P};
param rho{P};

param x{P};
param y{P};

# VARIABILI
# controllato formule su https://it.wikipedia.org/wiki/Spirale_archimedea
# e versione inglese
var a;
var b >= 0;

var err{P};

# VINCOLI
s.t. CalcX{p in P}:
	err[p] = (a+b*theta[p])-rho[p];

# OBIETTIVO
minimize z:
	sum{p in P} ( err[p]^2 ) / n;

# DATI
data;
param
:	  x	  		y	 theta	 rho :=
  1	 0.07	 0.10	 0.960	0.122
  2	-0.05	 0.25	 1.768	0.255
  3	-0.49	 0.31	 2.578	0.580
  4	-0.66	 0.00	 3.142	0.660
  5	 0.07	-1.37	 4.763	1.372
  6	 0.61	-1.15	 5.200	1.302
  7	 1.75	 0.26	 6.431	1.769
  8	-1.01	 2.16	 8.291	2.384
  9	-2.78	-0.20	 9.497	2.787
 10	-0.07	-3.05	10.973	3.051
;
 
solve;
end;
