# Esercizio Cloud Computing lineare
# DATI

param nS;
set s := 1..nS;
param cF {s};			# Costo fisso per ogni server
param cU {s};			# Costo orario di utilizzo per server

# VARIABILI

var w >= 0;				# Spesa
var h >= 0;
# VINCOLI

s.t. vincoloUso{i in s}:
	w <= cF[i] + cU[i]*h;

s.t. vincoloH :
	h = 0;
# OBIETTIVI

maximize z : w;
###################

data;

param nS := 4;

param:  cF   	    cU 		:=
1		 0  	  0.640
2	   552		  0.312
3	  1280		  0.192
4	  1560		  0.128;

end;
