set P := 1..3; #Insieme dei prodotti ittici
param prezzo{P};
param v{P}; #Volume occupato [cc/kg]
param t{P}; #Tempo di preparazione [min/kg]
param t_max := 45;
param c_max := 50000;
param lim_giornaliero{P}; #[kg/gg]

var x{P} >= 0; #quantita da acqistare [kg]

s.t. limite_tempo:
	sum {p in P} t[p] * x[p] <= t_max;
s.t. limite_cella:
	sum {p in P} v[p] * x[p] <= c_max;
s.t. limite_acquisto {p in P}:
	x[p] <= lim_giornaliero[p];
s.t. limite_acquisto2:
	3*x[1] + 2*x[2] + 2*x[3] <= 120;

maximize profitto:
	sum {p in P} x[p] * prezzo[p];
data;
param: prezzo v t 	lim_giornaliero :=
1	10	10000	11	40
2	7.5	7500	8	60
3	0 12500	10	60
;
end;

