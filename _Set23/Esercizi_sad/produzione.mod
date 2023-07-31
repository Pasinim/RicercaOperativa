# Esercizio produzione

# DATI
param nM;
set M := 1..nM;			# Mesi da pianificare
param cap;				# Capacità produttiva [u]
param cp;				# Costo unitario di produzione [€/u]
param capx;				# Capacità produttiva extra [u]
param cpx;				# Costo unitario di produzione extra [€/u]
param cg;				# Costo unitario di giacenza [€/u]
param d {M};			# Domanda in ogni mese [u]
param y0;				# Scorte iniziali [u]

# VARIABILI
var x {M} >= 0 , <= cap;			# Produzione in ogni mese [u]
var xx {M} >= 0 <= capx;		# Produzione extra in ogni mese [u]
var y {M} >= 0;			# Giacenza alla fine di ogni mese [u]

# VINCOLI

# Conservazione del flusso [u]
s.t. Flow_conservation {m in M : m > 1}:
	y[m-1] + x[m] + xx[m] = d[m] + y[m];

s.t. Flow_conversation0:
	y0 + x[1] + xx[1] = d[1] + y[1];

# OBIETTIVO

# Minimizzare costi complessivi [ €
minimize z: sum{m in M} (cp *x[m] + cpx*xx[m] + cg* y[m]);
#######

data;

param y0 := 0;
param nM := 3;
param cap := 110;
param cp := 300;
param capx := 60;
param cpx := 330;
param cg := 10;
param d :=
1 100
2 130
3 150;

end;
