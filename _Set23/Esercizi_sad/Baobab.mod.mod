# Esercizio Farina di Baobab (PNL)

# DATI
param f;			# Costi fissi [€]
param v;			# Costi variabili di produzione [€/kg]
param V;			# Massima produzione [Kg/m]
param Pmax;			# Massimo prezzo di vendita [€/Kg]
param k;			# Coefficiente [€/sqrt(Kg m)] 

# VARIABILI
var x >= 0, <= V := 70;			# Quantità acquistata, prodotta e venduta [Kg/m]

# OBIETTIVO
# Massimizzare i profitti
maximize z: Pmax * x - v*x - k*sqrt(x);

#s.t. fix : x = v;

#s.t. profitto0:  Pmax * x - v*x - k*sqrt(x) = 0;

#############################
data;

param f := 1000;
param v := 10;		
param V := 70;			
param Pmax := 20;
param k := 80;			
end;
