# Esercizio n.6: La dieta

# Dati

set S;						# Sostanze
set P;						# Piatti
param vn {S,P};				# Valori nutrizionali dei piatti [g/Kg]
param lower {S};			# Limiti inferiori delle sostanze [g/giorno]
param upper {S};			# Limiti superiori delle sostanze [g/giorno]
param costi {P};			# Costi dei piatti [€/Kg]

# Variabili

var x {p in P} >=0; 		# Quantità di piatti [g/giorno]

# Vincoli

# Vincolo inferiore di sostanze per giorno
subject to LowerS {s in S}:
	sum {p in P} vn[s,p]*x[p]/1000 >= lower[s];
# Vincolo superiori di sostanze per giorno
subject to UpperS {s in S}:
	sum {p in P} vn[s,p]*x[p]/1000 <= upper[s];

# Obiettivo

minimize z:
	sum {p in P} x[p]/1000*costi[p];

####################

data;

set S := Prot, Carb, Gr;
set P := Pasta, Latte, Form, Pesce,
	Verd, Pane, Pol;
param vn :
			Pasta	Latte	Form	Pesce	Verd	Pane	Pol :=
	Prot	11.5    3.15    8		18.5	2.1		12.0	9
	Carb	72.7    4.85    3.8		0.5		0		68		74
	Gr		1.5    1.55    11		19		0.1		6		1;
param lower :=
	Prot	25
	Carb	15
	Gr		10;
param upper :=
	Prot	35
	Carb	25
	Gr		20;
param costi :=
	Pasta		4
	Latte		4
	Form		15
	Pesce		22.5
	Verd		3
	Pane		1
	Pol			5;

end;
