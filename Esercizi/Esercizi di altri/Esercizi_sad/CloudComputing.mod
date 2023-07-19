# Esercizio Cloud Computing

# DATI

param nS;
set s := 1..nS;
param cF {s};			# Costo fisso per ogni server
param cU {s};			# Costo orario di utilizzo per server
param h;				# Ore di lavoro richieste

# VARIABILI

var u{s} binary;				# Server utilizzati
var o{s} >= 0;					# Ore di calcolo su server.

# VINCOLI

s.t. utilizzoComplessivo:
	sum{i in s} o[i] >= h;

s.t. utilizzoServer{i in s}:
	o[i] <= u[i]*h;


# OBIETTIVI

minimize z : sum{i in s}( o[i]*cU[i] + cF[i]* u[i]);

###################

data;

param h := 1;
param nS := 4;

param:  cF   	    cU 		:=
1		 0  	  0.640
2	  1560		  0.128
3	  1280		  0.192
4	   552		  0.640;

end;
