# Esercizio 4: Scommesse sui cavalli

# Dati

set C;						# Cavalli
param quote {C};			# Quote dei cavalli [adim.]
param budget;				# Budget massimo [€]

# Variabili

# Puntate dei singoli cavalli
var Puntate {C} >= 0;
# Minimo
var VincitaMinima >= 0;

# Vincoli

# Vincolo del budget totale
subject to Budget:
	sum {c in C} Puntate[c] <= budget;

# Vincolo del minimo
subject to Minimo {c in C}:
	Puntate[c]*quote[c] >= VincitaMinima;

# Obiettivo

# Masimizzare il minimo vincibile
maximize z: VincitaMinima;

data;

set C := Fulmine, Freccia, Dardo, Lampo;
param quote :=
	Fulmine		3
	Freccia		4
	Dardo		5
	Lampo		6;
param budget := 57;

end;
