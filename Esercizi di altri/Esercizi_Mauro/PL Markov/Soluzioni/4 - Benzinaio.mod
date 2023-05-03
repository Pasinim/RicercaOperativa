# Es: Distributore benzina
# DATI

set S;					# Possibili stati
param T {S,S};			# Possibili transizioni

# VARIABILI

var P {S} >=0;			# Probabilità degli stati
var v;

# VINCOLI

# Normalizzazione
subject to Norm: sum {s in S} P[s] = 1;
# Bilanciamento
subject to Bil {s in S}:
	P[s] * sum {s2 in S} T[s,s2] = sum {s2 in S} P[s2]*T[s2,s];

subj to DefV: sum {s in S} s*P[s] = v;

data;

set S := 0 1 2 3;
param T :
		0    1    2    3 :=
	0   0    1    0    0
	1 0.4    0 0.66    0 
 	2   0  0.4    0 0.33
	3   0    0  0.4    0;

end;
