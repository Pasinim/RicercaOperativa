# DATI

param nR;					    # Numero di robot
set R := 1..nR;					# Insieme dei robot
param raggio{R};				# Raggio dei robot [cm]

# VARIABILI

var posizioneX{R} >= 0;			# Posizione x dei robot sul piano.
var posizioneY{R} >= 0;			# Posizione y dei robot sul piano.

# VINCOLI


# OBIETTIVO

minimize z: somma distanze tra ogni coppia di robot;
#####################
data;

param nR := 6;
param raggio :=
1	120
2	80
3	100
4	70
5	45
6	120;

end;
