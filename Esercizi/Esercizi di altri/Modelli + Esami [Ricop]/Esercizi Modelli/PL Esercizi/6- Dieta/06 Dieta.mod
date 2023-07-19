#ESERICIZIO Dieta PL

#DATA
param nS;					# Numero delle sostanze
set S := 1..nS;				# Insieme sostanze (Proteine, carboidrati, grassi}
param nA;					# Numero degli alimenti
set A := 1..nA;				# Insieme alimenti

param q {S,A};				# Quantita di sostanza nutritive [grammi sostanza/kg alimento]
param costi {A};			# Costi alimenti [Euro/kg]
param qmin {S};				# Limite minimo delle sostanze da assumere ogni giorno [grammi/giorno]
param qmax {S};				# Limite massimo delle sostanze da assumere ogni giorno [grammi/giorno]

#VARIABILI
var x {A} >=0;				# Quantità ottimali di ogni alimento da inserire nella dieta dell’atleta [kg/giorno]

#VINCOLI
# Le quantità delle sostanze nutritive devono essere comprese entro i limiti min e max [grammi/giorno]

subject to Quantita_minima {s in S}:
	sum {a in A} x[a] * q[s,a] >=  qmin[s];

subject to Quantita_massima {s in S}:
	sum {a in A} x[a] * q[s,a] <=  qmax[s];

#OBIETTIVO
# Minimizzare il costo complessivo, che dipende dalle quantità di alimenti scelti [Euro/giorno]
minimize z: sum {a in A} costi[a] * x[a];

###################################
data;

param nS := 3;
param nA := 7;

param q :   1		2		3		4		5		6		7 :=
1           11.5    3.15    8.0     18.5    2.1     12.0     9.0
2           72.7    4.85    3.8     0.5     0.0     68.0     74.0
3            1.5    1.55    11.0    19.0    0.1     6.0      1.0;

param: qmin qmax :=
1        25   35 
2        15   25 
3        10   20 ;

param costi :=
1	4
2	4
3	15
4	22.5
5	3
6	1 
7	5;

end;

