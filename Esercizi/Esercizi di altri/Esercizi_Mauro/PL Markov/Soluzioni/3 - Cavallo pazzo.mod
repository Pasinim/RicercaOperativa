# Es: Cavallo pazzo
# DATI

set S;							# Stati possibili casellle
param T {S,S};					# Probabilità transizioni

# VARIABILI

var P {S} >= 0;					# Probabilità stati caselle 

# VINCOLI

subject to Norm: sum {s in S} P[s] = 1;

subject to Bil {s in S}:
	P[s] * sum {s2 in S} T[s,s2] = sum {s2 in S} P[s2]*T[s2,s];

data;

set S := A L C;
param T :
		A    L    C :=
	A   0    0    1
	L   0 0.67 0.33
	C 0.5  0.5    0; 

end;
