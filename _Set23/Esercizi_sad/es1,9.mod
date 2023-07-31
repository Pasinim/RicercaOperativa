# Esercizio 1.9 TEST

# Variabili

var x1 >= 0;
var x2 >= 0;

# Vincoli

s.t. vincoloUno :
	x1 - 2*x2 <= -2;

s.t. vincoloDue :
	-2*x1+x2 <= -4;

s.t. vincoloTre :
	x1 + x2 <= 4;

# Obiettivo

maximize z: x2;

data;

end;
