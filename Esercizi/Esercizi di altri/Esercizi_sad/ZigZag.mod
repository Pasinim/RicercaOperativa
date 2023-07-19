# Esercizio ZigZag

# DATI

param c;			# Cardinalità della sequenza
set sc := 1..c;				# Insieme dei numeri della sequenza
param s{sc};		# Sequenza

# VARIABILI

var m{sc} binary;	# Minimi locali
var M{sc} binary; 	# Massimi locali

# VINCOLI

s.t. trovaMinimiS{i in sc : i > 1}:
	100*(1-m[i]) >= s[i]-s[i-1];
s.t. trovaMinimiD{i in sc : i < 25}:
	100*(1-m[i]) >= s[i]-s[i+1];

s.t. trovaMassimiS{i in sc : i > 1}:
	100*(1-M[i]) >= s[i-1]-s[i];
s.t. trovaMassimiD{i in sc : i < 25}:
	100*(1-M[i]) >= s[i+1]-s[i];



# OBIETTIVO

maximize z : sum{ i in sc} (m[i]+M[i]);

data;

param c := 25;


param s :=
1 24 
2 28
3 12 
4 45 
5 46 
6 11
7 12 
8 11 
9 37 
10 42 
11 90 
12 93 
13 12 
14 67 
15 69 
16 36 
17 18 
18 94 
19 29 
20 34
21 41 
22 12 
23 15 
24 26 
25 3;

end;
