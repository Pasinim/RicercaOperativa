# Esercizio Artiglieria

# DATI

param a;		# Accelerazione di gravità [m/s^2]
param vi;		# Velocità iniziale [m/s]
param xv;		# Coordinata x vetta rocciosa [m]
param yv;		# Coordinata y vetta rocciosa [m]
param yA;		# Altezza dell'altopiano [m]
param xA;		# Da che punto parte l'altopiano [m]

# VARIABILI

var xC >= 0<= 8500 := 1000; # Coordinata x dell'artiglieria
var angolo >= 1 <= 90 := 45;

# VINCOLI

s.t. superaRoccia:
	tan(angolo)*(1 - (a *(xv) )/(vi*sin(2*angolo)) )*(xv) >= 401;

s.t. parteDaZero:
	tan(angolo)*(1 - (a *(xC) )/(vi*sin(2*angolo)) )*(xC) = 0;

s.t. colpisciAltoPiano:
	tan(angolo)*(1 - (a *(xA) )/(vi*sin(2*angolo)) )*(xA) >= yA;

#s.t. versoIlBasso:
#	-a*tan(angolo)/(vi*sin(2*angolo)) <= -1;

# OBIETTIVO

maximize z: (200*tan(89.9)*vi*sin(2*89.9))/(vi*sin(89.9*2)-a)  # Coordinata X max (mettere 45° è meglio)
			-  (200*tan(2*angolo)*vi*sin(2*angolo))/(vi*sin(angolo*2)-a) # Coordinata X min;

#minimize z : angolo;
data;

param a := 9.81;
param vi:= 100;

param xv := 10000;
param yv := 400;

param yA := 200;
param xA := 11000;

end;
