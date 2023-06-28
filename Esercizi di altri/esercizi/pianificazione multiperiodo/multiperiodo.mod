# Esercizione pianificazione multiperiodo

# DATI
set Mesi := 1..4;
param d {Mesi}; # Domanda [ton]
param c {Mesi}; # capacità produttiva del mese[ton]
param p {Mesi}; # prezzo ingredienti [$/ton]
param s {Mesi}; #  costo unitario di stoccaggio mensile [$/ton]
param y0;       # scorte iniziali



#VARIABILI
var x {i in Mesi} >= 0 , <= c[i]; # Produzione mensile di gelato [ton]
var y {Mesi} >= 0; # stock di gelato alla fine del mese[ton]

# VINCOLI
# conservazione del flusso [ton]
subject to Flow_conservation {i in Mesi: i >1 }:
    y[i-1]+x[i] = d[i]+y[i];

subject to Flow_conservation1:
    y0 + x[1] = d[1]+y[1];


# OBIETTIVO
# minimizzazione costi [$]
minimize z: sum {i in Mesi} (p[i] * x[i] + s[i] * y[i]);



########################
data;

param:	d           c           p           s :=
		
1		200		400		34		2000
2		300		500		36		3000
3		500		300		32		2000
4	400		500		38		3000;

param y0 := 0;
end;