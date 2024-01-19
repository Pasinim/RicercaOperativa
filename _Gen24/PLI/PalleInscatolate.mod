#Si tratta di progettare in modo ottimale la scatola, in modo che possa contenere
#tutto il kit e che occupi il minor volume possibile. Per motivi di facilità di trasporto, la scatola deve
#essere a forma di parallelepipedo.
param nP := 6;
set P := 1..nP;
param r{P}; #raggio [cm]
param q{P}; #Quantita kit [u]

var l >= 0;
var h >= 0;
var b >= 0;
var x{P} >= 0;
var y{P} >= 0;
var z{P} >= 0;
var A >= 0; 

#I vincoli del problema impongono che le palle non si sovrappongano nello spazio in tre
#dimensioni, cioè che per ogni coppia di palle la distanza tra i loro centri sia non inferiore alla
#somma dei loro raggi. le
s.t. sovrapposizione {p in P, p2 in P: p<>p2}:
	(x[p]-x[p2])^2+(y[p]-y[p2])^2+(z[p]-z[p2])^2 <= (r[p] + r[p2])^2;

#Altri vincoli impongono che le palle siano contenute interamente nella
#scatola, cioè che i loro centri siano ad una distanza dalle pareti della scatola almeno pari al raggio
s.t. latoScatola {p in P}: x[p] <= b - r[p];
s.t. altezzaScatola {p in P}: y[p] <= h - r[p];
s.t. profonditaScatola {p in P}: z[p] <= l - r[p];

#s.t. areaPalline:
#	A >= sum {p in P} 4/3 * 3.14 * r[p]^3 * q[p] ; 

s.t. def_A: b*h*l = A;
minimize z1: A;

data;
param: 
	r	q :=
1	2	3
2	4	2
3	3	3
4	4	4
5	2	3
6	3	2
;
end;

