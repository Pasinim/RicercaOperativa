# Esercizio Bicchiere D'acqua

# DATI

param h; 			# Altezza del bicchiere			 [cm]
param rB;			# Raggio alla base del bicchiere [cm]
param rO;			# Raggio all'orlo del bicchiere  [cm]

# VARIABILI

var livello >= h/2 <= h;  	# livello dell'acqua [cm]
var p >= 0 <= 1;
var r = rB + livello*(rO-rB)/h;
#var volG = 1/3*(3.14*(r**2)*r*(h/(rO-rB)));
#var volP = 1/3*(3.14*(rB**2)*rB*(h/(rO-rB)));

# VINCOLI

s.t. probabilita:
	p = 2*livello/h - 1;

# OBIETTIVO

maximize z: (1/3)*(3.14*livello*(r**2 + rB**2 + r*rB))*(1-p);

##################################

data;

param h := 8;
param rB := 3;
param rO := 4;

end;

