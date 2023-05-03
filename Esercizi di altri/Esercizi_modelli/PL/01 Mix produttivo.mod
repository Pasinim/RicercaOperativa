# Esercizio

# DATI
param P;  # Numero di prodotti
param R;  # Numero di risorse
set Prodotti := 1..P;
set Risorse := 1..R;
param c {Prodotti};          # Profitti unitari [€/v]
param b {Risorse};           # Risorse disponibili [h/sett]
param a {Risorse,Prodotti};  # Tempi di lavorazione [h/v]

# VARIABILI
var x {Prodotti} >= 0;

# VINCOLI
# Il consumo non deve eccedere le risorse disponibili [h/sett]
subject to Consumi {i in Risorse}:
  sum {j in Prodotti} a[i,j] * x[j] <= b[i];

# OBIETTIVO
# Massimizzare i profitti complessivi [€/sett]
maximize z: sum {j in Prodotti} c[j] * x[j];

data; ################

param P := 3;
param R := 5;
param c :=
1  840
2 1120
3 1200
;

param b :=
3  96
1 120
2  80
4 102
5  40
;

param a:1	2	3 :=
1		3	2	1
2		1	2	3
3		2	0	0
4		0	3	0
5		0	0	2
;

end;
